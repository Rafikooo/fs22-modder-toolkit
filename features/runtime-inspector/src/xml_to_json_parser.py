#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
RI XML -> JSON converter with "lens" summaries for large arrays.

Wspiera dwa kształty wejścia:
 - OLD dump:   <global ...> ... <field key=...> / <table key=...>
 - SIGNATURE:  <signature ...> ... <table name=...> / <field name=...> / <array ...>

Wyjście (domyślnie z wrapem):
{
  "metadata": {...},
  "<globalName>": {...}
}
"""

import argparse, json, os, sys
import xml.etree.ElementTree as ET
from collections import Counter
from datetime import datetime

# ---------- helpers ----------

def to_bool(s: str) -> bool:
    return str(s).lower() in ("true", "1", "yes")

def parse_scalar(ftype: str, value: str):
    if ftype == "boolean":
        return to_bool(value)
    if ftype == "number":
        try:
            f = float(value)
            if abs(f - int(f)) < 1e-9:
                return int(f)
            return f
        except Exception:
            return value
    if ftype == "string":
        return value or ""
    return f"<{ftype or 'unknown'}>"

def looks_like_int_key(k) -> bool:
    # bezpiecznie przyjmuje None
    return isinstance(k, str) and k.isdigit()

def get_name_or_key(el) -> str | None:
    # Preferuj 'name' (signature), a potem 'key' (old dump)
    return el.get("name") or el.get("key")

def shallow_table_sample(table_el, max_fields=12):
    out = {}
    for ch in table_el:
        if ch.tag != "field":
            continue
        k = get_name_or_key(ch)
        if not k:
            continue
        t = ch.get("type")
        v = parse_scalar(t, ch.get("value", ""))
        out[k] = v
        if len(out) >= max_fields:
            break
    return out

def infer_schema(samples):
    types = {}
    for s in samples:
        for k, v in s.items():
            tn = type(v).__name__
            if k in types and types[k] != tn:
                types[k] = "mixed"
            else:
                types[k] = tn
    return types

def summarize_array(children, samples_cnt=5, schema_scan=40):
    type_counter = Counter()
    scalars_seen = 0
    samples = []
    flat_samples_for_schema = []

    for idx, el in children:
        type_counter[el.tag] += 1
        if el.tag == "table":
            smp = shallow_table_sample(el, max_fields=12)
            samples.append({"index": idx, "sample": smp})
            flat_samples_for_schema.append(smp)
        elif el.tag == "field":
            t = el.get("type")
            v = parse_scalar(t, el.get("value", ""))
            samples.append({"index": idx, "sample": v})
            scalars_seen += 1
        if len(flat_samples_for_schema) >= schema_scan and scalars_seen >= schema_scan:
            break

    schema = infer_schema(flat_samples_for_schema)
    return {
        "__kind": "arraySummary",
        "length": len(children),
        "byNodeTag": dict(type_counter),
        "schema": schema,
        "samples": samples[:samples_cnt],
    }

# ---------- OLD <global> dump parser ----------

def table_to_obj(table_el, threshold=100, samples=5, schema_scan=40):
    # obsługuje stare drzewo: tabela ma dzieci <field key=...> i <table key=...>
    if table_el.get("maxDepthReached") == "true":
        return {"__maxDepthReached": True}
    if table_el.get("empty") == "true":
        return []

    items = []
    for ch in table_el:
        if ch.tag not in ("field", "table"):
            # ignoruj inne (np. 'array' – w old dumpie nie występuje)
            continue
        k = get_name_or_key(ch)
        if ch.tag == "field":
            v = parse_scalar(ch.get("type"), ch.get("value", ""))
            items.append((k, v, "field", ch))
        elif ch.tag == "table":
            items.append((k, ch, "table", ch))

    # jeśli któryś element nie ma klucza, nie traktuj tego jako tablicy
    if len(items) > 0 and all(looks_like_int_key(k) for k, *_ in items if k is not None):
        # upewnij się, że żaden k nie jest None
        if all(k is not None for k, *_ in items):
            children = sorted(((int(k), el) for k, el, kind, _ in items), key=lambda kv: kv[0])
            if len(children) > threshold:
                return summarize_array(children, samples_cnt=samples, schema_scan=schema_scan)
            out = []
            for idx, el in children:
                if isinstance(el, ET.Element) and el.tag == "table":
                    out.append(table_to_obj(el, threshold, samples, schema_scan))
                else:
                    out.append(el)
            return out

    out = {}
    for k, val, kind, el in items:
        # jeżeli nie mamy nazwy → pomiń węzeł (byłby nieadresowalny)
        if not k:
            continue
        if kind == "field":
            out[k] = val
        else:
            out[k] = table_to_obj(el, threshold, samples, schema_scan)
    return out

def parse_global_element(global_el, threshold, samples, schema_scan):
    """
    OLD dump: <global name="..." nodeCount="..." isServer="...">...</global>
    Zwraca (name, metadata_dict, payload_dict).
    """
    name = global_el.get("name")
    node_count = int(global_el.get("nodeCount", "0"))
    is_server = to_bool(global_el.get("isServer", "false"))

    payload = {}
    for ch in global_el:
        if ch.tag == "field":
            k = get_name_or_key(ch)
            if not k:
                continue
            payload[k] = parse_scalar(ch.get("type"), ch.get("value", ""))
        elif ch.tag == "table":
            k = get_name_or_key(ch)
            if not k:
                continue
            payload[k] = table_to_obj(ch, threshold, samples, schema_scan)

    metadata = {
        "name": name,
        "nodeCount": node_count,
        "isServer": is_server
    }
    return name, metadata, payload

# ---------- SIGNATURE parser ----------

def parse_signature_array(array_el):
    out = {
        "__kind": "array",
        "lengthHint": int(array_el.get("lengthHint", "0")),
        "elementType": array_el.get("elementType"),
    }
    elem_schema = array_el.find("elementSchema")
    if elem_schema is not None:
        schema = {}
        for f in elem_schema.findall("field"):
            fname = get_name_or_key(f)
            ftype = f.get("type")
            if not fname:
                continue
            entry = {"type": ftype}
            if to_bool(f.get("optional", "false")):
                entry["optional"] = True
            schema[fname] = entry
        out["elementSchema"] = schema
    return out

def parse_signature_table(table_el):
    obj = {}

    # oznaczenia tabeli
    if to_bool(table_el.get("skipped", "false")):
        return {"__skipped": True, "reason": table_el.get("reason")}
    if to_bool(table_el.get("alreadySeen", "false")):
        obj["__alreadySeen"] = True
    if to_bool(table_el.get("maxDepthReached", "false")):
        obj["__maxDepthReached"] = True
    if table_el.get("kind"):
        obj["__kind"] = table_el.get("kind")

    # dzieci: field / table / array
    for ch in table_el:
        tag = ch.tag
        if tag == "field":
            k = get_name_or_key(ch)
            if not k:
                continue
            entry = {"type": ch.get("type")}
            if to_bool(ch.get("optional", "false")):
                entry["optional"] = True
            if to_bool(ch.get("skipped", "false")):
                entry = {"__skipped": True, "reason": ch.get("reason")}
            obj[k] = entry
        elif tag == "table":
            k = get_name_or_key(ch)
            if not k:
                continue
            obj[k] = parse_signature_table(ch)
        elif tag == "array":
            k = ch.get("name") or get_name_or_key(ch)
            if not k:
                # bez nazwy nie mamy gdzie włożyć – pomijamy
                continue
            obj[k] = parse_signature_array(ch)
        else:
            # ignoruj inne tagi
            pass

    return obj

def parse_signature_root(root_el):
    """
    SIGNATURE: <signature name="..." depth="..." isServer="..."> <table name="..."> ... </table> </signature>
    """
    name = root_el.get("name")
    is_server = to_bool(root_el.get("isServer", "false"))
    depth = int(root_el.get("depth", "0"))

    payload = {}
    for ch in root_el:
        if ch.tag == "table":
            k = get_name_or_key(ch) or name or "root"
            payload[k] = parse_signature_table(ch)
        elif ch.tag == "field":
            k = get_name_or_key(ch)
            if k:
                payload[k] = {"type": ch.get("type")}
        elif ch.tag == "array":
            k = ch.get("name") or get_name_or_key(ch)
            if k:
                payload[k] = parse_signature_array(ch)

    metadata = {
        "name": name,
        "isServer": is_server,
        "depth": depth,
        "nodeCount": None,  # signature nie raportuje nodeCount
    }
    return name, metadata, payload

# ---------- convert / IO ----------

def convert_one(xml_path, threshold, samples, schema_scan, wrap=True, pretty=False):
    tree = ET.parse(xml_path)
    root = tree.getroot()

    if root.tag == "global":
        name, meta, payload = parse_global_element(root, threshold, samples, schema_scan)
    elif root.tag == "signature":
        name, meta, payload = parse_signature_root(root)
    else:
        raise ValueError(f"Nieznany root tag: <{root.tag}> (spodziewano <global> albo <signature>)")

    # metadata+
    meta_out = dict(meta)
    meta_out["sourceFile"] = os.path.abspath(xml_path)
    meta_out["generatedAt"] = datetime.utcnow().isoformat(timespec="seconds") + "Z"

    if wrap:
        obj = {"metadata": meta_out, name: payload}
    else:
        obj = payload
        obj["__name"] = name
        if meta.get("nodeCount") is not None:
            obj["__nodeCount"] = meta["nodeCount"]
        obj["__isServer"] = meta.get("isServer")

    return obj

def write_json(obj, out_path, pretty=False):
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(obj, f, ensure_ascii=False, indent=2 if pretty else None)
    return out_path

def main():
    ap = argparse.ArgumentParser(description="Convert RI XML dump(s) to JSON with array summaries.")
    ap.add_argument("xml", nargs="+", help="Input XML file(s) produced by RuntimeInspector")
    ap.add_argument("-o", "--out", help="Output JSON file (default: for single input, alongside the XML; for multi, 'merged.json')")
    ap.add_argument("--threshold", type=int, default=100, help="Array lens threshold (expand fully if <= threshold) [OLD dump only]")
    ap.add_argument("--samples", type=int, default=5, help="How many samples to include in array summaries [OLD dump only]")
    ap.add_argument("--schema-scan", type=int, default=40, help="How many early items to scan for schema [OLD dump only]")
    ap.add_argument("--pretty", action="store_true", help="Pretty-print JSON")
    ap.add_argument("--no-wrap", action="store_true", help="Do not wrap to {metadata, <globalName>} (legacy flat shape)")
    args = ap.parse_args()

    wrap = not args.no_wrap

    if len(args.xml) == 1:
        xml_path = args.xml[0]
        out = args.out or os.path.splitext(xml_path)[0] + ".json"
        obj = convert_one(xml_path, args.threshold, args.samples, args.schema_scan, wrap=wrap, pretty=args.pretty)
        path = write_json(obj, out, pretty=args.pretty)
        print(f"OK → {path}")
        return

    docs = []
    for xml_path in args.xml:
        docs.append(convert_one(xml_path, args.threshold, args.samples, args.schema_scan, wrap=True, pretty=args.pretty))

    out = args.out or "merged.json"
    path = write_json(docs, out, pretty=args.pretty)
    print(f"OK → {path}")

if __name__ == "__main__":
    sys.setrecursionlimit(10000)
    main()
