#!/usr/bin/env python3
"""
Generate a categorized index file for Lua stubs.

This script creates an init.lua file that organizes all globals into categories
based on SDK usage analysis (same as docs categorization).

Usage:
    python3 generate_stubs_index.py <stubs_dir> <output_file>

Example:
    python3 generate_stubs_index.py \
        features/schema-lua-stubs/outputs \
        features/schema-lua-stubs/outputs/init.lua
"""

import json
import sys
from pathlib import Path
from typing import Dict, List


def load_categorization(data_dir: Path) -> Dict:
    categorization_file = data_dir / 'globals-categorization.json'

    if not categorization_file.exists():
        print(f'Error: Categorization file not found: {categorization_file}')
        print('Run analyze_globals.py first to generate categorization.')
        sys.exit(1)

    with open(categorization_file) as f:
        return json.load(f)


def generate_index_file(stubs_dir: Path, output_file: Path, categorization: Dict) -> None:
    categories = categorization['categories']
    usage_stats = categorization['usage_stats']
    field_counts = categorization['field_counts']

    lines = [
        '---@meta',
        '',
        '--- FS22 Modder Toolkit - Runtime API Stubs',
        '--- Categorized index of all global variables available in Farming Simulator 22',
        '---',
        '--- This file provides IDE autocomplete support by requiring all global stubs.',
        '--- Generated from runtime introspection data.',
        '---',
        '--- Categories:',
        f'---   - Core Globals: {len(categories["core"])} (Used in SDK, complex objects)',
        f'---   - Constants: {len(categories["constants"])} (Used in SDK, simple values)',
        f'---   - Advanced Reference: {len(categories["unused_objects"])} (Not in SDK, but documented)',
        f'---   - Internal/System: {len(categories["unused_constants"])} (Internal use)',
        '---',
        '--- Farming Simulator is a trademark of GIANTS Software GmbH.',
        '',
        '--------------------------------------------------------------------------------',
        '-- CORE GLOBALS',
        '--------------------------------------------------------------------------------',
        '-- These globals are frequently used in the official SDK and have complex',
        '-- structures (managers, systems, subsystems).',
        '--',
        f'-- Total: {len(categories["core"])} globals',
        '--------------------------------------------------------------------------------',
        '',
    ]

    core_globals = sorted(categories['core'])
    for global_name in core_globals:
        usage_count = usage_stats.get(global_name, 0)
        fields = field_counts.get(global_name, 0)
        lines.append(f'--- {global_name} ({usage_count} uses in SDK, {fields} fields)')
        lines.append(f'require("{global_name}")')
        lines.append('')

    lines.extend([
        '--------------------------------------------------------------------------------',
        '-- CONSTANTS',
        '--------------------------------------------------------------------------------',
        '-- Simple values and configuration flags used in the SDK.',
        '--',
        f'-- Total: {len(categories["constants"])} globals',
        '--------------------------------------------------------------------------------',
        '',
    ])

    constants = sorted(categories['constants'])
    for global_name in constants:
        usage_count = usage_stats.get(global_name, 0)
        lines.append(f'--- {global_name} ({usage_count} uses in SDK)')
        lines.append(f'require("{global_name}")')
        lines.append('')

    lines.extend([
        '--------------------------------------------------------------------------------',
        '-- ADVANCED REFERENCE',
        '--------------------------------------------------------------------------------',
        '-- Not used in public SDK, but have documented fields.',
        '-- May be useful for advanced mods.',
        '--',
        f'-- Total: {len(categories["unused_objects"])} globals',
        '--------------------------------------------------------------------------------',
        '',
    ])

    advanced = sorted(categories['unused_objects'])
    for global_name in advanced:
        fields = field_counts.get(global_name, 0)
        lines.append(f'--- {global_name} ({fields} fields)')
        lines.append(f'require("{global_name}")')
        lines.append('')

    lines.extend([
        '--------------------------------------------------------------------------------',
        '-- INTERNAL / SYSTEM',
        '--------------------------------------------------------------------------------',
        '-- Internal engine variables. Generally not used in mods.',
        '--',
        f'-- Total: {len(categories["unused_constants"])} globals',
        '--------------------------------------------------------------------------------',
        '',
    ])

    internal = sorted(categories['unused_constants'])
    for global_name in internal:
        lines.append(f'--- {global_name}')
        lines.append(f'require("{global_name}")')
        lines.append('')

    total_globals = sum(len(cat) for cat in categories.values())
    lines.extend([
        '--------------------------------------------------------------------------------',
        f'-- Total: {total_globals} globals available',
        '-- Generated by FS22 Modder Toolkit',
        '--------------------------------------------------------------------------------',
        '',
    ])

    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text('\n'.join(lines))

    print(f'✓ Generated categorized index: {output_file}')
    print(f'  - Core Globals: {len(core_globals)}')
    print(f'  - Constants: {len(constants)}')
    print(f'  - Advanced Reference: {len(advanced)}')
    print(f'  - Internal/System: {len(internal)}')
    print(f'  - Total: {total_globals}')


def generate_category_files(stubs_dir: Path, categorization: Dict) -> None:
    categories = categorization['categories']
    usage_stats = categorization['usage_stats']
    field_counts = categorization['field_counts']

    core_file = stubs_dir / 'core.lua'
    lines = [
        '---@meta',
        '',
        '--- Core Globals - Most frequently used in FS22 SDK',
        f'--- Total: {len(categories["core"])} globals',
        '',
    ]

    for global_name in sorted(categories['core']):
        usage_count = usage_stats.get(global_name, 0)
        fields = field_counts.get(global_name, 0)
        lines.append(f'--- {global_name} ({usage_count} uses, {fields} fields)')
        lines.append(f'require("{global_name}")')
        lines.append('')

    core_file.write_text('\n'.join(lines))
    print(f'✓ Generated: {core_file.name}')

    constants_file = stubs_dir / 'constants.lua'
    lines = [
        '---@meta',
        '',
        '--- Constants - Simple values used in SDK',
        f'--- Total: {len(categories["constants"])} globals',
        '',
    ]

    for global_name in sorted(categories['constants']):
        usage_count = usage_stats.get(global_name, 0)
        lines.append(f'--- {global_name} ({usage_count} uses)')
        lines.append(f'require("{global_name}")')
        lines.append('')

    constants_file.write_text('\n'.join(lines))
    print(f'✓ Generated: {constants_file.name}')

    advanced_file = stubs_dir / 'advanced.lua'
    lines = [
        '---@meta',
        '',
        '--- Advanced Reference - Not in SDK but documented',
        f'--- Total: {len(categories["unused_objects"])} globals',
        '',
    ]

    for global_name in sorted(categories['unused_objects']):
        fields = field_counts.get(global_name, 0)
        lines.append(f'--- {global_name} ({fields} fields)')
        lines.append(f'require("{global_name}")')
        lines.append('')

    advanced_file.write_text('\n'.join(lines))
    print(f'✓ Generated: {advanced_file.name}')


def main() -> None:
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)

    stubs_dir = Path(sys.argv[1])
    output_file = Path(sys.argv[2])

    if not stubs_dir.exists():
        print(f'Error: Stubs directory not found: {stubs_dir}')
        sys.exit(1)

    repo_root = Path(__file__).parent.parent.parent
    data_dir = repo_root / 'data'

    try:
        categorization = load_categorization(data_dir)

        generate_index_file(stubs_dir, output_file, categorization)

        generate_category_files(stubs_dir, categorization)

    except Exception as e:
        print(f'Error: {e}')
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()
