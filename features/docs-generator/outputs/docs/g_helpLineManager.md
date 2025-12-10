---
title: g_helpLineManager
description: Global g_helpLineManager - Runtime introspected API
fieldTypes:
  array: 3
  function: 25
  object: 5
  other: 1
  primitive: 2
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_helpLineManager

Runtime-introspected API for `g_helpLineManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 27 top-level fields

<TypeFilter fieldTypes={{
  array: 3,
  function: 25,
  object: 5,
  other: 1,
  primitive: 2,
}} />

## Overview

The `g_helpLineManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**convertText**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**unloadMapData**: `function`</span>
- <span data-field-type="function">**loadMapData**: `function`</span>
- <span data-field-type="function">**addModCategory**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**onIconLoaded**: `function`</span>
- <span data-field-type="function">**onIconTrigger**: `function`</span>
- <span data-field-type="function">**getCategory**: `function`</span>
- <span data-field-type="function">**getCategories**: `function`</span>
- <span data-field-type="function">**loadPage**: `function`</span>
- <span data-field-type="function">**loadCategory**: `function`</span>
- <span data-field-type="function">**loadFromXML**: `function`</span>
- <span data-field-type="object">**idToCategoryIndex**: `table`</span>
- <span data-field-type="object">**modCategories**: `table`</span>
- <span data-field-type="array">**categories**: `table[]` (length: 11)</span>
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>
- <span data-field-type="object">**idToIndices**: `table`</span>
- <span data-field-type="object">**activatable**: `table`</span>
  - **Methods**: 8 available
    - `superClass()`
    - `copy()`
    - `class()`
    - `getDistance()`
    - `new()`
    - `run()`
    - `getIsActivatable()`
    - `isa()`
  - <span data-field-type="primitive">**activateText**: `string`</span>
- <span data-field-type="array">**sharedLoadingIds**: `number[]` (length: 6)</span>
- <span data-field-type="other">**triggerNodeToData**: `map`</span>
- <span data-field-type="array">**triggers**: `table[]` (length: 6)</span>
- <span data-field-type="object">**categoryNames**: `table`</span>

## Usage Example

```lua
-- Access g_helpLineManager fields
```
