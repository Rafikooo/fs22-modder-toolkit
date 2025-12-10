---
title: g_mapManager
description: Global g_mapManager - Runtime introspected API
fieldTypes:
  array: 1
  function: 14
  object: 6
  primitive: 75
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_mapManager

Runtime-introspected API for `g_mapManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 17 top-level fields

<TypeFilter fieldTypes={{
  array: 1,
  function: 14,
  object: 6,
  primitive: 75,
}} />

## Overview

The `g_mapManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getModNameFromMapId**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**getMapDataByIndex**: `function`</span>
- <span data-field-type="function">**getNumOfMaps**: `function`</span>
- <span data-field-type="function">**loadMapFromXML**: `function`</span>
- <span data-field-type="function">**getMapByConfigFilename**: `function`</span>
- <span data-field-type="function">**getMapById**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**removeMapItem**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**addMapItem**: `function`</span>
- <span data-field-type="object">**idToMap**: `table`</span>
  - <span data-field-type="object">**MapFR**: `table`</span>
    - <span data-field-type="primitive">**baseDirectory**: `string`</span>
    - <span data-field-type="primitive">**className**: `string`</span>
    - <span data-field-type="primitive">**defaultItemsXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultPlaceablesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultVehiclesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**isModMap**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**mapXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**scriptFilename**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**MapUS**: `table`</span>
    - <span data-field-type="primitive">**baseDirectory**: `string`</span>
    - <span data-field-type="primitive">**className**: `string`</span>
    - <span data-field-type="primitive">**defaultItemsXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultPlaceablesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultVehiclesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**isModMap**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**mapXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**scriptFilename**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
  - <span data-field-type="object">**arena.mapArena**: `table`</span>
    - <span data-field-type="primitive">**baseDirectory**: `string`</span>
    - <span data-field-type="primitive">**className**: `string`</span>
    - <span data-field-type="primitive">**customEnvironment**: `string`</span>
    - <span data-field-type="primitive">**defaultItemsXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultPlaceablesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultVehiclesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**isModMap**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**mapXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**prohibitOtherMods**: `boolean`</span>
    - <span data-field-type="primitive">**scriptFilename**: `string`</span>
    - *...and 1 more fields*
  - <span data-field-type="object">**baleStacking.mapBaleStacking**: `table`</span>
    - <span data-field-type="primitive">**baseDirectory**: `string`</span>
    - <span data-field-type="primitive">**className**: `string`</span>
    - <span data-field-type="primitive">**customEnvironment**: `string`</span>
    - <span data-field-type="primitive">**defaultItemsXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultPlaceablesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultVehiclesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**isModMap**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**mapXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**prohibitOtherMods**: `boolean`</span>
    - <span data-field-type="primitive">**scriptFilename**: `string`</span>
    - *...and 1 more fields*
  - <span data-field-type="object">**mapAlpine**: `table`</span>
    - <span data-field-type="primitive">**baseDirectory**: `string`</span>
    - <span data-field-type="primitive">**className**: `string`</span>
    - <span data-field-type="primitive">**defaultItemsXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultPlaceablesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**defaultVehiclesXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**isModMap**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**mapXMLFilename**: `string`</span>
    - <span data-field-type="primitive">**scriptFilename**: `string`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>
- <span data-field-type="array">**maps**: `table[]` (length: 5)</span>

## Usage Example

```lua
-- Access g_mapManager fields
```
