---
title: g_runtimeInspector
description: Global g_runtimeInspector - Runtime introspected API
fieldTypes:
  array: 1
  function: 17
  object: 1
  primitive: 10
---

# g_runtimeInspector

Runtime-introspected API for `g_runtimeInspector`.

**Source**: schemas (depth 2)  
**Fields**: 19 top-level fields

## Field Statistics

Total fields: **19**

- **Function**: 12
- **Object**: 1
- **Primitive**: 6

## Fields by Type

<details>
<summary><strong>Functions (12)</strong></summary>

- **`evalCode()`**
- **`exportAll()`**
- **`exportByName()`**
- **`getClock()`**
- **`help()`**
- **`initializeProcessors()`**
- **`loge()`**
- **`logi()`**
- **`logw()`**
- **`outDir()`**
- **`probeFunction()`**
- **`register()`**

</details>

<details open>
<summary><strong>Objects/Tables (1)</strong></summary>

- **`Export`** : `table`
  - **Methods**: 5 available
    - `exportAll()`
    - `exportObject()`
    - `getConfig()`
    - `registerProcessor()`
    - `sortProcessors()`
  - **`DEBUG_PROCESSOR_ATTRIBUTION`** : `boolean`
  - **`DEFAULT_DEPTH`** : `number`
  - **`MAX_DEPTH`** : `number`
  - **`MAX_NODES`** : `number`
  - **`processors`** : `table[]` (length: 12)

</details>

<details>
<summary><strong>Primitives (6)</strong></summary>

- **`DEFAULT_DEPTH`** : `number`
- **`LOG_PREFIX`** : `string`
- **`MAX_DEPTH`** : `number`
- **`MAX_NODES`** : `number`
- **`MOD_SETTINGS_FOLDER`** : `string`
- **`WATCH_LIMIT`** : `number`

</details>


## Usage Example

```lua
-- Access g_runtimeInspector fields
local value = g_runtimeInspector.DEFAULT_DEPTH
local obj = g_runtimeInspector.Export
local value = g_runtimeInspector.LOG_PREFIX
```
