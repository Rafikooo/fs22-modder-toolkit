---
title: g_modIsLoaded
description: Global g_modIsLoaded - Runtime introspected API
fieldTypes:
  primitive: 5
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_modIsLoaded

Runtime-introspected API for `g_modIsLoaded`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 5 top-level fields

<TypeFilter fieldTypes={{
  primitive: 5,
}} />

## Overview

The `g_modIsLoaded` global contains the following structure:

## Fields

- <span data-field-type="primitive">**FS22_Courseplay**: `boolean`</span>
- <span data-field-type="primitive">**FS22_FarmlandPriceModifier**: `boolean`</span>
- <span data-field-type="primitive">**FS22_GlobalExplorer**: `boolean`</span>
- <span data-field-type="primitive">**FS22_RuntimeInspector**: `boolean`</span>
- <span data-field-type="primitive">**FS22_additionalGameSettings**: `boolean`</span>

## Usage Example

```lua
-- Access g_modIsLoaded fields
local value = g_modIsLoaded.FS22_Courseplay
local value = g_modIsLoaded.FS22_FarmlandPriceModifier
local value = g_modIsLoaded.FS22_GlobalExplorer
```
