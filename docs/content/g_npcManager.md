---
title: g_npcManager
description: Global g_npcManager - Runtime introspected API
fieldTypes:
  array: 1
  function: 16
  object: 17
  primitive: 17
---

# g_npcManager

Runtime-introspected API for `g_npcManager`.

**Source**: schemas (depth 2)  
**Fields**: 21 top-level fields

## Field Statistics

Total fields: **21**

- **Function**: 16
- **Object**: 2
- **Array**: 1
- **Primitive**: 2

## Fields by Type

<details>
<summary><strong>Functions (16)</strong></summary>

- **`getNPCByName()`**
- **`new()`**
- **`loadFromXMLFile()`**
- **`getNPCByIndex()`**
- **`loadDefaultTypes()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`getRandomIndex()`**
- **`getRandomNPC()`**
- **`saveToXMLFile()`**
- **`initDataStructures()`**
- **`superClass()`**
- **`loadNPCs()`**
- **`loadMapData()`**
- **`addNPC()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`npcs`** : `table`
  - **`NPC_ALPINE_01`** : `table`
  - **`NPC_ALPINE_02`** : `table`
  - **`NPC_ALPINE_03`** : `table`
  - **`NPC_ALPINE_04`** : `table`
  - **`NPC_ALPINE_05`** : `table`
  - **`NPC_ALPINE_06`** : `table`
  - **`NPC_ALPINE_07`** : `table`
  - **`NPC_ALPINE_08`** : `table`
  - **`NPC_ALPINE_09`** : `table`
  - **`NPC_ALPINE_10`** : `table`
  - **`NPC_ALPINE_11`** : `table`
  - **`NPC_ALPINE_12`** : `table`
  - **`NPC_ALPINE_13`** : `table`
  - **`NPC_ALPINE_14`** : `table`
  - **`NPC_ALPINE_15`** : `table`
- **`nameToIndex`** : `table`
  - **`NPC_ALPINE_01`** : `number`
  - **`NPC_ALPINE_02`** : `number`
  - **`NPC_ALPINE_03`** : `number`
  - **`NPC_ALPINE_04`** : `number`
  - **`NPC_ALPINE_05`** : `number`
  - **`NPC_ALPINE_06`** : `number`
  - **`NPC_ALPINE_07`** : `number`
  - **`NPC_ALPINE_08`** : `number`
  - **`NPC_ALPINE_09`** : `number`
  - **`NPC_ALPINE_10`** : `number`
  - **`NPC_ALPINE_11`** : `number`
  - **`NPC_ALPINE_12`** : `number`
  - **`NPC_ALPINE_13`** : `number`
  - **`NPC_ALPINE_14`** : `number`
  - **`NPC_ALPINE_15`** : `number`

</details>

<details>
<summary><strong>Arrays (1)</strong></summary>

- **`indexToNpc`** : `table[]` (length: 15)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`numNpcs`** : `number`
- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_npcManager fields
```
