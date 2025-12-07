# Schema to Docusaurus Docs

Generates interactive Docusaurus documentation website from JSON schemas.

## Dependencies

**Input**: `schema-json/outputs/*.json` (JSON intermediate format)

## Usage

```bash
python3 generate_docs.py <input.json> <output_dir>
```

**Example**:
```bash
python3 generate_docs.py \
    ../schema-json/outputs/g_currentMission.json \
    outputs/site/
```

## Output

Generates a complete Docusaurus site:

```
outputs/site/
├── docs/
│   ├── index.md              # Landing page
│   └── g_currentMission.md   # Global documentation
├── docusaurus.config.js
├── sidebars.js
└── package.json
```

## Running the Site

```bash
cd outputs/site/
npm install
npm start
```

Opens browser at `http://localhost:3000` with:
- 🔍 Full-text search
- 🌳 Sidebar navigation
- 📝 Field hierarchy with types
- 🔗 Cross-references to other globals
- 💡 Code examples

## Building for Production

```bash
cd outputs/site/
npm run build
npm run serve
```

Static site generated in `build/` directory.

## Features

- **Hierarchical structure** - Shows nested fields up to 2 levels deep
- **Type information** - Displays field types with proper formatting
- **Cross-references** - Links to other globals (e.g., `g_achievementManager`)
- **Code examples** - Lua usage snippets
- **Search** - Built-in Docusaurus search
- **Responsive** - Works on desktop and mobile

## Why JSON Dependency?

Instead of parsing XML directly, we depend on `schema-json`:

1. **Separation of concerns** - schema-json = data, schema-docs = presentation
2. **Reusable format** - JSON can feed multiple doc generators
3. **Simpler parsing** - JSON easier to consume than XML
4. **Extensible** - Can add more doc formats without changing XML parser
