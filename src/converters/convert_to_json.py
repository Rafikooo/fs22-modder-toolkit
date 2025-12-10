#!/usr/bin/env python3
"""
Convert runtime-introspected XML schemas to JSON format.

Usage:
    python3 convert_to_json.py <input.xml> <output.json>

Example:
    python3 convert_to_json.py \
        ../runtime-inspector/schemas/v2/session_2025_11_10_09/g_currentMission/g_currentMission_depth3.xml \
        outputs/g_currentMission.json
"""

import json
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Any, Dict, List, Optional


def parse_field(field_elem: ET.Element) -> Dict[str, Any]:
    result: Dict[str, Any] = {
        'key': field_elem.get('key'),
        'type': field_elem.get('type'),
    }

    if field_elem.get('class'):
        result['class'] = field_elem.get('class')
    if field_elem.get('ref'):
        result['ref'] = field_elem.get('ref')
    if field_elem.get('length'):
        result['length'] = int(field_elem.get('length'))
    if field_elem.get('valuetype'):
        result['valuetype'] = field_elem.get('valuetype')
    if field_elem.get('firstExportedAt'):
        result['firstExportedAt'] = field_elem.get('firstExportedAt')
    if field_elem.get('instanceNumber'):
        result['instanceNumber'] = int(field_elem.get('instanceNumber'))

    children = field_elem.findall('field')
    if children:
        result['fields'] = [parse_field(child) for child in children]

    return result


def convert_xml_to_json(xml_path: Path, json_path: Path) -> None:
    tree = ET.parse(xml_path)
    root = tree.getroot()

    result = {
        'name': root.get('name'),
        'type': root.get('type'),
        'timestamp': root.get('timestamp'),
        'depth': int(root.get('depth')),
        'fields': []
    }

    if root.get('class'):
        result['class'] = root.get('class')

    for field in root.findall('field'):
        result['fields'].append(parse_field(field))

    json_path.parent.mkdir(parents=True, exist_ok=True)
    json_path.write_text(
        json.dumps(result, indent=2, ensure_ascii=False) + '\n'
    )

    print(f'✓ Converted: {xml_path.name} -> {json_path.name}')


def main() -> None:
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)

    xml_path = Path(sys.argv[1])
    json_path = Path(sys.argv[2])

    if not xml_path.exists():
        print(f'Error: Input file not found: {xml_path}')
        sys.exit(1)

    try:
        convert_xml_to_json(xml_path, json_path)
    except Exception as e:
        print(f'Error: {e}')
        sys.exit(1)


if __name__ == '__main__':
    main()
