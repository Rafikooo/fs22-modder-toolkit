---
title: g_modIsLoaded
description: Global g_modIsLoaded - Runtime introspected API
fieldTypes:
  primitive: 5
---

# g_modIsLoaded

Runtime-introspected API for `g_modIsLoaded`.

**Source**: schemas (depth 2)  
**Fields**: 5 top-level fields

## Field Statistics

Total fields: **5**

- **Primitive**: 5

## Fields by Type

<details>
<summary><strong>Primitives (5)</strong></summary>

- **`FS22_Courseplay`** : `boolean`
- **`FS22_FarmlandPriceModifier`** : `boolean`
- **`FS22_GlobalExplorer`** : `boolean`
- **`FS22_RuntimeInspector`** : `boolean`
- **`FS22_additionalGameSettings`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_modIsLoaded fields
local value = g_modIsLoaded.FS22_Courseplay
local value = g_modIsLoaded.FS22_FarmlandPriceModifier
local value = g_modIsLoaded.FS22_GlobalExplorer
```
