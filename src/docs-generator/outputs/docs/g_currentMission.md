---
title: g_currentMission
description: Global g_currentMission - Runtime introspected API
---

# g_currentMission

Runtime-introspected API for `g_currentMission`.

**Source**: session_2025_11_10_18 (depth 3)  
**Fields**: 263 top-level fields

## Overview

The `g_currentMission` global contains the following structure:

## Fields

- **superClass**: `function`
- **copy**: `function`
- **class**: `function`
- **setMissionInfo**: `function`
- **onMaterialsLoaded**: `function`
- **loadItems**: `function`
- **onStartMission**: `function`
- **addLoadFinishedListener**: `function`
- **onCreateStartPoint**: `function`
- **unregisterObjectToCallOnMissionStart**: `function`
- **registerObjectToCallOnMissionStart**: `function`
- **loadAdditionalFilesFinished**: `function`
- **loadAdditionalFiles**: `function`
- **loadHotspots**: `function`
- **loadCompetitiveMultiplayer**: `function`
- **loadPlaceables**: `function`
- **loadEconomy**: `function`
- **isa**: `function`
- **doPauseGame**: `function`
- **doUnpauseGame**: `function`
- **canUnpauseGame**: `function`
- **scrollChatMessages**: `function`
- **draw**: `function`
- **onLoadedMapI3DFiles**: `function`
- **getIsTourSupported**: `function`
- **addChatMessage**: `function`
- **removeLoadFinishedListener**: `function`
- **loadEnvironment**: `function`
- **loadVehiclesFinished**: `function`
- **loadVehiclesFinish**: `function`
- **loadMission00Finished**: `function`
- **update**: `function`
- **load**: `function`
- **loadPlaceablesFinished**: `function`
- **new**: `function`
- **loadVehicles**: `function`
- **loadItemsFinished**: `function`
- **delete**: `function`
- **fieldGroundSystem**: `table`
  - **Methods**: 29 available
    - `isa()`
    - `superClass()`
    - `copy()`
    - `class()`
    - `loadChopperIdFromXML()`
    - `getFieldSprayValue()`
    - `getMaxValue()`
    - `getDensityMapData()`
    - `getGroundAngleMaxValue()`
    - `getDensityMaps()`
    - `getChopperTypeValue()`
    - `loadSprayIdFromXML()`
    - `getChopperTypeIndexByName()`
    - `getSize()`
    - `initDataStructures()`
    - `addDensityMapSyncer()`
    - `loadDensityMapFromXML()`
    - `loadMapData()`
    - `getSowingRange()`
    - `getSowableRange()`
    - *...and 9 more methods*
  - **baseDirectory**: `string`
  - **sprayTypesMaxValue**: `number`
  - **sprayTypesNumChannels**: `number`
  - **sprayTypesFirstChannel**: `number`
  - **angleMaxValue**: `number`
  - **angleNumChannels**: `number`
  - **angleFirstChannel**: `number`
  - **groundTypesMaxValue**: `number`
  - **groundTypesNumChannels**: `number`
  - **groundTypesFirstChannel**: `number`
  - **fieldSprayTypeValue**: `number[]` (length: 4)
  - **lastSowingValue**: `number`
  - **firstSowingValue**: `number`
  - **lastSowableValue**: `number`
  - **firstSowableValue**: `number`
  - *...and 6 more fields*
- **beehiveSystem**: `table`
  - **Methods**: 21 available
    - `isa()`
    - `superClass()`
    - `copy()`
    - `class()`
    - `addBeehivePalletSpawner()`
    - `getBeehives()`
    - `removeBeehive()`
    - `addBeehive()`
    - `consoleCommandBeehiveDebug()`
    - `getBeehiveInfluenceFactorAt()`
    - `getFarmBeehivePalletSpawner()`
    - `removeBeehivePalletSpawner()`
    - `showNoSpawnerWarning()`
    - `updateBeehivesState()`
    - `updateState()`
    - `updateBeehivesOutput()`
    - `delete()`
    - `new()`
    - `update()`
    - `onHourChanged()`
    - *...and 1 more methods*
  - **isFxActive**: `boolean`
  - **beehivePalletSpawners**: `table`
  - **beehivesSortedRadius**: `table`
  - **beehives**: `table`
  - **mission**: `table`
    - **accessHandler**: `table`
    - **achievementManager**: `global-ref` → [`g_achievementManager`](../globals/g_achievementManager.md)
    - **activatableObjectsSystem**: `table`
    - **aiJobTypeManager**: `table`
    - **aiMessageManager**: `table`
    - **aiSystem**: `table`
    - **ambientSoundSystem**: `table`
    - **animalFoodSystem**: `table`
    - **animalNameSystem**: `table`
    - **animalSystem**: `table`
    - **areaCompressionParams**: `table`
    - **areaRelativeCompressionParams**: `table`
    - **attachables**: `table`
    - **baseDirectory**: `string`
    - **beehiveSystem**: `table`
    - *...and 210 more fields*
  - **lastTimeNoSpawnerWarningDisplayed**: `number`
  - **currentSpawnerUpdateIndex**: `number`
  - **updateCooldown**: `number`
  - **isProductionActive**: `boolean`
- **controlPlayer**: `boolean`
- **pauseListeners**: `reverse-hash-map`
- **activatableObjectsSystem**: `table`
  - **Methods**: 16 available
    - `isa()`
    - `superClass()`
    - `copy()`
    - `class()`
    - `onActivateObjectInput()`
    - `getActivatable()`
    - `addActivatable()`
    - `removeActivatable()`
    - `setPosition()`
    - `deactivate()`
    - `registerInput()`
    - `updateObjects()`
    - `new()`
    - `activate()`
    - `removeInput()`
    - `update()`
  - **posZ**: `number`
  - **posY**: `number`
  - **posX**: `number`
  - **mission**: `table`
  - **objects**: `reverse-hash-map`
  - **actionEventId**: `string`
  - **inputContext**: `string`
  - **currentActivatableObject**: `table`
    - **activateText**: `string`
    - **placeable**: `Placeable`
  - **isActive**: `boolean`
- **maxNumHirables**: `number`
- **snapAIDirection**: `boolean`
- **preSimulateTime**: `number`
- **surfaceSounds**: `table[]` (length: 34)
- **maps**: `number[]` (length: 1)
- **vehiclesToSpawnLoading**: `boolean`
- **vehiclesToSpawnDirty**: `boolean`

*...and 213 more top-level fields*

## Usage Example

```lua
-- Access g_currentMission fields
```
