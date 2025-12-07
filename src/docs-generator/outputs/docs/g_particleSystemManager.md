---
title: g_particleSystemManager
description: Global g_particleSystemManager - Runtime introspected API
fieldTypes:
  array: 1
  function: 12
  object: 26
  primitive: 276
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_particleSystemManager

Runtime-introspected API for `g_particleSystemManager`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 16 top-level fields

<TypeFilter fieldTypes={{
  array: 1,
  function: 12,
  object: 26,
  primitive: 276,
}} />

## Overview

The `g_particleSystemManager` global contains the following structure:

## Fields

- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**getParticleSystem**: `function`</span>
- <span data-field-type="function">**initDataStructures**: `function`</span>
- <span data-field-type="function">**unloadMapData**: `function`</span>
- <span data-field-type="function">**loadMapData**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**getParticleSystemTypeByName**: `function`</span>
- <span data-field-type="function">**addParticleType**: `function`</span>
- <span data-field-type="function">**addParticleSystem**: `function`</span>
- <span data-field-type="object">**nameToIndex**: `table`</span>
  - <span data-field-type="primitive">**BEES**: `number`</span>
  - <span data-field-type="primitive">**CHAINSAW_DUST**: `number`</span>
  - <span data-field-type="primitive">**CHAINSAW_WOOD**: `number`</span>
  - <span data-field-type="primitive">**CHOPPER**: `number`</span>
  - <span data-field-type="primitive">**CLEANING_DUST**: `number`</span>
  - <span data-field-type="primitive">**CLEANING_SOIL**: `number`</span>
  - <span data-field-type="primitive">**CRUSHER_DUST**: `number`</span>
  - <span data-field-type="primitive">**CRUSHER_WOOD**: `number`</span>
  - <span data-field-type="primitive">**CUTTER_CHOPPER**: `number`</span>
  - <span data-field-type="primitive">**HORSE_STEP_FAST**: `number`</span>
  - <span data-field-type="primitive">**HORSE_STEP_SLOW**: `number`</span>
  - <span data-field-type="primitive">**LOADING**: `number`</span>
  - <span data-field-type="primitive">**PICKUP**: `number`</span>
  - <span data-field-type="primitive">**PICKUP_FALLING**: `number`</span>
  - <span data-field-type="primitive">**PREPARE_FRUIT**: `number`</span>
  - *...and 20 more fields*
- <span data-field-type="primitive">**loadedMapData**: `boolean`</span>
- <span data-field-type="array">**particleTypes**: `string[]` (length: 35)</span>
- <span data-field-type="object">**particleSystems**: `table`</span>
  - <span data-field-type="object">**BEES**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**CHAINSAW_DUST**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**CHAINSAW_WOOD**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**CLEANING_DUST**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**CLEANING_SOIL**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**CRUSHER_DUST**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**CRUSHER_WOOD**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**HORSE_STEP_FAST**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**HORSE_STEP_SLOW**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**LOADING**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**PREPARE_FRUIT**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**SMOKE**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**SMOKE_CHIMNEY**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**SOIL**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - <span data-field-type="object">**SOIL_BIG_CHUNKS**: `table`</span>
    - <span data-field-type="primitive">**defaultEmitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**emitterShape**: `number`</span>
    - <span data-field-type="primitive">**emitterShapeSize**: `number`</span>
    - <span data-field-type="primitive">**forceFullLifespan**: `boolean`</span>
    - <span data-field-type="primitive">**geometry**: `number`</span>
    - <span data-field-type="primitive">**isEmitting**: `boolean`</span>
    - <span data-field-type="primitive">**isValid**: `boolean`</span>
    - <span data-field-type="primitive">**originalLifespan**: `number`</span>
    - <span data-field-type="primitive">**shape**: `number`</span>
    - <span data-field-type="primitive">**worldSpace**: `boolean`</span>
  - *...and 9 more fields*

## Usage Example

```lua
-- Access g_particleSystemManager fields
```
