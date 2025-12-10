---
title: g_animCache
description: Global g_animCache - Runtime introspected API
fieldTypes:
  function: 10
  object: 3
  primitive: 6
---

# g_animCache

Runtime-introspected API for `g_animCache`.

**Source**: schemas (depth 2)  
**Fields**: 13 top-level fields

## Field Statistics

Total fields: **13**

- **Function**: 10
- **Object**: 3

## Fields by Type

<details>
<summary><strong>Functions (10)</strong></summary>

- **`new()`**
- **`getNode()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`load()`**
- **`delete()`**
- **`onAnimationFileLoaded()`**
- **`isLoaded()`**
- **`superClass()`**

</details>

<details open>
<summary><strong>Objects/Tables (3)</strong></summary>

- **`nameToAnimationNode`** : `table`
  - **`CHARACTER`** : `number`
  - **`PEDESTRIAN`** : `number`
  - **`VEHICLE_CHARACTER`** : `number`
- **`nameToFilename`** : `table`
  - **`CHARACTER`** : `string`
  - **`PEDESTRIAN`** : `string`
  - **`VEHICLE_CHARACTER`** : `string`
- **`pendingLoadRequestIds`** : `table`

</details>


## Usage Example

```lua
-- Access g_animCache fields
```
