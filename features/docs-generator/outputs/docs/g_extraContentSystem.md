---
title: g_extraContentSystem
description: Global g_extraContentSystem - Runtime introspected API
fieldTypes:
  array: 19
  function: 21
  object: 19
  primitive: 144
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_extraContentSystem

Runtime-introspected API for `g_extraContentSystem`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 23 top-level fields

<TypeFilter fieldTypes={{
  array: 19,
  function: 21,
  object: 19,
  primitive: 144,
}} />

## Overview

The `g_extraContentSystem` global contains the following structure:

## Fields

- <span data-field-type="function">**getIsItemIdUnlocked**: `function`</span>
- <span data-field-type="function">**addItem**: `function`</span>
- <span data-field-type="function">**getStringHasValidCharacters**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**reset**: `function`</span>
- <span data-field-type="function">**loadFromProfile**: `function`</span>
- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getChecksumChar**: `function`</span>
- <span data-field-type="function">**getItemByCode**: `function`</span>
- <span data-field-type="function">**getItemByKey**: `function`</span>
- <span data-field-type="function">**getIsItemUnlocked**: `function`</span>
- <span data-field-type="function">**loadFromXML**: `function`</span>
- <span data-field-type="function">**createItemKey**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**delete**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**saveToProfile**: `function`</span>
- <span data-field-type="function">**unlockItem**: `function`</span>
- <span data-field-type="function">**getHasLockedItems**: `function`</span>
- <span data-field-type="function">**getUnlockedItems**: `function`</span>
- <span data-field-type="object">**idToItem**: `table`</span>
  - <span data-field-type="object">**ALDI_HAT**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**ALDI_HOODIE**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**ALDI_SHIRT**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**ALDI_SHORTS**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**ERO**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**FARMALL_PACK**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**FENDT900BB**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**GIANTS**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**HORSCH**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**KUBOTA**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**MACK_BLACK_ANTHEM**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**PORSCHE_JUNIOR**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**STADIA**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**VERMEER**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - <span data-field-type="object">**VOLVO**: `table`</span>
    - <span data-field-type="array">**charList**: `string[]` (length: 3)</span>
    - <span data-field-type="primitive">**code**: `string`</span>
    - <span data-field-type="primitive">**description**: `string`</span>
    - <span data-field-type="primitive">**id**: `string`</span>
    - <span data-field-type="primitive">**imageFilename**: `string`</span>
    - <span data-field-type="primitive">**isAutoUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**isUnlocked**: `boolean`</span>
    - <span data-field-type="primitive">**title**: `string`</span>
    - <span data-field-type="primitive">**unlockedByDLC**: `boolean`</span>
  - *...and 3 more fields*
- <span data-field-type="array">**items**: `table[]` (length: 18)</span>

## Usage Example

```lua
-- Access g_extraContentSystem fields
```
