---
title: g_materialManager
description: Global g_materialManager - Runtime introspected API
fieldTypes:
  array: 23
  function: 125
  object: 16
  other: 1
  primitive: 160
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_materialManager

Runtime-introspected API for `g_materialManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 36 top-level fields

<TypeFilter fieldTypes={{
  array: 23,
  function: 125,
  object: 16,
  other: 1,
  primitive: 160,
}} />

## Overview

The `g_materialManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getBaseMaterialByName**: `function`</span>
- <span data-field-type="function">**unloadMapData**: `function`</span>
- <span data-field-type="function">**loadMapData**: `function`</span>
- <span data-field-type="function">**registerXMLPaths**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**getMaterialTypeByName**: `function`</span>
- <span data-field-type="function">**loadFontMaterialsXML**: `function`</span>
- <span data-field-type="function">**getMaterial**: `function`</span>
- <span data-field-type="function">**loadModMaterialHolders**: `function`</span>
- <span data-field-type="function">**getFontMaterial**: `function`</span>
- <span data-field-type="function">**materialHolderLoaded**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**getMaterialFromTarget**: `function`</span>
- <span data-field-type="function">**addMaterialType**: `function`</span>
- <span data-field-type="function">**addModMaterialHolder**: `function`</span>
- <span data-field-type="function">**getParticleMaterial**: `function`</span>
- <span data-field-type="function">**addMaterial**: `function`</span>
- <span data-field-type="function">**addMaterialToTarget**: `function`</span>
- <span data-field-type="function">**addBaseMaterial**: `function`</span>
- <span data-field-type="function">**addParticleMaterial**: `function`</span>
- <span data-field-type="function">**fontMaterialLoaded**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="object">**nameToIndex**: `table`</span>
  - <span data-field-type="primitive">**BELT**: `number`</span>
  - <span data-field-type="primitive">**BELT_CROPCLEAN**: `number`</span>
  - <span data-field-type="primitive">**BELT_CROPDIRT**: `number`</span>
  - <span data-field-type="primitive">**CHOPPER**: `number`</span>
  - <span data-field-type="primitive">**FILLPLANE**: `number`</span>
  - <span data-field-type="primitive">**ICON**: `number`</span>
  - <span data-field-type="primitive">**LEVELER**: `number`</span>
  - <span data-field-type="primitive">**MOWER**: `number`</span>
  - <span data-field-type="primitive">**PICKUP**: `number`</span>
  - <span data-field-type="primitive">**PIPE**: `number`</span>
  - <span data-field-type="primitive">**SMOKE**: `number`</span>
  - <span data-field-type="primitive">**SOIL**: `number`</span>
  - <span data-field-type="primitive">**SPRAYER**: `number`</span>
  - <span data-field-type="primitive">**SPREADER**: `number`</span>
  - <span data-field-type="primitive">**STRAW**: `number`</span>
  - *...and 2 more fields*
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>
- <span data-field-type="array">**fontMaterials**: `table[]` (length: 10)</span>
- <span data-field-type="object">**loadedMaterialHolderNodes**: `table`</span>
- <span data-field-type="object">**baseMaterialsByName**: `table`</span>
  - <span data-field-type="primitive">**BELT**: `number`</span>
  - <span data-field-type="primitive">**FILLPLANE**: `number`</span>
  - <span data-field-type="primitive">**LEVELER**: `number`</span>
  - <span data-field-type="primitive">**PIPE**: `number`</span>
  - <span data-field-type="primitive">**SLURRY**: `number`</span>
  - <span data-field-type="primitive">**SLURRYSIDETOSIDE**: `number`</span>
  - <span data-field-type="primitive">**SMOKEPARTICLE**: `number`</span>
  - <span data-field-type="primitive">**SOIL**: `number`</span>
  - <span data-field-type="primitive">**UNLOADING**: `number`</span>
  - <span data-field-type="primitive">**UNLOADINGPARTICLE**: `number`</span>
  - <span data-field-type="primitive">**UNLOADINGSMOKE**: `number`</span>
  - <span data-field-type="primitive">**WASHER**: `number`</span>
- <span data-field-type="array">**baseMaterials**: `number[]` (length: 12)</span>
- <span data-field-type="object">**fontMaterialsByName**: `table`</span>
  - <span data-field-type="object">**DIGIT**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**DIGIT_BOLD**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**GENERIC**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 72)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**GENERIC_BOLD**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 72)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**LICENSE_PLATE_CZ**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**LICENSE_PLATE_DE**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**LICENSE_PLATE_FR**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**LICENSE_PLATE_PL**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**LICENSE_PLATE_UK**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
  - <span data-field-type="object">**LICENSE_PLATE_US**: `table`</span>
    - <span data-field-type="primitive">**charToCharSpace**: `number`</span>
    - <span data-field-type="primitive">**characterShape**: `number`</span>
    - <span data-field-type="primitive">**characterShapePath**: `string`</span>
    - <span data-field-type="array">**characters**: `table[]` (length: 46)</span>
    - <span data-field-type="array">**charactersByType**: `table[]` (length: 3)</span>
    - <span data-field-type="primitive">**materialId**: `number`</span>
    - <span data-field-type="primitive">**materialIdNoNormal**: `number`</span>
    - <span data-field-type="primitive">**materialNode**: `number`</span>
    - <span data-field-type="primitive">**materialNodeNoNormal**: `number`</span>
    - <span data-field-type="primitive">**name**: `string`</span>
    - <span data-field-type="primitive">**noNormalNode**: `string`</span>
    - <span data-field-type="primitive">**node**: `string`</span>
    - <span data-field-type="primitive">**sharedLoadRequestId**: `number`</span>
    - <span data-field-type="primitive">**spacingX**: `number`</span>
    - <span data-field-type="primitive">**spacingY**: `number`</span>
- <span data-field-type="object">**modMaterialHoldersToLoad**: `table`</span>
- <span data-field-type="object">**particleMaterials**: `table`</span>
- <span data-field-type="other">**materials**: `map`</span>
- <span data-field-type="array">**materialTypes**: `string[]` (length: 17)</span>

## Usage Example

```lua
-- Access g_materialManager fields
```
