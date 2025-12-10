---
title: g_motionPathEffectManager
description: Global g_motionPathEffectManager - Runtime introspected API
fieldTypes:
  array: 34
  function: 26
  object: 2
  primitive: 2
---

# g_motionPathEffectManager

Runtime-introspected API for `g_motionPathEffectManager`.

**Source**: schemas (depth 2)  
**Fields**: 33 top-level fields

## Field Statistics

Total fields: **33**

- **Function**: 26
- **Object**: 2
- **Array**: 3
- **Primitive**: 2

## Fields by Type

<details>
<summary><strong>Functions (26)</strong></summary>

- **`setEffectCustomShaderVariation()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`loadMotionPathEffects()`**
- **`initDataStructures()`**
- **`loadMotionPathEffectsXML()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`createMotionPathEffectXMLSchema()`**
- **`motionPathEffectI3DFileLoaded()`**
- **`getEffectShaderParameter()`**
- **`applyEffectConfiguration()`**
- **`getMotionPathEffectMaterial()`**
- **`getMotionPathEffectMesh()`**
- **`getSharedMotionPathEffect()`**
- **`registerCustomShaderSettingXMLPaths()`**
- **`setEffectMaterial()`**
- **`deleteCustomShaderMaps()`**
- **`loadCustomShaderSettingsFromXML()`**
- **`new()`**
- **`setEffectCustomMapOnNode()`**
- **`superClass()`**
- **`setEffectCustomMap()`**
- **`applyShaderSettingsParameters()`**
- **`setEffectShaderParameter()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`xmlFiles`** : `table`
- **`effectsByType`** : `table`
  - **`CULTIVATOR`** : `table[]` (length: 1)
  - **`CUTTER`** : `table[]` (length: 11)
  - **`CUTTER_FORAGE`** : `table[]` (length: 18)
  - **`CUTTER_FRUITS`** : `table[]` (length: 2)
  - **`CUTTER_THRESHING`** : `table[]` (length: 2)
  - **`FERTILIZER`** : `table[]` (length: 1)
  - **`GRAPE_FRUITS_CLEAN`** : `table[]` (length: 1)
  - **`GRAPE_FRUITS_HARVESTED`** : `table[]` (length: 1)
  - **`GRAPE_FRUITS_LEAVES`** : `table[]` (length: 1)
  - **`GRAPE_PREPRUNER`** : `table[]` (length: 1)
  - **`GRAPE_THRESHING`** : `table[]` (length: 1)
  - **`MANURE_SPREADER`** : `table[]` (length: 1)
  - **`MIXERWAGON`** : `table[]` (length: 1)
  - **`MOWER`** : `table[]` (length: 2)
  - **`MULCHER`** : `table[]` (length: 2)
  - **`OLIVE_FRUITS_CLEAN`** : `table[]` (length: 1)
  - **`OLIVE_FRUITS_LEAVES`** : `table[]` (length: 1)
  - **`OLIVE_THRESHING`** : `table[]` (length: 1)
  - **`PICKUPIN`** : `table[]` (length: 2)
  - **`PICKUPOUT`** : `table[]` (length: 2)
  - **`PLOW`** : `table[]` (length: 1)
  - **`SNOW_DUST`** : `table[]` (length: 1)
  - **`SNOW_PIECES`** : `table[]` (length: 1)
  - **`STONE`** : `table[]` (length: 3)
  - **`STRAW_CHOPPER`** : `table[]` (length: 1)
  - **`SUGARCANE_CHAFFER`** : `table[]` (length: 1)
  - **`SUGARCANE_CHOPPER`** : `table[]` (length: 1)
  - **`SUGARCANE_CUTTER`** : `table[]` (length: 1)
  - **`SUGARCANE_PREPARE_FRUIT`** : `table[]` (length: 1)
  - **`TEDDER`** : `table[]` (length: 2)
  - **`WINDROWER`** : `table[]` (length: 2)

</details>

<details>
<summary><strong>Arrays (3)</strong></summary>

- **`sharedLoadRequestIds`** : `number[]` (length: 60)
- **`shaderParamCopyBuffer`** : `table[]` (length: 8)
- **`effects`** : `table[]` (length: 60)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`loadedMapData`** : `boolean`
- **`baseDirectory`** : `string`

</details>


## Usage Example

```lua
-- Access g_motionPathEffectManager fields
```
