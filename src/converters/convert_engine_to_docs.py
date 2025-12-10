#!/usr/bin/env python3
"""
Convert engine functions Lua stubs to Docusaurus markdown.

Usage:
    python3 convert_engine_to_docs.py <input.lua> <output_dir>
"""

import re
import sys
from pathlib import Path
from typing import List, Dict, Optional


def parse_function(block: str) -> Optional[Dict]:
    lines = block.strip().split('\n')

    func_match = re.search(r'function (\w+)\((.*?)\)', block)
    if not func_match:
        return None

    func_name = func_match.group(1)
    params_str = func_match.group(2)

    description = ""
    for line in lines:
        if line.startswith('---') and not line.startswith('---@'):
            description = line.replace('---', '').strip()
            break

    params = []
    return_type = None

    for line in lines:
        param_match = re.match(r'---@param (\w+) (\w+)(?: (.+))?', line)
        if param_match:
            params.append({
                'name': param_match.group(1),
                'type': param_match.group(2),
                'desc': param_match.group(3) or ''
            })

        return_match = re.match(r'---@return (\w+)', line)
        if return_match:
            return_type = return_match.group(1)

    return {
        'name': func_name,
        'description': description,
        'params': params,
        'return_type': return_type
    }


def group_functions_by_prefix(functions: List[Dict]) -> Dict[str, List[Dict]]:
    groups = {}

    for func in functions:
        name = func['name']

        # Extract prefix (e.g., 'add' from 'addForce', 'get' from 'getChild')
        prefix_match = re.match(r'^([a-z]+)[A-Z]', name)
        if prefix_match:
            prefix = prefix_match.group(1)
        else:
            prefix = 'other'

        if prefix not in groups:
            groups[prefix] = []
        groups[prefix].append(func)

    return groups


def generate_function_markdown(func: Dict) -> str:
    md = f"### `{func['name']}()`\n\n"

    if func['description']:
        md += f"{func['description']}\n\n"

    if func['params']:
        md += "**Parameters:**\n\n"
        for param in func['params']:
            desc = f" - {param['desc']}" if param['desc'] else ""
            md += f"- `{param['name']}` (`{param['type']}`){desc}\n"
        md += "\n"

    if func['return_type']:
        md += f"**Returns:** `{func['return_type']}`\n\n"

    params_list = ', '.join([p['name'] for p in func['params']])
    md += "```lua\n"
    if func['return_type']:
        md += f"local result = {func['name']}({params_list})\n"
    else:
        md += f"{func['name']}({params_list})\n"
    md += "```\n\n"

    return md


def main():
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)

    input_lua = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])

    if not input_lua.exists():
        print(f"Error: Input file not found: {input_lua}")
        sys.exit(1)

    content = input_lua.read_text()

    blocks = re.split(r'\n(?=--- )', content)

    functions = []
    for block in blocks:
        if 'function ' in block:
            func = parse_function(block)
            if func:
                functions.append(func)

    print(f"✓ Parsed {len(functions)} functions")

    groups = group_functions_by_prefix(functions)

    output_dir.mkdir(parents=True, exist_ok=True)

    index_md = """---
title: Engine Functions
description: FS22 Engine API functions from scriptBinding.xml
---

# Engine Functions

Engine functions provided by the Farming Simulator 22 game engine. These are low-level C++ functions exposed to Lua for modding.

**Total Functions:** {total}

## Categories

"""

    for prefix, funcs in sorted(groups.items()):
        index_md += f"- [{prefix.title()}](engine-{prefix}.md) ({len(funcs)} functions)\n"

    index_md = index_md.format(total=len(functions))

    (output_dir / 'engine-functions.md').write_text(index_md)
    print(f"✓ Generated: engine-functions.md")

    for prefix, funcs in sorted(groups.items()):
        category_md = f"""---
title: Engine Functions - {prefix.title()}
description: {prefix.title()} functions from FS22 engine
---

# {prefix.title()} Functions

{len(funcs)} functions starting with `{prefix}`.

"""

        for func in sorted(funcs, key=lambda f: f['name']):
            category_md += generate_function_markdown(func)

        output_path = output_dir / f'engine-{prefix}.md'
        output_path.write_text(category_md)
        print(f"✓ Generated: {output_path.name}")

    print(f"\n✓ Documentation generated in: {output_dir}")
    print(f"  Main page: engine-functions.md")
    print(f"  Categories: {len(groups)}")


if __name__ == '__main__':
    main()
