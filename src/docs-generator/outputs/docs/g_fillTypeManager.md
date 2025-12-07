---
title: g_fillTypeManager
description: Global g_fillTypeManager - Runtime introspected API
fieldTypes:
  array: 127
  function: 42
  object: 223
  other: 28
  primitive: 1763
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_fillTypeManager

Runtime-introspected API for `g_fillTypeManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 67 top-level fields

<TypeFilter fieldTypes={{
  array: 127,
  function: 42,
  object: 223,
  other: 28,
  primitive: 1763,
}} />

## Overview

The `g_fillTypeManager` global contains the following structure:

## Fields

- <span data-field-type="function">**assignFillTypeTextureArrays**: `function`</span>
- <span data-field-type="function">**registerXMLPaths**: `function`</span>
- <span data-field-type="function">**unloadMapData**: `function`</span>
- <span data-field-type="function">**loadMapData**: `function`</span>
- <span data-field-type="function">**addModWithFillTypes**: `function`</span>
- <span data-field-type="function">**loadFillTypes**: `function`</span>
- <span data-field-type="function">**constructFillTypeTextureArrays**: `function`</span>
- <span data-field-type="function">**deleteFillTypeTextureArrays**: `function`</span>
- <span data-field-type="function">**addFillType**: `function`</span>
- <span data-field-type="function">**loadDefaultTypes**: `function`</span>
- <span data-field-type="function">**addFillTypeToCategory**: `function`</span>
- <span data-field-type="function">**addFillTypeCategory**: `function`</span>
- <span data-field-type="function">**addFillTypeConversion**: `function`</span>
- <span data-field-type="function">**addFillTypeConverter**: `function`</span>
- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getFillTypesByCategoryNames**: `function`</span>
- <span data-field-type="function">**deleteDensityMapHeightTextureArrays**: `function`</span>
- <span data-field-type="function">**getFillTypesByNames**: `function`</span>
- <span data-field-type="function">**getFillTypes**: `function`</span>
- <span data-field-type="function">**getFillTypesFromXML**: `function`</span>
- <span data-field-type="function">**getSampleByFillType**: `function`</span>
- <span data-field-type="function">**getConverterDataByName**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**getIsFillTypeInCategory**: `function`</span>
- <span data-field-type="function">**getFillTypeTitleByIndex**: `function`</span>
- <span data-field-type="function">**constructFillTypeDistanceTextureArray**: `function`</span>
- <span data-field-type="function">**getPrioritizedEffectTypeByFillTypeIndex**: `function`</span>
- <span data-field-type="function">**getFillTypeTextureArraySize**: `function`</span>
- <span data-field-type="function">**getFillTypeTextureArrays**: `function`</span>
- <span data-field-type="function">**getFillTypeByName**: `function`</span>
- <span data-field-type="function">**getFillTypeIndexByName**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**constructDensityMapHeightTextureArrays**: `function`</span>
- <span data-field-type="function">**getTextureArrayIndexByFillTypeIndex**: `function`</span>
- <span data-field-type="function">**getFillTypeNamesByIndices**: `function`</span>
- <span data-field-type="function">**assignDensityMapHeightTextureArrays**: `function`</span>
- <span data-field-type="function">**getFillTypeByIndex**: `function`</span>
- <span data-field-type="function">**getSmokeColorByFillTypeIndex**: `function`</span>
- <span data-field-type="function">**getFillTypeNameByIndex**: `function`</span>
- <span data-field-type="other">**fillTypeIndexToCategories**: `map`</span>
- <span data-field-type="object">**categoryNameToFillTypes**: `table`</span>
  - <span data-field-type="other">**ANIMAL**: `map`</span>
  - <span data-field-type="other">**AUGERWAGON**: `map`</span>
  - <span data-field-type="other">**BULK**: `map`</span>
  - <span data-field-type="other">**COMBINE**: `map`</span>
  - <span data-field-type="other">**FARMSILO**: `map`</span>
  - <span data-field-type="other">**FORAGEHARVESTER**: `map`</span>
  - <span data-field-type="other">**FORAGEWAGON**: `map`</span>
  - <span data-field-type="other">**FORK**: `map`</span>
  - <span data-field-type="other">**HAYLOFT**: `map`</span>
  - <span data-field-type="other">**HORSE**: `map`</span>
  - <span data-field-type="other">**LIQUID**: `map`</span>
  - <span data-field-type="other">**LOADINGVEHICLE**: `map`</span>
  - <span data-field-type="other">**MANURESPREADER**: `map`</span>
  - <span data-field-type="other">**MIXERWAGON**: `map`</span>
  - <span data-field-type="other">**PIECE**: `map`</span>
  - *...and 10 more fields*
- <span data-field-type="array">**categoryIndexToFillTypes**: `table[]` (length: 25)</span>
- <span data-field-type="object">**nameToCategoryIndex**: `table`</span>
  - <span data-field-type="primitive">**ANIMAL**: `number`</span>
  - <span data-field-type="primitive">**AUGERWAGON**: `number`</span>
  - <span data-field-type="primitive">**BULK**: `number`</span>
  - <span data-field-type="primitive">**COMBINE**: `number`</span>
  - <span data-field-type="primitive">**FARMSILO**: `number`</span>
  - <span data-field-type="primitive">**FORAGEHARVESTER**: `number`</span>
  - <span data-field-type="primitive">**FORAGEWAGON**: `number`</span>
  - <span data-field-type="primitive">**FORK**: `number`</span>
  - <span data-field-type="primitive">**HAYLOFT**: `number`</span>
  - <span data-field-type="primitive">**HORSE**: `number`</span>
  - <span data-field-type="primitive">**LIQUID**: `number`</span>
  - <span data-field-type="primitive">**LOADINGVEHICLE**: `number`</span>
  - <span data-field-type="primitive">**MANURESPREADER**: `number`</span>
  - <span data-field-type="primitive">**MIXERWAGON**: `number`</span>
  - <span data-field-type="primitive">**PIECE**: `number`</span>
  - *...and 10 more fields*
- <span data-field-type="object">**nameToConverter**: `table`</span>
  - <span data-field-type="other">**SUGARBEET_CUTTER**: `map`</span>
  - <span data-field-type="other">**TEDDER**: `map`</span>
- <span data-field-type="object">**converterNameToIndex**: `table`</span>
  - <span data-field-type="primitive">**SUGARBEET_CUTTER**: `number`</span>
  - <span data-field-type="primitive">**TEDDER**: `number`</span>
- <span data-field-type="array">**fillTypeConverters**: `table[]` (length: 2)</span>
- <span data-field-type="array">**indexToTitle**: `string[]` (length: 108)</span>

*...and 17 more top-level fields*

## Usage Example

```lua
-- Access g_fillTypeManager fields
```
