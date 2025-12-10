---
title: g_inputDisplayManager
description: Global g_inputDisplayManager - Runtime introspected API
fieldTypes:
  array: 53
  class: 18
  function: 847
  "global-ref": 4
  object: 1577
  other: 35
  primitive: 2009
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_inputDisplayManager

Runtime-introspected API for `g_inputDisplayManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 61 top-level fields

<TypeFilter fieldTypes={{
  array: 53,
  class: 18,
  function: 847,
  "global-ref": 4,
  object: 1577,
  other: 35,
  primitive: 2009,
}} />

## Overview

The `g_inputDisplayManager` global contains the following structure:

## Fields

- <span data-field-type="function">**makeHelpElement**: `function`</span>
- <span data-field-type="function">**getKeyboardBindings**: `function`</span>
- <span data-field-type="function">**addRegularSymbols**: `function`</span>
- <span data-field-type="function">**requireSymbolAccumulation**: `function`</span>
- <span data-field-type="function">**addComboSymbols**: `function`</span>
- <span data-field-type="function">**getActionBindingsForContext**: `function`</span>
- <span data-field-type="function">**storeComboHelpElements**: `function`</span>
- <span data-field-type="function">**storeEventHelpElements**: `function`</span>
- <span data-field-type="function">**sortEventHelpElementsGamepad**: `function`</span>
- <span data-field-type="function">**sortEventHelpElements**: `function`</span>
- <span data-field-type="function">**getFirstBindingAxisAndDeviceForActionName**: `function`</span>
- <span data-field-type="function">**getPrefix**: `function`</span>
- <span data-field-type="function">**onActionEventsChanged**: `function`</span>
- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**debugRenderControllerSymbols**: `function`</span>
- <span data-field-type="function">**getKeyboardInputActionKey**: `function`</span>
- <span data-field-type="function">**getGamepadInputActionOverlay**: `function`</span>
- <span data-field-type="function">**getKeyboardKeyOverlay**: `function`</span>
- <span data-field-type="function">**getOrOverlay**: `function`</span>
- <span data-field-type="function">**getPlusOverlay**: `function`</span>
- <span data-field-type="function">**getComboHelpElements**: `function`</span>
- <span data-field-type="function">**getEventHelpElements**: `function`</span>
- <span data-field-type="function">**getEventHelpElementForAction**: `function`</span>
- <span data-field-type="function">**getControllerSymbolOverlays**: `function`</span>
- <span data-field-type="function">**draw**: `function`</span>
- <span data-field-type="function">**onActionBindingsChanged**: `function`</span>
- <span data-field-type="function">**consoleCommandShowInputControllerSymbols**: `function`</span>
- <span data-field-type="function">**loadModAxisIcons**: `function`</span>
- <span data-field-type="function">**loadAxisIcons**: `function`</span>
- <span data-field-type="function">**loadControllerSymbolsAndOverlays**: `function`</span>
- <span data-field-type="function">**setDevGamepadLabelMapping**: `function`</span>
- <span data-field-type="function">**load**: `function`</span>
- <span data-field-type="function">**createButtonOverlay**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**addContextBindings**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**delete**: `function`</span>
- <span data-field-type="function">**getGamepadInputSymbolName**: `function`</span>
- <span data-field-type="function">**resolveAccumulatedSymbolPermutations**: `function`</span>
- <span data-field-type="function">**getMouseInputSymbolName**: `function`</span>
- <span data-field-type="function">**resolveUnmodifiedSymbols**: `function`</span>
- <span data-field-type="function">**resolveModifierSymbols**: `function`</span>
- <span data-field-type="other">**actionBindings**: `reverse-hash-map`</span>
- <span data-field-type="array">**actionList**: `table[]` (length: 285)</span>
- <span data-field-type="object">**axisIconOverlays**: `table`</span>
  - <span data-field-type="object">**BEET_PICKUP_TRANS_X**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**BEET_PICKUP_TRANS_Y**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_ARM1_ROTATE_X**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_ARM1_ROTATE_Y**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_ARM1_TRANSLATE**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_ARM2_ROTATE_TOOL**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_ARM2_ROTATE_X**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_ARM2_TRANSLATE**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_EC_TRANSLATE_Y**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**CRANE_EC_TRANSLATE_Z**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**DRAWBAR_ROTATE_X**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**FORKLIFT_ROTATE_X**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**FORKLIFT_TRANSLATE_Y**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**FRONTLOADER_ARM_ROTATE**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - <span data-field-type="object">**FRONTLOADER_ARM_ROTATE_TOOL**: `table`</span>
    - <span data-field-type="primitive">**a**: `number`</span>
    - <span data-field-type="primitive">**alignmentHorizontal**: `number`</span>
    - <span data-field-type="primitive">**alignmentVertical**: `number`</span>
    - <span data-field-type="primitive">**b**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**defaultHeight**: `number`</span>
    - <span data-field-type="primitive">**defaultWidth**: `number`</span>
    - <span data-field-type="primitive">**filename**: `string`</span>
    - <span data-field-type="primitive">**g**: `number`</span>
    - <span data-field-type="primitive">**height**: `number`</span>
    - <span data-field-type="primitive">**invertX**: `boolean`</span>
    - <span data-field-type="primitive">**offsetX**: `number`</span>
    - <span data-field-type="primitive">**offsetY**: `number`</span>
    - <span data-field-type="primitive">**overlayId**: `number`</span>
    - <span data-field-type="primitive">**r**: `number`</span>
    - *...and 10 more fields*
  - *...and 21 more fields*
- <span data-field-type="primitive">**isMobileVersion**: `boolean`</span>
- <span data-field-type="global-ref">**modManager**: `global-ref` → [`g_modManager`](../globals/g_modManager.md)</span>
- <span data-field-type="primitive">**isConsoleVersion**: `boolean`</span>

*...and 11 more top-level fields*

## Usage Example

```lua
-- Access g_inputDisplayManager fields
```
