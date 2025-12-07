---
title: g_groundTypeManager
description: Global g_groundTypeManager - Runtime introspected API
fieldTypes:
  array: 11
  function: 12
  object: 24
  primitive: 100
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_groundTypeManager

Runtime-introspected API for `g_groundTypeManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 16 top-level fields

<TypeFilter fieldTypes={{
  array: 11,
  function: 12,
  object: 24,
  primitive: 100,
}} />

## Overview

The `g_groundTypeManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**loadGroundTypeMappings**: `function`</span>
- <span data-field-type="function">**loadMapData**: `function`</span>
- <span data-field-type="function">**getTerrainLayerByType**: `function`</span>
- <span data-field-type="function">**getTerrainTitleByType**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**initTerrain**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**loadGroundTypes**: `function`</span>
- <span data-field-type="object">**groundTypeMappings**: `table`</span>
  - <span data-field-type="object">**animalMud**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
  - <span data-field-type="object">**asphalt**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
  - <span data-field-type="object">**concrete**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
  - <span data-field-type="object">**dirt**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
  - <span data-field-type="object">**forestGround**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
  - <span data-field-type="object">**grass**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
  - <span data-field-type="object">**gravel**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
  - <span data-field-type="object">**rock**: `table`</span>
    - <span data-field-type="primitive">**layerName**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**typeName**: `string`</span>
- <span data-field-type="object">**groundTypes**: `table`</span>
  - <span data-field-type="object">**animalMud**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 1)</span>
  - <span data-field-type="object">**asphalt**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 3)</span>
  - <span data-field-type="object">**cobblestones**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 3)</span>
  - <span data-field-type="object">**concrete**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 3)</span>
  - <span data-field-type="object">**dirt**: `table`</span>
    - <span data-field-type="object">**fallbacks**: `table`</span>
  - <span data-field-type="object">**flagstones**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 4)</span>
  - <span data-field-type="object">**forestGround**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 1)</span>
  - <span data-field-type="object">**grass**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 1)</span>
  - <span data-field-type="object">**gravel**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 1)</span>
  - <span data-field-type="object">**plates**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 3)</span>
  - <span data-field-type="object">**rock**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 3)</span>
  - <span data-field-type="object">**sand**: `table`</span>
    - <span data-field-type="array">**fallbacks**: `string[]` (length: 1)</span>
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>
- <span data-field-type="object">**terrainLayerMapping**: `table`</span>
  - <span data-field-type="primitive">**ANIMALMUD**: `number`</span>
  - <span data-field-type="primitive">**ASPHALTALPINE**: `number`</span>
  - <span data-field-type="primitive">**CONCRETE**: `number`</span>
  - <span data-field-type="primitive">**CONCRETETILESALPINE**: `number`</span>
  - <span data-field-type="primitive">**FORESTNEEDLES**: `number`</span>
  - <span data-field-type="primitive">**GRASSALPINE**: `number`</span>
  - <span data-field-type="primitive">**GRASSCLIFF**: `number`</span>
  - <span data-field-type="primitive">**GRAVEL**: `number`</span>
  - <span data-field-type="primitive">**GRAVELALPINE**: `number`</span>
  - <span data-field-type="primitive">**MOUNTAINROCK**: `number`</span>
  - <span data-field-type="primitive">**PLATE**: `number`</span>
  - <span data-field-type="primitive">**RIVERBANK**: `number`</span>
  - <span data-field-type="primitive">**ROUGHDIRT**: `number`</span>
  - <span data-field-type="primitive">**SANDWET**: `number`</span>
  - <span data-field-type="primitive">**animalMud01**: `number`</span>
  - *...and 60 more fields*

## Usage Example

```lua
-- Access g_groundTypeManager fields
```
