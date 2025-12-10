---
title: g_sprayTypeManager
description: Global g_sprayTypeManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 18
  object: 9
  other: 1
  primitive: 9
---

# g_sprayTypeManager

Runtime-introspected API for `g_sprayTypeManager`.

**Source**: schemas (depth 2)  
**Fields**: 25 top-level fields

## Field Statistics

Total fields: **25**

- **Function**: 18
- **Object**: 2
- **Array**: 2
- **Primitive**: 2
- **Other**: 1

## Fields by Type

<details>
<summary><strong>Functions (18)</strong></summary>

- **`new()`**
- **`getFillTypeNameByIndex()`**
- **`isa()`**
- **`getFillTypeByName()`**
- **`class()`**
- **`getSprayTypeByIndex()`**
- **`getSprayTypes()`**
- **`getSprayTypeIndexByFillTypeIndex()`**
- **`getSprayTypeByFillTypeIndex()`**
- **`getFillTypeIndexByName()`**
- **`loadMapData()`**
- **`loadDefaultTypes()`**
- **`superClass()`**
- **`loadSprayTypes()`**
- **`getSprayTypeByName()`**
- **`initDataStructures()`**
- **`addSprayType()`**
- **`copy()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`nameToSprayType`** : `table`
  - **`DIGESTATE`** : `table`
  - **`FERTILIZER`** : `table`
  - **`HERBICIDE`** : `table`
  - **`LIME`** : `table`
  - **`LIQUIDFERTILIZER`** : `table`
  - **`LIQUIDMANURE`** : `table`
  - **`MANURE`** : `table`
- **`nameToIndex`** : `table`
  - **`DIGESTATE`** : `number`
  - **`FERTILIZER`** : `number`
  - **`HERBICIDE`** : `number`
  - **`LIME`** : `number`
  - **`LIQUIDFERTILIZER`** : `number`
  - **`LIQUIDMANURE`** : `number`
  - **`MANURE`** : `number`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`sprayTypes`** : `table[]` (length: 7)
- **`indexToName`** : `string[]` (length: 7)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`numSprayTypes`** : `number`
- **`loadedMapData`** : `boolean`

</details>

<details>
<summary><strong>Other (1)</strong></summary>

- **`fillTypeIndexToSprayType`** : `map`

</details>


## Usage Example

```lua
-- Access g_sprayTypeManager fields
```
