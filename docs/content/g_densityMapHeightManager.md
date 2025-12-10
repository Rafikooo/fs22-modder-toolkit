---
title: g_densityMapHeightManager
description: Global g_densityMapHeightManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 49
  object: 36
  other: 2
  primitive: 56
---

# g_densityMapHeightManager

Runtime-introspected API for `g_densityMapHeightManager`.

**Source**: schemas (depth 2)  
**Fields**: 83 top-level fields

## Field Statistics

Total fields: **83**

- **Function**: 49
- **Object**: 5
- **Array**: 2
- **Primitive**: 25
- **Other**: 2

## Fields by Type

<details>
<summary><strong>Functions (49)</strong></summary>

- **`getDensityMapHeightTypeByFillTypeName()`**
- **`getFillTypeNameByDensityHeightMapIndex()`**
- **`getTerrainDetailHeightUpdater()`**
- **`initialize()`**
- **`initDataStructures()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`loadFromXMLFile()`**
- **`addModDensityMapHeightTypes()`**
- **`loadDefaultTypes()`**
- **`update()`**
- **`updateCollisionMap()`**
- **`saveToXMLFile()`**
- **`loadDensityMapHeightTypes()`**
- **`consoleCommandTipAnywhereClear()`**
- **`consoleCommandTipAnywhereAdd()`**
- **`consoleCommandToggleDebug()`**
- **`prepareSaveCollisionMap()`**
- **`savePreparedPlacementCollisionMap()`**
- **`new()`**
- **`prepareSavePlacementCollisionMap()`**
- **`savePlacementCollisionMap()`**
- **`getDensityMapHeightTypeByFillTypeIndex()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`addDensityMapHeightType()`**
- **`savePreparedCollisionMap()`**
- **`getMinValidLiterValue()`**
- **`setCollisionMapAreaDirty()`**
- **`saveCollisionMap()`**
- **`getDensityMapHeightTypeByIndex()`**
- **`getDensityMapHeightTypeIndexByFillTypeIndex()`**
- **`superClass()`**
- **`getIsValid()`**
- **`checkTypeMappings()`**
- **`getFillTypeIndexByDensityHeightMapIndex()`**
- **`getDensityMapHeightTypes()`**
- **`getConvertingFillTypesAreas()`**
- **`getFixedFillTypesAreas()`**
- **`sortHeightTypes()`**
- **`visualizePlacementCollisionMap()`**
- **`visualizeCollisionMap()`**
- **`removeConvertingFillTypeAreas()`**
- **`setConvertingFillTypeAreas()`**
- **`removeFixedFillTypesArea()`**
- **`setFixedFillTypesArea()`**
- **`getFillTypeToDensityMapHeightTypes()`**
- **`getDensityMapHeightTypeIndexByFillTypeName()`**

</details>

<details open>
<summary><strong>Objects/Tables (5)</strong></summary>

- **`modDensityHeightMapTypeFilenames`** : `table`
- **`tipTypeMappings`** : `table`
  - **`barley`** : `number`
  - **`canola`** : `number`
  - **`chaff`** : `number`
  - **`cotton`** : `number`
  - **`drygrass_windrow`** : `number`
  - **`fertilizer`** : `number`
  - **`forage`** : `number`
  - **`grape`** : `number`
  - **`grass_windrow`** : `number`
  - **`lime`** : `number`
  - **`maize`** : `number`
  - **`manure`** : `number`
  - **`oat`** : `number`
  - **`olive`** : `number`
  - **`pigfood`** : `number`
  - **`potato`** : `number`
  - **`roadsalt`** : `number`
  - **`seeds`** : `number`
  - **`silage`** : `number`
  - **`snow`** : `number`
  - **`sorghum`** : `number`
  - **`soybean`** : `number`
  - **`stone`** : `number`
  - **`straw`** : `number`
  - **`sugarbeet`** : `number`
  - **`sugarbeet_cut`** : `number`
  - **`sugarcane`** : `number`
  - **`sunflower`** : `number`
  - **`tarp`** : `number`
  - **`wheat`** : `number`
  - **`woodchips`** : `number`
- **`fixedFillTypesAreas`** : `table`
- **`fillTypeNameToHeightType`** : `table`
  - **`BARLEY`** : `table`
  - **`CANOLA`** : `table`
  - **`CHAFF`** : `table`
  - **`COTTON`** : `table`
  - **`DRYGRASS_WINDROW`** : `table`
  - **`FERTILIZER`** : `table`
  - **`FORAGE`** : `table`
  - **`GRAPE`** : `table`
  - **`GRASS_WINDROW`** : `table`
  - **`LIME`** : `table`
  - **`MAIZE`** : `table`
  - **`MANURE`** : `table`
  - **`OAT`** : `table`
  - **`OLIVE`** : `table`
  - **`PIGFOOD`** : `table`
  - **`POTATO`** : `table`
  - **`ROADSALT`** : `table`
  - **`SEEDS`** : `table`
  - **`SILAGE`** : `table`
  - **`SNOW`** : `table`
  - **`SORGHUM`** : `table`
  - **`SOYBEAN`** : `table`
  - **`STONE`** : `table`
  - **`STRAW`** : `table`
  - **`SUGARBEET`** : `table`
  - **`SUGARBEET_CUT`** : `table`
  - **`SUGARCANE`** : `table`
  - **`SUNFLOWER`** : `table`
  - **`TARP`** : `table`
  - **`WHEAT`** : `table`
  - **`WOODCHIPS`** : `table`
- **`pendingCollisionRecalculateAreas`** : `table`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`heightTypeIndexToFillTypeIndex`** : `number[]` (length: 31)
- **`heightTypes`** : `table[]` (length: 31)

</details>

<details>
<summary><strong>Primitives (25)</strong></summary>

- **`loadedMapData`** : `boolean`
- **`placementCollisionMask`** : `number`
- **`tipCollisionMask`** : `number`
- **`placementCollisionMapCreated`** : `boolean`
- **`placementCollisionMap`** : `number`
- **`tipCollisionMapCreated`** : `boolean`
- **`tipCollisionMap`** : `number`
- **`terrainDetailHeightUpdater`** : `number`
- **`numHeightTypes`** : `number`
- **`minValidVolumeValue`** : `number`
- **`minValidLiterValue`** : `number`
- **`literPerPixel`** : `number`
- **`volumePerPixel`** : `number`
- **`numCollisionRecalculateAreasPerSide`** : `number`
- **`heightTypeFirstChannel`** : `number`
- **`collisionRecalculateAreaSize`** : `number`
- **`placementToWorldMap`** : `number`
- **`worldToPlacementMap`** : `number`
- **`densityToWorldMap`** : `number`
- **`worldToDensityMap`** : `number`
- **`tipToGroundIsAllowed`** : `boolean`
- **`fillToGroundScale`** : `number`
- **`heightToDensityValue`** : `number`
- **`heightTypeNumChannels`** : `number`
- **`collisionRecalculateAreaWorldSize`** : `number`

</details>

<details>
<summary><strong>Other (2)</strong></summary>

- **`convertingFillTypesAreas`** : `reverse-hash-map`
- **`fillTypeIndexToHeightType`** : `map`

</details>


## Usage Example

```lua
-- Access g_densityMapHeightManager fields
```
