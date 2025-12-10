---
title: g_modManager
description: Global g_modManager - Runtime introspected API
fieldTypes:
  array: 3
  function: 21
  object: 15
  primitive: 2
---

# g_modManager

Runtime-introspected API for `g_modManager`.

**Source**: schemas (depth 2)  
**Fields**: 28 top-level fields

## Field Statistics

Total fields: **28**

- **Function**: 21
- **Object**: 2
- **Array**: 3
- **Primitive**: 2

## Fields by Type

<details>
<summary><strong>Functions (21)</strong></summary>

- **`new()`**
- **`getIsModAvailable()`**
- **`superClass()`**
- **`copy()`**
- **`class()`**
- **`getHasSelectableMod()`**
- **`getModByFileHash()`**
- **`getMultiplayerMods()`**
- **`addMod()`**
- **`getModByIndex()`**
- **`removeMod()`**
- **`isModMap()`**
- **`getMods()`**
- **`getAreAllModsAvailable()`**
- **`getHasSelectableValidMod()`**
- **`getNumOfValidMods()`**
- **`isa()`**
- **`getModByName()`**
- **`initDataStructures()`**
- **`getActiveMods()`**
- **`getNumOfMods()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`hashToMod`** : `table`
  - **`0855fc7ef09b8d4f9b915d2312930ae5`** : `table`
  - **`428da112bbd4a407d9f4ceb45198e144`** : `table`
  - **`c69e7762899893a1dd19d4c0027e119d`** : `table`
  - **`f140420dbbe13b9edb91d95227af6541`** : `table`
- **`nameToMod`** : `table`
  - **`FS22_000_DevTools`** : `table`
  - **`FS22_Courseplay`** : `table`
  - **`FS22_EasyDevControls`** : `table`
  - **`FS22_FarmlandPriceModifier`** : `table`
  - **`FS22_GlobalExplorer`** : `table`
  - **`FS22_RuntimeInspector`** : `table`
  - **`FS22_additionalGameSettings`** : `table`
  - **`arena`** : `table`
  - **`baleStacking`** : `table`

</details>

<details>
<summary><strong>Arrays (3)</strong></summary>

- **`mods`** : `table[]` (length: 9)
- **`multiplayerMods`** : `table[]` (length: 4)
- **`validMods`** : `table[]` (length: 4)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`loadedMapData`** : `boolean`
- **`numMods`** : `number`

</details>


## Usage Example

```lua
-- Access g_modManager fields
```
