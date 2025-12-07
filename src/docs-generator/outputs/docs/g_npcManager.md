---
title: g_npcManager
description: Global g_npcManager - Runtime introspected API
fieldTypes:
  array: 1
  function: 16
  object: 17
  primitive: 92
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_npcManager

Runtime-introspected API for `g_npcManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 21 top-level fields

<TypeFilter fieldTypes={{
  array: 1,
  function: 16,
  object: 17,
  primitive: 92,
}} />

## Overview

The `g_npcManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getNPCByName**: `function`</span>
- <span data-field-type="function">**loadDefaultTypes**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**getRandomIndex**: `function`</span>
- <span data-field-type="function">**loadFromXMLFile**: `function`</span>
- <span data-field-type="function">**loadMapData**: `function`</span>
- <span data-field-type="function">**getRandomNPC**: `function`</span>
- <span data-field-type="function">**addNPC**: `function`</span>
- <span data-field-type="function">**saveToXMLFile**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**loadNPCs**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**getNPCByIndex**: `function`</span>
- <span data-field-type="object">**nameToIndex**: `table`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_01**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_02**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_03**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_04**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_05**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_06**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_07**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_08**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_09**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_10**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_11**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_12**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_13**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_14**: `number`</span>
  - <span data-field-type="primitive">**NPC_ALPINE_15**: `number`</span>
- <span data-field-type="array">**indexToNpc**: `table[]` (length: 15)</span>
- <span data-field-type="object">**npcs**: `table`</span>
  - <span data-field-type="object">**NPC_ALPINE_01**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_02**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_03**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_04**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_05**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_06**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_07**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_08**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_09**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_10**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_11**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_12**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_13**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_14**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**NPC_ALPINE_15**: `table`</span>
    - <span data-field-type="primitive">**finishedMissions**: `number`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
- <span data-field-type="primitive">**numNpcs**: `number`</span>
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>

## Usage Example

```lua
-- Access g_npcManager fields
```
