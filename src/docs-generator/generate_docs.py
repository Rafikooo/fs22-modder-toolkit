#!/usr/bin/env python3
"""
Generate Docusaurus documentation from JSON schemas.

Usage:
    python3 generate_docs.py <input.json> <output_dir>

Example:
    python3 generate_docs.py \
        ../schema-json/outputs/g_currentMission.json \
        outputs/docs/
"""

import json
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional


def sanitize_filename(name: str) -> str:
    return name.replace('_', '-').lower()


def normalize_field_type(field: Dict[str, Any]) -> str:
    field_type = field.get('type', 'unknown')

    if field.get('class'):
        return 'class'
    elif field_type == 'function':
        return 'function'
    elif field_type in ('string', 'number', 'boolean', 'nil'):
        return 'primitive'
    elif field_type in ('table', 'class-instance', 'object'):
        return 'object'
    elif field_type == 'array':
        return 'array'
    elif field_type == 'global-ref':
        return 'global-ref'
    else:
        return 'other'


def get_field_type_display(field: Dict[str, Any]) -> str:
    field_type = field.get('type', 'unknown')

    if field.get('class'):
        return f"`{field['class']}`"
    elif field_type == 'array':
        valuetype = field.get('valuetype', 'any')
        length = field.get('length', '?')
        return f"`{valuetype}[]` (length: {length})"
    elif field_type == 'global-ref':
        ref = field.get('ref', '?')
        return f"`{field_type}` → [`{ref}`](./{ref}.md)"
    elif field_type == 'class-instance':
        first_at = field.get('firstExportedAt', '?')
        instance_num = field.get('instanceNumber', '?')
        return f"`class-instance` (see: {first_at}, instance #{instance_num})"
    else:
        return f"`{field_type}`"


def collect_field_types(fields: List[Dict[str, Any]], type_counts: Optional[Dict[str, int]] = None) -> Dict[str, int]:
    if type_counts is None:
        type_counts = {}

    for field in fields:
        normalized_type = normalize_field_type(field)
        type_counts[normalized_type] = type_counts.get(normalized_type, 0) + 1

        children = field.get('fields', [])
        if children:
            collect_field_types(children, type_counts)

    return type_counts


def generate_field_docs(field: Dict[str, Any], depth: int = 0, show_methods: bool = True) -> List[str]:
    lines = []
    indent = "  " * depth

    key = field.get('key', 'unknown')
    type_display = get_field_type_display(field)
    normalized_type = normalize_field_type(field)

    lines.append(f"{indent}- **`{key}`** : {type_display}")

    children = field.get('fields', [])
    if children and depth < 3:
        methods = [c for c in children if c.get('type') == 'function']
        other_fields = [c for c in children if c.get('type') != 'function']

        if show_methods and methods:
            lines.append(f"{indent}  - **Methods**: {len(methods)} available")
            for method in methods:  # Show all methods
                method_name = method.get('key', 'unknown')
                lines.append(f"{indent}    - `{method_name}()`")

        for child in other_fields:
            lines.extend(generate_field_docs(child, depth + 1, show_methods=False))

    return lines


def generate_global_page(data: Dict[str, Any], output_dir: Path) -> None:
    name = data.get('name', 'unknown')
    depth = data.get('depth', '?')
    timestamp = data.get('timestamp', 'unknown')
    fields = data.get('fields', [])

    type_counts = collect_field_types(fields)

    content = [
        '---',
        f'title: {name}',
        f'description: Global {name} - Runtime introspected API',
        f'fieldTypes:',
    ]

    for type_name, count in sorted(type_counts.items()):
        content.append(f'  {type_name}: {count}')

    content.extend([
        '---',
        '',
        f'# {name}',
        '',
        f'Runtime-introspected API for `{name}`.',
        '',
        f'**Source**: {timestamp} (depth {depth})  ',
        f'**Fields**: {len(fields)} top-level fields',
        '',
    ])

    fields_by_type = {
        'function': [],
        'class': [],
        'object': [],
        'array': [],
        'global-ref': [],
        'primitive': [],
        'other': []
    }

    for field in fields:
        normalized_type = normalize_field_type(field)
        if normalized_type in fields_by_type:
            fields_by_type[normalized_type].append(field)

    content.append('## Field Statistics')
    content.append('')
    content.append(f'Total fields: **{len(fields)}**')
    content.append('')
    for type_name in ['function', 'class', 'object', 'array', 'global-ref', 'primitive', 'other']:
        count = len(fields_by_type[type_name])
        if count > 0:
            content.append(f'- **{type_name.capitalize()}**: {count}')
    content.append('')

    content.append('## Fields by Type')
    content.append('')

    if fields_by_type['function']:
        content.append('<details>')
        content.append(f'<summary><strong>Functions ({len(fields_by_type["function"])})</strong></summary>')
        content.append('')
        for field in fields_by_type['function']:
            key = field.get('key', 'unknown')
            content.append(f'- **`{key}()`**')
        content.append('')
        content.append('</details>')
        content.append('')

    if fields_by_type['class']:
        content.append('<details>')
        content.append(f'<summary><strong>Classes ({len(fields_by_type["class"])})</strong></summary>')
        content.append('')
        for field in fields_by_type['class']:
            content.extend(generate_field_docs(field, 0, show_methods=False))
        content.append('')
        content.append('</details>')
        content.append('')

    if fields_by_type['object']:
        content.append('<details open>')
        content.append(f'<summary><strong>Objects/Tables ({len(fields_by_type["object"])})</strong></summary>')
        content.append('')
        for field in fields_by_type['object']:
            content.extend(generate_field_docs(field, 0, show_methods=True))
        content.append('')
        content.append('</details>')
        content.append('')

    if fields_by_type['array']:
        content.append('<details>')
        content.append(f'<summary><strong>Arrays ({len(fields_by_type["array"])})</strong></summary>')
        content.append('')
        for field in fields_by_type['array']:
            content.extend(generate_field_docs(field, 0, show_methods=False))
        content.append('')
        content.append('</details>')
        content.append('')

    if fields_by_type['global-ref']:
        content.append('<details>')
        content.append(f'<summary><strong>Global References ({len(fields_by_type["global-ref"])})</strong></summary>')
        content.append('')
        for field in fields_by_type['global-ref']:
            content.extend(generate_field_docs(field, 0, show_methods=False))
        content.append('')
        content.append('</details>')
        content.append('')

    if fields_by_type['primitive']:
        content.append('<details>')
        content.append(f'<summary><strong>Primitives ({len(fields_by_type["primitive"])})</strong></summary>')
        content.append('')
        for field in fields_by_type['primitive']:
            content.extend(generate_field_docs(field, 0, show_methods=False))
        content.append('')
        content.append('</details>')
        content.append('')

    if fields_by_type['other']:
        content.append('<details>')
        content.append(f'<summary><strong>Other ({len(fields_by_type["other"])})</strong></summary>')
        content.append('')
        for field in fields_by_type['other']:
            content.extend(generate_field_docs(field, 0, show_methods=False))
        content.append('')
        content.append('</details>')
        content.append('')

    content.append('')
    content.append('## Usage Example')
    content.append('')
    content.append('```lua')
    content.append(f'-- Access {name} fields')

    for field in fields[:3]:
        key = field.get('key', '')
        field_type = field.get('type', '')
        if field_type in ('string', 'number', 'boolean'):
            content.append(f'local value = {name}.{key}')
        elif field_type == 'table':
            content.append(f'local obj = {name}.{key}')

    content.append('```')
    content.append('')

    output_path = output_dir / f'{name}.md'
    output_path.write_text('\n'.join(content))

    print(f'✓ Generated: {output_path.name}')


def generate_index_page(data: Dict[str, Any], output_dir: Path) -> None:
    all_files = list(output_dir.glob('*.md'))
    globals_files = sorted([f for f in all_files if f.stem.startswith('g_')])
    engine_main = output_dir / 'engine-functions.md'

    content = [
        '---',
        'title: Home',
        'slug: /',
        '---',
        '',
        '# FS22 Runtime API Documentation',
        '',
        'Interactive API documentation generated from runtime introspection.',
        '',
    ]

    if globals_files:
        content.extend([
            f'## Runtime Globals ({len(globals_files)})',
            '',
            'Global Lua objects introspected from running FS22:',
            '',
        ])
        for f in globals_files[:10]:  # Show first 10
            content.append(f'- [{f.stem}]({f.stem}.md)')
        if len(globals_files) > 10:
            content.append(f'- ...and {len(globals_files) - 10} more')
        content.append('')

    if engine_main.exists():
        content.extend([
            '## Engine Functions',
            '',
            'Low-level C++ engine functions exposed to Lua:',
            '',
            '- [Engine Functions](engine-functions.md) - Browse 400+ engine functions by category',
            '',
        ])

    content.extend([
        '## About',
        '',
        'This documentation is automatically generated from FS22 runtime introspection and engine bindings.',
        '',
        '**Sources**:',
        '- Runtime globals: `runtime-inspector` mod → XML → JSON → docs',
        '- Engine functions: `scriptBinding.xml` → Lua stubs → docs',
        '',
        '## Features',
        '',
        '- 🔍 **Searchable** - Find any field or function quickly',
        '- 🌳 **Structured** - Hierarchical navigation',
        '- 📝 **Type Info** - Full type annotations',
        '- 🔗 **Cross-referenced** - Follow references between globals',
        '',
    ])

    output_path = output_dir / 'index.md'
    output_path.write_text('\n'.join(content))

    print(f'✓ Generated: {output_path.name}')


def generate_docusaurus_config(output_dir: Path) -> None:
    config_dir = output_dir
    docs_dir = output_dir / 'docs'

    config_js = '''module.exports = {
  title: 'FS22 Runtime API',
  tagline: 'Interactive API documentation for Farming Simulator 22 modding',
  url: 'https://rafikooo.github.io',
  baseUrl: '/fs22-modder-toolkit/',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',

  organizationName: 'rafikooo',
  projectName: 'fs22-modder-toolkit',

  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          routeBasePath: '/',
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: undefined,
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],

  themes: [
    [
      require.resolve('@easyops-cn/docusaurus-search-local'),
      {
        hashed: true,
        language: ['en'],
        highlightSearchTermsOnTargetPage: true,
        explicitSearchResultPath: true,
        indexBlog: false,
        docsRouteBasePath: '/',
      },
    ],
  ],

  themeConfig: {
    navbar: {
      title: 'FS22 Runtime API',
      items: [
        {
          type: 'doc',
          docId: 'index',
          position: 'left',
          label: 'Docs',
        },
      ],
    },
    footer: {
      style: 'dark',
      copyright: `Generated from FS22 runtime introspection. Farming Simulator is a trademark of GIANTS Software GmbH.`,
    },
    prism: {
      theme: require('prism-react-renderer/themes/github'),
      darkTheme: require('prism-react-renderer/themes/dracula'),
      additionalLanguages: ['lua'],
    },
  },
};
'''

    (config_dir / 'docusaurus.config.js').write_text(config_js)

    categorization_file = Path('/Users/rafik/Sites/fs22-modder-toolkit/data/globals-categorization.json')
    categorization = None
    if categorization_file.exists():
        with open(categorization_file) as f:
            categorization = json.load(f)

    all_md_files = sorted([
        f.stem for f in docs_dir.glob('*.md')
        if f.stem != 'index' and f.is_file()
    ])

    global_files = [f for f in all_md_files if f.startswith('g_')]
    engine_files = [f for f in all_md_files if f.startswith('engine-')]

    sidebars_js = '''module.exports = {
  docs: [
    'index',
'''

    if global_files and categorization:
        categories = categorization['categories']

        # Core Globals (used in SDK, has fields)
        if categories['core']:
            core_globals = sorted(categories['core'])
            sidebars_js += f'''    {{
      type: 'category',
      label: 'Core Globals ({len(core_globals)})',
      collapsed: false,
      items: [
'''
            for global_name in core_globals:
                sidebars_js += f"        '{global_name}',\n"
            sidebars_js += '''      ],
    },
'''

        # Constants (used in SDK, no fields - simple values)
        if categories['constants']:
            constants = sorted(categories['constants'])
            sidebars_js += f'''    {{
      type: 'category',
      label: 'Constants ({len(constants)})',
      collapsed: true,
      items: [
'''
            for global_name in constants:
                sidebars_js += f"        '{global_name}',\n"
            sidebars_js += '''      ],
    },
'''

        # Advanced/Reference (not used in SDK but has fields)
        if categories['unused_objects']:
            unused_objects = sorted(categories['unused_objects'])
            sidebars_js += f'''    {{
      type: 'category',
      label: 'Advanced Reference ({len(unused_objects)})',
      collapsed: true,
      items: [
'''
            for global_name in unused_objects:
                sidebars_js += f"        '{global_name}',\n"
            sidebars_js += '''      ],
    },
'''

        # Internal/System (not used in SDK, no fields - mostly internal)
        if categories['unused_constants']:
            unused_constants = sorted(categories['unused_constants'])
            sidebars_js += f'''    {{
      type: 'category',
      label: 'Internal/System ({len(unused_constants)})',
      collapsed: true,
      items: [
'''
            for global_name in unused_constants:
                sidebars_js += f"        '{global_name}',\n"
            sidebars_js += '''      ],
    },
'''

    elif global_files:
        sidebars_js += '''    {
      type: 'category',
      label: 'Globals',
      items: [
'''
        for md_file in global_files:
            sidebars_js += f"        '{md_file}',\n"

        sidebars_js += '''      ],
    },
'''

    if engine_files:
        sidebars_js += '''    {
      type: 'category',
      label: 'Engine Functions',
      items: [
'''
        for md_file in engine_files:
            sidebars_js += f"        '{md_file}',\n"

        sidebars_js += '''      ],
    },
'''

    sidebars_js += '''  ],
};
'''

    (config_dir / 'sidebars.js').write_text(sidebars_js)

    package_json = '''{
  "name": "fs22-runtime-api-docs",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "docusaurus": "docusaurus",
    "start": "docusaurus start",
    "build": "docusaurus build",
    "serve": "docusaurus serve"
  },
  "dependencies": {
    "@docusaurus/core": "^2.4.0",
    "@docusaurus/preset-classic": "^2.4.0",
    "prism-react-renderer": "^1.3.5",
    "react": "^17.0.2",
    "react-dom": "^17.0.2"
  },
  "browserslist": {
    "production": [">0.5%", "not dead", "not op_mini all"],
    "development": ["last 1 chrome version", "last 1 firefox version", "last 1 safari version"]
  }
}
'''

    (config_dir / 'package.json').write_text(package_json)

    print(f'✓ Generated Docusaurus config files')


def main() -> None:
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)

    json_path = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])

    if not json_path.exists():
        print(f'Error: Input file not found: {json_path}')
        sys.exit(1)

    with open(json_path) as f:
        data = json.load(f)

    docs_dir = output_dir / 'docs'
    docs_dir.mkdir(parents=True, exist_ok=True)

    generate_index_page(data, docs_dir)
    generate_global_page(data, docs_dir)
    generate_docusaurus_config(output_dir)


if __name__ == '__main__':
    main()
