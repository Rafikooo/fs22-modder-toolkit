---
title: g_asyncTaskManager
description: Global g_asyncTaskManager - Runtime introspected API
fieldTypes:
  function: 15
  object: 2
  primitive: 3
---

# g_asyncTaskManager

Runtime-introspected API for `g_asyncTaskManager`.

**Source**: schemas (depth 2)  
**Fields**: 19 top-level fields

## Field Statistics

Total fields: **19**

- **Function**: 14
- **Object**: 2
- **Primitive**: 3

## Fields by Type

<details>
<summary><strong>Functions (14)</strong></summary>

- **`new()`**
- **`hasTasks()`**
- **`addTask()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`setAllowedTimePerFrame()`**
- **`update()`**
- **`runTopTask()`**
- **`initDataStructures()`**
- **`flushAllTasks()`**
- **`addSubtask()`**
- **`runLambda()`**
- **`superClass()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`lastTask`** : `table`
  - **Methods**: 1 available
    - `lambda()`
- **`firstTask`** : `table`

</details>

<details>
<summary><strong>Primitives (3)</strong></summary>

- **`executeSubTasksImmediately`** : `boolean`
- **`doTracing`** : `boolean`
- **`enabled`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_asyncTaskManager fields
```
