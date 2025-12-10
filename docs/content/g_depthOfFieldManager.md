---
title: g_depthOfFieldManager
description: Global g_depthOfFieldManager - Runtime introspected API
fieldTypes:
  array: 4
  function: 18
  object: 1
  primitive: 1
---

# g_depthOfFieldManager

Runtime-introspected API for `g_depthOfFieldManager`.

**Source**: schemas (depth 2)  
**Fields**: 24 top-level fields

## Field Statistics

Total fields: **24**

- **Function**: 18
- **Object**: 1
- **Array**: 4
- **Primitive**: 1

## Fields by Type

<details>
<summary><strong>Functions (18)</strong></summary>

- **`new()`**
- **`isa()`**
- **`copy()`**
- **`popArea()`**
- **`setEnvironmentDoFEnabled()`**
- **`getInitialDoFParams()`**
- **`loadMapData()`**
- **`updateArea()`**
- **`queueDoFChange()`**
- **`getIsDoFChangeAllowed()`**
- **`setManipulatedParams()`**
- **`class()`**
- **`getCurrentDoFParams()`**
- **`getBlurDoFParams()`**
- **`superClass()`**
- **`pushArea()`**
- **`reset()`**
- **`oldSetDoFparams()`**

</details>

<details open>
<summary><strong>Objects/Tables (1)</strong></summary>

- **`defaultState`** : `table`

</details>

<details>
<summary><strong>Arrays (4)</strong></summary>

- **`areaStack`** : `table[]` (length: 1)
- **`currentState`** : `number[]` (length: 6)
- **`blurState`** : `number[]` (length: 6)
- **`initialState`** : `number[]` (length: 6)

</details>

<details>
<summary><strong>Primitives (1)</strong></summary>

- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_depthOfFieldManager fields
```
