---
title: g_weatherTypeManager
description: Global g_weatherTypeManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 13
  object: 1
  primitive: 5
---

# g_weatherTypeManager

Runtime-introspected API for `g_weatherTypeManager`.

**Source**: schemas (depth 2)  
**Fields**: 17 top-level fields

## Field Statistics

Total fields: **17**

- **Function**: 13
- **Object**: 1
- **Array**: 2
- **Primitive**: 1

## Fields by Type

<details>
<summary><strong>Functions (13)</strong></summary>

- **`getWeatherTypeByIndex()`**
- **`new()`**
- **`getWeatherTypeByName()`**
- **`loadDefaultTypes()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`addWeatherType()`**
- **`initDataStructures()`**
- **`getWeatherTypeIndexByName()`**
- **`getWeatherTypes()`**
- **`getWeatherTypeNameByIndex()`**
- **`superClass()`**

</details>

<details open>
<summary><strong>Objects/Tables (1)</strong></summary>

- **`nameToIndex`** : `table`
  - **`CLOUDY`** : `number`
  - **`RAIN`** : `number`
  - **`SNOW`** : `number`
  - **`SUN`** : `number`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`weatherTypes`** : `table[]` (length: 4)
- **`indexToName`** : `string[]` (length: 4)

</details>

<details>
<summary><strong>Primitives (1)</strong></summary>

- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_weatherTypeManager fields
```
