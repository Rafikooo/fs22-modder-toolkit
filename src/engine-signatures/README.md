# Engine Signatures Generator

Generates EmmyLua stub files from `scriptBinding.xml` for IDE autocomplete support.

## What it does

Transforms GIANTS' XML function definitions (583 functions + 43 enums) into Lua stubs with type annotations for IDE autocomplete.

## Usage

```bash
python3 generate_signatures.py <input-xml> <output-lua>
```

**Example:**
```bash
python3 generate_signatures.py \
    ../../fs22-data-source/scriptBinding.xml \
    fs22-engine-functions-signatures.lua
```

## Input

`scriptBinding.xml` from your FS22 game installation directory:

**macOS (Steam):**
```
~/Library/Application Support/Steam/steamapps/common/Farming Simulator 22/
  Farming Simulator 2022.app/Contents/Resources/sdk/debugger/scriptBinding.xml
```

**Windows (Steam):**
```
C:\Program Files (x86)\Steam\steamapps\common\Farming Simulator 22\
  sdk\debugger\scriptBinding.xml
```

**Windows (Standalone):**
```
C:\Program Files\Farming Simulator 22\sdk\debugger\scriptBinding.xml
```

Copy it to `../../fs22-data-source/scriptBinding.xml` (gitignored).

**Note:** `%APPDATA%\FarmingSimulator2022` is your savegames/mods directory, not game installation.

## Output

`fs22-engine-functions-signatures.lua` - EmmyLua stub file with:
- Function signatures with `---@param` and `---@return` annotations
- Enum definitions with `---@enum` annotations
- Legal disclaimer header

## Architecture

```
models.py              - Data structures (@dataclass)
xml_parser.py          - XML → models
name_sanitizer.py      - Lua identifier sanitization
emmylua_generator.py   - Models → EmmyLua stubs
generate_signatures.py - CLI entry point
```

## Example

**Input XML:**
```xml
<function name="setXMLString" desc="Set XML file string attribute.">
  <input>
    <param name="xmlId" type="integer" desc="xmlId"/>
    <param name="value" type="string" desc="value"/>
  </input>
</function>
```

**Output Lua:**
```lua
--- Set XML file string attribute.
---@param xmlId integer xmlId
---@param value string value
function setXMLString(xmlId, value) end
```

## Verification

```bash
# Count functions (expected: 583)
grep -c '^function ' fs22-engine-functions-signatures.lua

# Count enums (expected: 43)
grep -c '^---@enum ' fs22-engine-functions-signatures.lua
```
