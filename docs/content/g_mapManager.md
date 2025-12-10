---
title: g_mapManager
description: Global g_mapManager - Runtime introspected API
fieldTypes:
  array: 1
  function: 14
  object: 6
  primitive: 1
---

# g_mapManager

Runtime-introspected API for `g_mapManager`.

**Source**: schemas (depth 2)  
**Fields**: 17 top-level fields

## Field Statistics

Total fields: **17**

- **Function**: 14
- **Object**: 1
- **Array**: 1
- **Primitive**: 1

## Fields by Type

<details>
<summary><strong>Functions (14)</strong></summary>

- **`new()`**
- **`getModNameFromMapId()`**
- **`getMapDataByIndex()`**
- **`getMapById()`**
- **`addMapItem()`**
- **`copy()`**
- **`class()`**
- **`getMapByConfigFilename()`**
- **`getNumOfMaps()`**
- **`loadMapFromXML()`**
- **`removeMapItem()`**
- **`superClass()`**
- **`isa()`**
- **`initDataStructures()`**

</details>

<details open>
<summary><strong>Objects/Tables (1)</strong></summary>

- **`idToMap`** : `table`
  - **`MapFR`** : `table`
  - **`MapUS`** : `table`
  - **`arena.mapArena`** : `table`
  - **`baleStacking.mapBaleStacking`** : `table`
  - **`mapAlpine`** : `table`

</details>

<details>
<summary><strong>Arrays (1)</strong></summary>

- **`maps`** : `table[]` (length: 5)

</details>

<details>
<summary><strong>Primitives (1)</strong></summary>

- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_mapManager fields
```
