#!/usr/bin/env python3
"""
Analyze which globals are actually used in the FS22 SDK scripts.
Creates a JSON file with categorization of globals.
"""

import json
import re
from pathlib import Path
from typing import Dict, List, Set
from collections import defaultdict


def get_all_globals(docs_dir: Path) -> Dict[str, int]:
    globals_info = {}

    for md_file in docs_dir.glob('g_*.md'):
        global_name = md_file.stem

        content = md_file.read_text()
        match = re.search(r'^Total fields: \*\*(\d+)\*\*', content, re.MULTILINE)
        if match:
            field_count = int(match.group(1))
            globals_info[global_name] = field_count

    return globals_info


def find_global_usage(scripts_dir: Path, global_name: str) -> int:
    count = 0

    for lua_file in scripts_dir.rglob('*.lua'):
        try:
            content = lua_file.read_text(encoding='utf-8', errors='ignore')
            pattern = r'\b' + re.escape(global_name) + r'\b'
            matches = re.findall(pattern, content)
            count += len(matches)
        except Exception:
            continue

    return count


def categorize_globals(globals_info: Dict[str, int], scripts_dir: Path) -> Dict:
    categories = {
        'core': [],           # Used in SDK, has fields
        'constants': [],      # Used in SDK, 0 fields (simple values)
        'unused_objects': [], # Not used in SDK, has fields
        'unused_constants': [] # Not used in SDK, 0 fields
    }

    usage_stats = {}

    print(f"Analyzing {len(globals_info)} globals...")

    for i, (global_name, field_count) in enumerate(sorted(globals_info.items()), 1):
        if i % 20 == 0:
            print(f"  Progress: {i}/{len(globals_info)}")

        usage_count = find_global_usage(scripts_dir, global_name)
        usage_stats[global_name] = usage_count

        is_used = usage_count > 0
        has_fields = field_count > 0

        if is_used and has_fields:
            categories['core'].append(global_name)
        elif is_used and not has_fields:
            categories['constants'].append(global_name)
        elif not is_used and has_fields:
            categories['unused_objects'].append(global_name)
        else:
            categories['unused_constants'].append(global_name)

    print("\nCategorization complete!")
    print(f"  Core globals (used, has fields): {len(categories['core'])}")
    print(f"  Constants (used, no fields): {len(categories['constants'])}")
    print(f"  Unused objects (not used, has fields): {len(categories['unused_objects'])}")
    print(f"  Unused constants (not used, no fields): {len(categories['unused_constants'])}")

    return {
        'categories': categories,
        'usage_stats': usage_stats,
        'field_counts': globals_info
    }


def main():
    docs_dir = Path('/Users/rafik/Sites/fs22-modder-toolkit/dist/docs/docs')
    scripts_dir = Path('/Users/rafik/Sites/fs22-modder-toolkit/fs22-data-source/scripts')
    output_file = Path('/Users/rafik/Sites/fs22-modder-toolkit/data/globals-categorization.json')

    print("Reading globals from documentation...")
    globals_info = get_all_globals(docs_dir)
    print(f"Found {len(globals_info)} globals")

    print(f"\nAnalyzing SDK scripts in {scripts_dir}...")
    result = categorize_globals(globals_info, scripts_dir)

    output_file.parent.mkdir(parents=True, exist_ok=True)
    with open(output_file, 'w') as f:
        json.dump(result, f, indent=2, sort_keys=True)

    print(f"\nResults saved to: {output_file}")

    print("\n=== Examples ===")
    print("\nMost used core globals:")
    core_usage = [(g, result['usage_stats'][g]) for g in result['categories']['core']]
    for global_name, count in sorted(core_usage, key=lambda x: x[1], reverse=True)[:10]:
        fields = result['field_counts'][global_name]
        print(f"  {global_name}: {count} uses, {fields} fields")

    print("\nUnused but has fields (should review):")
    for global_name in result['categories']['unused_objects'][:10]:
        fields = result['field_counts'][global_name]
        print(f"  {global_name}: {fields} fields, 0 uses")


if __name__ == '__main__':
    main()
