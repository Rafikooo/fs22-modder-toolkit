---
title: g_helpLineManager
description: Global g_helpLineManager - Runtime introspected API
fieldTypes:
  array: 3
  function: 25
  object: 5
  other: 1
  primitive: 2
---

# g_helpLineManager

Runtime-introspected API for `g_helpLineManager`.

**Source**: schemas (depth 2)  
**Fields**: 27 top-level fields

## Field Statistics

Total fields: **27**

- **Function**: 17
- **Object**: 5
- **Array**: 3
- **Primitive**: 1
- **Other**: 1

## Fields by Type

<details>
<summary><strong>Functions (17)</strong></summary>

- **`getCategory()`**
- **`new()`**
- **`loadCategory()`**
- **`copy()`**
- **`class()`**
- **`loadPage()`**
- **`convertText()`**
- **`loadFromXML()`**
- **`loadMapData()`**
- **`onIconLoaded()`**
- **`addModCategory()`**
- **`onIconTrigger()`**
- **`unloadMapData()`**
- **`initDataStructures()`**
- **`getCategories()`**
- **`superClass()`**
- **`isa()`**

</details>

<details open>
<summary><strong>Objects/Tables (5)</strong></summary>

- **`categoryNames`** : `table`
- **`idToCategoryIndex`** : `table`
- **`modCategories`** : `table`
- **`activatable`** : `table`
  - **Methods**: 8 available
    - `getDistance()`
    - `new()`
    - `run()`
    - `isa()`
    - `getIsActivatable()`
    - `superClass()`
    - `copy()`
    - `class()`
  - **`activateText`** : `string`
- **`idToIndices`** : `table`

</details>

<details>
<summary><strong>Arrays (3)</strong></summary>

- **`categories`** : `table[]` (length: 11)
- **`sharedLoadingIds`** : `number[]` (length: 6)
- **`triggers`** : `table[]` (length: 6)

</details>

<details>
<summary><strong>Primitives (1)</strong></summary>

- **`loadedMapData`** : `boolean`

</details>

<details>
<summary><strong>Other (1)</strong></summary>

- **`triggerNodeToData`** : `map`

</details>


## Usage Example

```lua
-- Access g_helpLineManager fields
```
