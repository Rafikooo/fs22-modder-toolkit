---
title: g_helperManager
description: Global g_helperManager - Runtime introspected API
fieldTypes:
  array: 12
  function: 18
  object: 12
  primitive: 52
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_helperManager

Runtime-introspected API for `g_helperManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 24 top-level fields

<TypeFilter fieldTypes={{
  array: 12,
  function: 18,
  object: 12,
  primitive: 52,
}} />

## Overview

The `g_helperManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getHelperByName**: `function`</span>
- <span data-field-type="function">**getHelperByIndex**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**getRandomHelperModel**: `function`</span>
- <span data-field-type="function">**getRandomHelper**: `function`</span>
- <span data-field-type="function">**loadMapData**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**loadHelpers**: `function`</span>
- <span data-field-type="function">**loadDefaultTypes**: `function`</span>
- <span data-field-type="function">**addHelper**: `function`</span>
- <span data-field-type="function">**getNumOfHelpers**: `function`</span>
- <span data-field-type="function">**releaseHelper**: `function`</span>
- <span data-field-type="function">**getRandomIndex**: `function`</span>
- <span data-field-type="function">**useHelper**: `function`</span>
- <span data-field-type="object">**nameToIndex**: `table`</span>
  - <span data-field-type="primitive">**A**: `number`</span>
  - <span data-field-type="primitive">**B**: `number`</span>
  - <span data-field-type="primitive">**C**: `number`</span>
  - <span data-field-type="primitive">**D**: `number`</span>
  - <span data-field-type="primitive">**E**: `number`</span>
  - <span data-field-type="primitive">**F**: `number`</span>
  - <span data-field-type="primitive">**G**: `number`</span>
  - <span data-field-type="primitive">**H**: `number`</span>
  - <span data-field-type="primitive">**I**: `number`</span>
  - <span data-field-type="primitive">**J**: `number`</span>
- <span data-field-type="object">**helpers**: `table`</span>
  - <span data-field-type="object">**A**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**B**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**C**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**D**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**E**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**F**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**G**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**H**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**I**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**J**: `table`</span>
    - <span data-field-type="array">**color**: `number[]` (length: 3)</span>
    - <span data-field-type="primitive">**index**: `number`</span>
    - <span data-field-type="primitive">**modelFilename**: `string`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
- <span data-field-type="primitive">**numHelpers**: `number`</span>
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>
- <span data-field-type="array">**availableHelpers**: `table[]` (length: 10)</span>
- <span data-field-type="array">**indexToHelper**: `table[]` (length: 10)</span>

## Usage Example

```lua
-- Access g_helperManager fields
```
