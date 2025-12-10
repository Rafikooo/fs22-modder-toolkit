---
title: g_baleManager
description: Global g_baleManager - Runtime introspected API
fieldTypes:
  array: 1
  function: 27
  object: 2
  primitive: 1
---

# g_baleManager

Runtime-introspected API for `g_baleManager`.

**Source**: schemas (depth 2)  
**Fields**: 31 top-level fields

## Field Statistics

Total fields: **31**

- **Function**: 27
- **Object**: 2
- **Array**: 1
- **Primitive**: 1

## Fields by Type

<details>
<summary><strong>Functions (27)</strong></summary>

- **`new()`**
- **`isa()`**
- **`loadBaleFromXML()`**
- **`class()`**
- **`getBaleIndex()`**
- **`loadModBaleFromXML()`**
- **`registerMapBalesXMLPaths()`**
- **`initDataStructures()`**
- **`consoleCommandListBales()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`getPossibleCapacitiesForFillType()`**
- **`registerBaleXMLPaths()`**
- **`consoleCommandAddBale()`**
- **`getBaleXMLFilename()`**
- **`getIsBaleMatching()`**
- **`getBaleInfoByXMLFilename()`**
- **`getBaleCapacityByBaleIndex()`**
- **`update()`**
- **`removeFermentation()`**
- **`getFermentationTime()`**
- **`registerFermentation()`**
- **`copy()`**
- **`superClass()`**
- **`baleLoaded()`**
- **`loadBales()`**
- **`loadBaleDataFromXML()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`fermentations`** : `table`
- **`modBalesToLoad`** : `table`

</details>

<details>
<summary><strong>Arrays (1)</strong></summary>

- **`bales`** : `table[]` (length: 13)

</details>

<details>
<summary><strong>Primitives (1)</strong></summary>

- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_baleManager fields
```
