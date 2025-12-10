---
title: g_connectionHoseManager
description: Global g_connectionHoseManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 26
  object: 26
  primitive: 2
---

# g_connectionHoseManager

Runtime-introspected API for `g_connectionHoseManager`.

**Source**: schemas (depth 2)  
**Fields**: 34 top-level fields

## Field Statistics

Total fields: **34**

- **Function**: 26
- **Object**: 4
- **Array**: 2
- **Primitive**: 2

## Fields by Type

<details>
<summary><strong>Functions (26)</strong></summary>

- **`getClonedBasicHose()`**
- **`new()`**
- **`closeSocket()`**
- **`getSocketByName()`**
- **`socketI3DFileLoaded()`**
- **`superClass()`**
- **`copy()`**
- **`materialI3DFileLoaded()`**
- **`adapterI3DFileLoaded()`**
- **`initDataStructures()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`basicHoseI3DFileLoaded()`**
- **`registerXMLPaths()`**
- **`openSocket()`**
- **`getSocketTarget()`**
- **`addModConnectionHoses()`**
- **`getClonedHoseNode()`**
- **`getClonedAdapterNode()`**
- **`getHoseMaterialByName()`**
- **`isa()`**
- **`class()`**
- **`getHoseAdapterByName()`**
- **`getHoseTypeByName()`**
- **`linkSocketToNode()`**
- **`loadConnectionHosesFromXML()`**

</details>

<details open>
<summary><strong>Objects/Tables (4)</strong></summary>

- **`sockets`** : `table`
  - **`AIR_RED`** : `table`
  - **`AIR_YELLOW`** : `table`
  - **`ELECTRIC`** : `table`
  - **`ELECTRIC_METAL`** : `table`
  - **`HYDRAULIC01`** : `table`
  - **`HYDRAULIC02`** : `table`
  - **`HYDRAULIC03`** : `table`
  - **`HYDRAULIC04`** : `table`
  - **`ISOBUS`** : `table`
- **`typeByName`** : `table`
  - **`AIRDOUBLERED`** : `table`
  - **`AIRDOUBLEYELLOW`** : `table`
  - **`CABLE_BOUNDLE`** : `table`
  - **`ELECTRIC`** : `table`
  - **`HYDRAULICIN`** : `table`
  - **`HYDRAULICOUT`** : `table`
  - **`ISOBUS`** : `table`
  - **`TOOL_CONNECTOR_BOTTOM_01`** : `table`
  - **`TOOL_CONNECTOR_BOTTOM_02`** : `table`
  - **`TOOL_CONNECTOR_BOTTOM_03`** : `table`
  - **`TOOL_CONNECTOR_BOTTOM_04`** : `table`
  - **`TOOL_CONNECTOR_TOP_RIGHT`** : `table`
  - **`TOOL_CONNECTOR_TOP_RIGHT_02`** : `table`
- **`xmlFiles`** : `table`
- **`modConnectionHosesToLoad`** : `table`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`sharedLoadRequestIds`** : `number[]` (length: 49)
- **`basicHoses`** : `table[]` (length: 13)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`baseDirectory`** : `string`
- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_connectionHoseManager fields
```
