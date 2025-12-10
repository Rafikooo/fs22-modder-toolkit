#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import xml.etree.ElementTree as ET
from pathlib import Path
from typing import List

from models import FunctionSignature, Parameter, EnumDefinition
from name_sanitizer import sanitize_lua_identifier, strip_parentheses_and_brackets


def parse_scriptbinding_xml(xml_path: Path) -> tuple[List[FunctionSignature], List[EnumDefinition]]:
    root = ET.parse(xml_path).getroot()

    functions = _parse_all_functions(root)
    enums = _parse_all_enums(root)

    return functions, enums


def _parse_all_functions(root) -> List[FunctionSignature]:
    functions = []

    for function_element in root.findall('function'):
        function = _parse_function(function_element)
        functions.append(function)

    return functions


def _parse_function(function_element) -> FunctionSignature:
    name = function_element.get('name')
    raw_description = function_element.get('desc', '')
    description = _normalize_multiline_description(raw_description)

    input_parameters = _parse_parameters(function_element.find('input'))
    output_parameters = _parse_parameters(function_element.find('output'))

    return FunctionSignature(
        name=name,
        description=description,
        input_parameters=input_parameters,
        output_parameters=output_parameters
    )


def _normalize_multiline_description(raw_description: str) -> str:
    lines = raw_description.replace('&#xA;', '\n').splitlines()

    cleaned_lines = [
        strip_parentheses_and_brackets(line.strip())
        for line in lines
        if line.strip()
    ]

    return '\n'.join(cleaned_lines)


def _parse_parameters(parent_element) -> List[Parameter]:
    if parent_element is None:
        return []

    parameters = []

    for param_element in parent_element.findall('param'):
        parameter = _parse_parameter(param_element)
        parameters.append(parameter)

    return parameters


def _parse_parameter(param_element) -> Parameter:
    raw_name = param_element.get('name') or '_'
    sanitized_name = sanitize_lua_identifier(raw_name)

    param_type = param_element.get('type') or 'any'

    raw_description = param_element.get('desc', '')
    description = strip_parentheses_and_brackets(raw_description)

    return Parameter(
        name=sanitized_name,
        type=param_type,
        description=description
    )


def _parse_all_enums(root) -> List[EnumDefinition]:
    enums = []

    for enum_element in root.findall('enum'):
        enum = _parse_enum(enum_element)
        if enum.values:
            enums.append(enum)

    return enums


def _parse_enum(enum_element) -> EnumDefinition:
    name = enum_element.get('name')

    values = [
        value_element.text
        for value_element in enum_element.findall('value')
        if value_element.text
    ]

    return EnumDefinition(name=name, values=values)
