#!/usr/bin/env python3
"""
Analyze duplicate structures in exported XML schemas.
Detects homogeneous objects (same structure repeated multiple times).
"""

import xml.etree.ElementTree as ET
from pathlib import Path
from collections import defaultdict
import json


def get_structure_signature(field_elem):
    """
    Generate a signature for a field's structure.
    Returns: tuple of (child_key, child_type) sorted
    """
    children = []
    for child in field_elem.findall('field'):
        key = child.get('key', '')
        ftype = child.get('type', '')
        children.append((key, ftype))

    return tuple(sorted(children))


def analyze_duplicates(xml_file):
    """
    Analyze XML export for duplicate structures.
    Returns: dict with statistics about duplicates
    """
    tree = ET.parse(xml_file)
    root = tree.getroot()

    # Track structure signatures
    # signature -> [(parent_path, key), ...]
    structures = defaultdict(list)

    # Track field paths for context
    def walk(elem, path=""):
        if elem.tag != 'field':
            # Handle root export element
            for child in elem:
                walk(child, path)
            return

        key = elem.get('key', '')
        current_path = f"{path}.{key}" if path else key
        ftype = elem.get('type', '')

        # Only analyze tables (objects) with children
        if ftype == 'table' and len(elem) > 0:
            signature = get_structure_signature(elem)

            # Only track if has children (not empty tables)
            if signature:
                structures[signature].append((path, key, len(elem)))

        # Recurse
        for child in elem:
            walk(child, current_path)

    walk(root)

    # Find duplicates (structures that appear more than once)
    duplicates = {}
    for signature, occurrences in structures.items():
        if len(occurrences) >= 3:  # At least 3 instances
            # Get sample structure
            sample_parent, sample_key, field_count = occurrences[0]

            duplicates[sample_key] = {
                'count': len(occurrences),
                'field_count': field_count,
                'sample_structure': list(signature),
                'occurrences': [
                    {'parent': parent, 'key': key}
                    for parent, key, _ in occurrences[:20]  # First 20
                ]
            }

    return duplicates


def main():
    # Use modSettings directory (where actual exports go)
    from pathlib import Path
    import sys

    home = Path.home()
    schema_dir = home / "Library/Application Support/FarmingSimulator2022/modSettings/FS22_RuntimeInspector/v2"

    # Allow specifying session via command line
    if len(sys.argv) > 1:
        session_name = sys.argv[1]
        latest_session = schema_dir / session_name
        if not latest_session.exists():
            print(f"Session {session_name} not found")
            return
    else:
        # Find session with most recent depth4 file
        best_session = None
        best_time = 0

        for session_dir in schema_dir.iterdir():
            if not session_dir.is_dir():
                continue

            depth4 = session_dir / "g_currentMission" / "g_currentMission_depth4.xml"
            if depth4.exists():
                mtime = depth4.stat().st_mtime
                if mtime > best_time:
                    best_time = mtime
                    best_session = session_dir

        if not best_session:
            print("No sessions with depth4 found")
            return

        latest_session = best_session

    print(f"Analyzing session: {latest_session.name}\n")

    # Analyze each depth
    mission_dir = latest_session / "g_currentMission"

    all_results = {}

    for depth in range(1, 9):
        xml_file = mission_dir / f"g_currentMission_depth{depth}.xml"

        if not xml_file.exists():
            continue

        print(f"=== Depth {depth}: {xml_file.name} ===")

        duplicates = analyze_duplicates(xml_file)

        # Sort by occurrence count
        sorted_dupes = sorted(
            duplicates.items(),
            key=lambda x: x[1]['count'],
            reverse=True
        )

        print(f"Found {len(sorted_dupes)} duplicate structure patterns\n")

        # Show top 10
        for i, (sample_key, info) in enumerate(sorted_dupes[:10], 1):
            print(f"{i}. '{sample_key}' pattern:")
            print(f"   Occurrences: {info['count']}")
            print(f"   Fields: {info['field_count']}")
            print(f"   Sample locations:")
            for occ in info['occurrences'][:5]:
                parent = occ['parent'] or '(root)'
                print(f"     - {parent}.{occ['key']}")
            print()

        all_results[f"depth_{depth}"] = {
            'file': xml_file.name,
            'total_patterns': len(sorted_dupes),
            'top_duplicates': [
                {
                    'pattern': key,
                    'count': info['count'],
                    'fields': info['field_count'],
                    'structure': info['sample_structure'][:10],  # First 10 fields
                    'sample_locations': info['occurrences'][:10]
                }
                for key, info in sorted_dupes[:20]
            ]
        }

    # Save detailed report
    report_file = latest_session / "duplicate_analysis.json"
    with open(report_file, 'w') as f:
        json.dump(all_results, f, indent=2)

    print(f"\nDetailed report saved to: {report_file}")


if __name__ == '__main__':
    main()
