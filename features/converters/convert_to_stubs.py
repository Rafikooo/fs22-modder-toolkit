#!/usr/bin/env python3
"""
Convert runtime-introspected XML schemas to EmmyLua stub files for IDE autocomplete.

Generates full nested class hierarchy for all fields (depth 1-3).
Global references are marked with comments pointing to other files.

Usage:
    python3 convert_to_stubs.py <input.xml> <output.lua>

Example:
    python3 convert_to_stubs.py \
        ../runtime-inspector/schemas/v2/session_2025_11_10_09/g_currentMission/g_currentMission_depth3.xml \
        outputs/g_currentMission.lua
"""

import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


def format_class_name(class_name: str) -> str:
    """
    Format class name for EmmyLua.
    Wrap in quotes if contains dots (for namespaced names).
    """
    if '.' in class_name:
        return f'"{class_name}"'
    return class_name


class ClassCollector:
    def __init__(self, global_name: str):
        self.global_name = global_name
        self.classes: Dict[str, List[Tuple[str, str, Optional[str]]]] = {}
        self.class_counter = 0
        self.named_classes: Set[str] = set()

    def xml_type_to_lua_type(self, xml_type: str, class_name: Optional[str] = None) -> str:
        if class_name and not class_name.startswith('Class_'):
            return class_name

        type_map = {
            'string': 'string',
            'number': 'number',
            'boolean': 'boolean',
            'function': 'function',
            'userdata': 'userdata',
            'table': 'table',
            'array': 'table',
            'map': 'table',
            'global-ref': 'table',
            'cycle': 'table',
            'class-instance': 'table',
            'class-first-instance': 'table',
        }
        return type_map.get(xml_type, 'any')

    def generate_class_name(self, field_key: str, parent_path: str = '') -> str:
        """
        Generate a descriptive class name for nested tables.
        Uses dot notation for better readability: "g_currentMission.FieldGroundSystem"
        """
        # Capitalize first letter of each word (camelCase to PascalCase)
        parts = field_key.replace('_', ' ').title().replace(' ', '')

        if parent_path:
            class_name = f"{parent_path}.{parts}"
        else:
            class_name = f"{self.global_name}.{parts}"

        if class_name in self.named_classes:
            self.class_counter += 1
            class_name = f"{class_name}_{self.class_counter}"

        self.named_classes.add(class_name)
        return class_name

    def collect_field_as_class(
        self,
        field_elem: ET.Element,
        class_name: str,
        parent_path: str = ''
    ) -> None:
        """
        Collect a field's children as a class definition.
        Recursively creates nested classes for table/array children.
        """
        if class_name not in self.classes:
            self.classes[class_name] = []

        children = field_elem.findall('field')
        for child in children:
            child_key = child.get('key', '')
            child_type = child.get('type', '')
            child_class = child.get('class')

            if child_type == 'global-ref':
                ref_path = child.get('refPath', '')
                lua_type = 'table'
                comment = f' -- Reference to {ref_path}'
                self.classes[class_name].append((child_key, lua_type, comment))
                continue

            child_children = child.findall('field')
            needs_nested_class = (
                child_children and
                child_type in ('table', 'array', 'class-instance', 'class-first-instance')
            )

            if needs_nested_class:
                if child_class and not child_class.startswith('Class_'):
                    nested_class_name = child_class
                else:
                    nested_class_name = self.generate_class_name(
                        child_key,
                        f"{parent_path}_{class_name}" if parent_path else class_name
                    )

                comment = None
                if child_type == 'array':
                    array_len = child.get('length')
                    if array_len:
                        comment = f' -- Array (length: {array_len})'

                self.classes[class_name].append((child_key, nested_class_name, comment))

                self.collect_field_as_class(child, nested_class_name, class_name)
            else:
                lua_type = self.xml_type_to_lua_type(child_type, child_class)
                comment = None

                if child_type == 'array':
                    array_len = child.get('length')
                    if array_len:
                        comment = f' -- Array (length: {array_len})'

                self.classes[class_name].append((child_key, lua_type, comment))

    def collect_all_classes(self, root: ET.Element) -> None:
        """
        Collect all class definitions from the root element.
        Creates nested classes for all table/array fields.
        """
        # First collect named classes (Farm, Player, etc.)
        self._collect_named_classes(root)

        # Then collect the main global class with full nesting
        top_level_fields = root.findall('field')
        global_class_name = f"{self.global_name}_Global"

        if global_class_name not in self.classes:
            self.classes[global_class_name] = []

        for field in top_level_fields:
            field_key = field.get('key', '')
            field_type = field.get('type', '')
            field_class = field.get('class')

            if field_type == 'global-ref':
                ref_path = field.get('refPath', '')
                self.classes[global_class_name].append((field_key, 'table', f' -- Reference to {ref_path}'))
                continue

            children = field.findall('field')
            needs_nested_class = (
                children and
                field_type in ('table', 'array', 'class-instance', 'class-first-instance')
            )

            if needs_nested_class:
                if field_class and not field_class.startswith('Class_'):
                    nested_class_name = field_class
                else:
                    nested_class_name = self.generate_class_name(field_key)

                comment = None
                if field_type == 'array':
                    array_len = field.get('length')
                    if array_len:
                        comment = f' -- Array (length: {array_len})'

                self.classes[global_class_name].append((field_key, nested_class_name, comment))

                self.collect_field_as_class(field, nested_class_name)
            else:
                lua_type = self.xml_type_to_lua_type(field_type, field_class)
                comment = None

                if field_type == 'array':
                    array_len = field.get('length')
                    if array_len:
                        comment = f' -- Array (length: {array_len})'

                self.classes[global_class_name].append((field_key, lua_type, comment))

    def _collect_named_classes(self, elem: ET.Element) -> None:
        """Collect explicitly named classes (Farm, Player, etc.) for deduplication."""
        for field in elem.findall('.//field[@class]'):
            class_name = field.get('class')
            if class_name and not class_name.startswith('Class_'):
                if class_name not in self.classes:
                    self.classes[class_name] = []
                    children = field.findall('field')
                    for child in children:
                        child_key = child.get('key', '')
                        child_type = child.get('type', '')
                        child_class = child.get('class')
                        lua_type = self.xml_type_to_lua_type(child_type, child_class)
                        self.classes[class_name].append((child_key, lua_type, None))
                self.named_classes.add(class_name)


def generate_emmylua_stub(xml_path: Path, output_path: Path) -> None:
    tree = ET.parse(xml_path)
    root = tree.getroot()

    global_name = root.get('name', 'unknown')
    depth = root.get('depth', '?')
    timestamp = root.get('timestamp', 'unknown')

    lines = [
        '---@meta',
        '',
        f'--- Runtime-introspected API for {global_name}',
        f'--- Source: {timestamp} (depth {depth})',
        f'--- Generated from XML schema by schema-lua-stubs converter',
        '',
        f'--- Full nested class hierarchy with {depth} levels of depth.',
        f'--- Global references point to other files (e.g., g_achievementManager.lua).',
        '',
        '--- This file provides IDE autocomplete support.',
        '--- Farming Simulator is a trademark of GIANTS Software GmbH.',
        '',
    ]

    collector = ClassCollector(global_name)
    collector.collect_all_classes(root)

    named_classes = sorted([c for c in collector.classes.keys() if c in collector.named_classes])
    generated_classes = sorted([c for c in collector.classes.keys() if c not in collector.named_classes and c != f"{global_name}_Global"])
    global_class = f"{global_name}_Global"

    for class_name in named_classes:
        fields = collector.classes[class_name]
        if not fields:
            continue

        formatted_name = format_class_name(class_name)
        lines.append(f'---@class {formatted_name}')

        seen_fields: Set[str] = set()
        for field_key, lua_type, comment in fields:
            if field_key not in seen_fields:
                comment_str = comment if comment else ''
                formatted_type = format_class_name(lua_type) if lua_type in collector.classes else lua_type
                lines.append(f'---@field {field_key} {formatted_type}{comment_str}')
                seen_fields.add(field_key)

        lines.append('')

    for class_name in generated_classes:
        fields = collector.classes[class_name]
        if not fields:
            continue

        formatted_name = format_class_name(class_name)
        lines.append(f'---@class {formatted_name}')

        for field_key, lua_type, comment in fields:
            comment_str = comment if comment else ''
            formatted_type = format_class_name(lua_type) if lua_type in collector.classes else lua_type
            lines.append(f'---@field {field_key} {formatted_type}{comment_str}')

        lines.append('')

    if global_class in collector.classes:
        fields = collector.classes[global_class]
        top_level_count = len(fields)

        lines.append(f'--- Global {global_name} instance with {top_level_count} top-level fields')
        formatted_global = format_class_name(global_class)
        lines.append(f'---@class {formatted_global}')

        for field_key, lua_type, comment in fields:
            comment_str = comment if comment else ''
            formatted_type = format_class_name(lua_type) if lua_type in collector.classes else lua_type
            lines.append(f'---@field {field_key} {formatted_type}{comment_str}')

        lines.append('')
        lines.append(f'---@type {global_class}')
        lines.append(f'{global_name} = {{}}')
        lines.append('')

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text('\n'.join(lines))

    print(f'✓ Generated stub: {xml_path.name} -> {output_path.name}')


def main() -> None:
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)

    xml_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])

    if not xml_path.exists():
        print(f'Error: Input file not found: {xml_path}')
        sys.exit(1)

    try:
        generate_emmylua_stub(xml_path, output_path)
    except Exception as e:
        print(f'Error: {e}')
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()
