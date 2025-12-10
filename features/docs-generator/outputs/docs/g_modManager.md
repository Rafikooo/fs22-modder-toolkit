---
title: g_modManager
description: Global g_modManager - Runtime introspected API
fieldTypes:
  array: 3
  function: 21
  object: 15
  primitive: 168
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_modManager

Runtime-introspected API for `g_modManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 28 top-level fields

<TypeFilter fieldTypes={{
  array: 3,
  function: 21,
  object: 15,
  primitive: 168,
}} />

## Overview

The `g_modManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getModByIndex**: `function`</span>
- <span data-field-type="function">**removeMod**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**getAreAllModsAvailable**: `function`</span>
- <span data-field-type="function">**getHasSelectableValidMod**: `function`</span>
- <span data-field-type="function">**getNumOfValidMods**: `function`</span>
- <span data-field-type="function">**getHasSelectableMod**: `function`</span>
- <span data-field-type="function">**getModByFileHash**: `function`</span>
- <span data-field-type="function">**getMods**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**getModByName**: `function`</span>
- <span data-field-type="function">**getActiveMods**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**getNumOfMods**: `function`</span>
- <span data-field-type="function">**getMultiplayerMods**: `function`</span>
- <span data-field-type="function">**isModMap**: `function`</span>
- <span data-field-type="function">**getIsModAvailable**: `function`</span>
- <span data-field-type="function">**addMod**: `function`</span>
- <span data-field-type="object">**nameToMod**: `table`</span>
  - <span data-field-type="object">**FS22_000_DevTools**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**fileHash**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - *...and 4 more fields*
  - <span data-field-type="object">**FS22_Courseplay**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - <span data-field-type="primitive">**modName**: `string`</span>
    - *...and 3 more fields*
  - <span data-field-type="object">**FS22_EasyDevControls**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**fileHash**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - *...and 4 more fields*
  - <span data-field-type="object">**FS22_FarmlandPriceModifier**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - <span data-field-type="primitive">**modName**: `string`</span>
    - *...and 3 more fields*
  - <span data-field-type="object">**FS22_GlobalExplorer**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - <span data-field-type="primitive">**modName**: `string`</span>
    - *...and 3 more fields*
  - <span data-field-type="object">**FS22_RuntimeInspector**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - <span data-field-type="primitive">**modName**: `string`</span>
    - *...and 3 more fields*
  - <span data-field-type="object">**FS22_additionalGameSettings**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - <span data-field-type="primitive">**modName**: `string`</span>
    - *...and 3 more fields*
  - <span data-field-type="object">**arena**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**fileHash**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - *...and 4 more fields*
  - <span data-field-type="object">**baleStacking**: `table`</span>
    - <span data-field-type="primitive">**absBaseFilename**: `string`</span>
    - <span data-field-type="primitive">**author**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**fileHash**: `string`</span>
    - <span data-field-type="primitive">**hasScripts**: `boolean`</span>
    - <span data-field-type="primitive">**iconFilename**: `string`</span>
    - <span data-field-type="primitive">**id**: `number`</span>
    - <span data-field-type="primitive">**isDLC**: `boolean`</span>
    - <span data-field-type="primitive">**isDirectory**: `boolean`</span>
    - <span data-field-type="primitive">**isInternalScriptMod**: `boolean`</span>
    - <span data-field-type="primitive">**isMultiplayerSupported**: `boolean`</span>
    - <span data-field-type="primitive">**isSelectable**: `boolean`</span>
    - <span data-field-type="primitive">**modDescVersion**: `number`</span>
    - <span data-field-type="primitive">**modDir**: `string`</span>
    - <span data-field-type="primitive">**modFile**: `string`</span>
    - *...and 4 more fields*
- <span data-field-type="object">**hashToMod**: `table`</span>
  - <span data-field-type="object">**0855fc7ef09b8d4f9b915d2312930ae5**: `table`</span>
  - <span data-field-type="object">**428da112bbd4a407d9f4ceb45198e144**: `table`</span>
  - <span data-field-type="object">**c69e7762899893a1dd19d4c0027e119d**: `table`</span>
  - <span data-field-type="object">**f140420dbbe13b9edb91d95227af6541**: `table`</span>
- <span data-field-type="primitive">**numMods**: `number`</span>
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>
- <span data-field-type="array">**mods**: `table[]` (length: 9)</span>
- <span data-field-type="array">**multiplayerMods**: `table[]` (length: 4)</span>
- <span data-field-type="array">**validMods**: `table[]` (length: 4)</span>

## Usage Example

```lua
-- Access g_modManager fields
```
