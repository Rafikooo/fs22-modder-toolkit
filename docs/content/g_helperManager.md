---
title: g_helperManager
description: Global g_helperManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 18
  object: 12
  primitive: 12
---

# g_helperManager

Runtime-introspected API for `g_helperManager`.

**Source**: schemas (depth 2)  
**Fields**: 24 top-level fields

## Field Statistics

Total fields: **24**

- **Function**: 18
- **Object**: 2
- **Array**: 2
- **Primitive**: 2

## Fields by Type

<details>
<summary><strong>Functions (18)</strong></summary>

- **`releaseHelper()`**
- **`useHelper()`**
- **`getHelperByName()`**
- **`getHelperByIndex()`**
- **`getRandomIndex()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`getNumOfHelpers()`**
- **`initDataStructures()`**
- **`loadMapData()`**
- **`loadHelpers()`**
- **`loadDefaultTypes()`**
- **`addHelper()`**
- **`superClass()`**
- **`getRandomHelper()`**
- **`getRandomHelperModel()`**
- **`new()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`helpers`** : `table`
  - **`A`** : `table`
  - **`B`** : `table`
  - **`C`** : `table`
  - **`D`** : `table`
  - **`E`** : `table`
  - **`F`** : `table`
  - **`G`** : `table`
  - **`H`** : `table`
  - **`I`** : `table`
  - **`J`** : `table`
- **`nameToIndex`** : `table`
  - **`A`** : `number`
  - **`B`** : `number`
  - **`C`** : `number`
  - **`D`** : `number`
  - **`E`** : `number`
  - **`F`** : `number`
  - **`G`** : `number`
  - **`H`** : `number`
  - **`I`** : `number`
  - **`J`** : `number`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`availableHelpers`** : `table[]` (length: 10)
- **`indexToHelper`** : `table[]` (length: 10)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`numHelpers`** : `number`
- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_helperManager fields
```
