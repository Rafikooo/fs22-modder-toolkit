#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from dataclasses import dataclass
from typing import List


@dataclass
class Parameter:
    name: str
    type: str
    description: str


@dataclass
class FunctionSignature:
    name: str
    description: str
    input_parameters: List[Parameter]
    output_parameters: List[Parameter]


@dataclass
class EnumDefinition:
    name: str
    values: List[str]
