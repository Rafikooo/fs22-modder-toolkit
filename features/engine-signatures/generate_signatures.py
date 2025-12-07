#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
from pathlib import Path

from xml_parser import parse_scriptbinding_xml
from emmylua_generator import generate_emmylua_stub_file


def main() -> None:
    if len(sys.argv) != 3:
        print_usage_and_exit()

    input_xml_path = Path(sys.argv[1])
    output_lua_path = Path(sys.argv[2])

    if not input_xml_path.exists():
        print(f'Error: Input file does not exist: {input_xml_path}')
        print()
        print('Expected location: ../../fs22-data-source/scriptBinding.xml')
        print('Copy it from your FS22 installation:')
        print('  macOS:   ~/Library/Application Support/Steam/steamapps/common/')
        print('           Farming Simulator 22/.../sdk/debugger/scriptBinding.xml')
        print('  Windows: C:\\Program Files\\...\\Farming Simulator 22\\sdk\\debugger\\scriptBinding.xml')
        sys.exit(1)

    if not input_xml_path.suffix == '.xml':
        print(f'Error: Input file must be XML: {input_xml_path}')
        sys.exit(1)

    try:
        functions, enums = parse_scriptbinding_xml(input_xml_path)
    except Exception as error:
        print(f'Error: Failed to parse XML file: {error}')
        sys.exit(1)

    try:
        generate_emmylua_stub_file(functions, enums, output_lua_path)
    except Exception as error:
        print(f'Error: Failed to generate output file: {error}')
        sys.exit(1)

    print(f'✓ Generated EmmyLua stub: {output_lua_path}')
    print(f'  Functions: {len(functions)}')
    print(f'  Enums: {len(enums)}')


def print_usage_and_exit() -> None:
    program_name = Path(sys.argv[0]).name
    print(f'Usage: python3 {program_name} <input-xml> <output-lua>')
    print()
    print('Example:')
    print(f'  python3 {program_name} ../../fs22-data-source/scriptBinding.xml output.lua')
    sys.exit(1)


if __name__ == '__main__':
    main()
