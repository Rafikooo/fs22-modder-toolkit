#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pathlib import Path
from typing import List

from models import FunctionSignature, EnumDefinition


def generate_emmylua_stub_file(
    functions: List[FunctionSignature],
    enums: List[EnumDefinition],
    output_path: Path
) -> None:
    lines = []

    lines.extend(_generate_file_header())
    lines.extend(_generate_all_function_stubs(functions))
    lines.extend(_generate_all_enum_stubs(enums))

    content = '\n'.join(lines)
    output_path.write_text(content, encoding='utf-8')


def _generate_file_header() -> List[str]:
    return [
        '--- Auto-generated FarmingSimulator API stubs for EmmyLua',
        '---',
        '--- Source: GIANTS Software GmbH - Farming Simulator 22 SDK',
        '--- Original file: scriptBinding.xml',
        '--- Generated from: scriptBinding.xml using generate-signatures.py',
        '---',
        '--- This file is a transformative work for educational and development purposes.',
        '--- It provides IDE autocomplete support for the FS22 modding community.',
        '--- Users should own a legitimate copy of Farming Simulator 22.',
        '---',
        '--- Farming Simulator is a trademark of GIANTS Software GmbH.',
        '---',
        '---@meta',
        '',
    ]


def _generate_all_function_stubs(functions: List[FunctionSignature]) -> List[str]:
    lines = []

    for function in functions:
        lines.extend(_generate_function_stub(function))
        lines.append('')

    return lines


def _generate_function_stub(function: FunctionSignature) -> List[str]:
    lines = []

    if function.description:
        for description_line in function.description.splitlines():
            if description_line:
                lines.append(f'--- {description_line}')

    for parameter in function.input_parameters:
        lines.extend(_generate_parameter_annotation(parameter))

    if function.output_parameters:
        lines.append(_generate_return_annotation(function.output_parameters))

    parameter_names = ', '.join(param.name for param in function.input_parameters)
    lines.append(f'function {function.name}({parameter_names}) end')

    return lines


def _generate_parameter_annotation(parameter) -> List[str]:
    if parameter.description:
        return [f'---@param {parameter.name} {parameter.type} {parameter.description}']
    else:
        return [f'---@param {parameter.name} {parameter.type}']


def _generate_return_annotation(output_parameters) -> str:
    return_types = ', '.join(param.type for param in output_parameters)
    return f'---@return {return_types}'


def _generate_all_enum_stubs(enums: List[EnumDefinition]) -> List[str]:
    lines = []

    for enum in enums:
        lines.extend(_generate_enum_stub(enum))
        lines.append('')

    return lines


def _generate_enum_stub(enum: EnumDefinition) -> List[str]:
    lines = [f'---@enum {enum.name}']

    for value in enum.values:
        lines.append(f'{enum.name}.{value} = "{value}"')

    return lines
