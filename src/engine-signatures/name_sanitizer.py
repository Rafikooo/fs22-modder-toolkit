#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re


LUA_RESERVED_KEYWORDS = {
    'and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function',
    'goto', 'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 'return',
    'then', 'true', 'until', 'while'
}


def sanitize_lua_identifier(raw_name: str) -> str:
    sanitized = re.sub(r'[^A-Za-z0-9_]', '', raw_name)

    if re.match(r'^\d', sanitized):
        sanitized = '_' + sanitized

    if sanitized in LUA_RESERVED_KEYWORDS:
        sanitized = '_' + sanitized

    return sanitized or '_'


def strip_parentheses_and_brackets(text: str) -> str:
    return re.sub(r'\s*[\(\[\{].*?[\)\]\}]\s*', ' ', text).strip()
