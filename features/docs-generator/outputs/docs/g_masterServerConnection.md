---
title: g_masterServerConnection
description: Global g_masterServerConnection - Runtime introspected API
fieldTypes:
  array: 173
  class: 39
  function: 3095
  "global-ref": 35
  object: 576
  other: 132
  primitive: 1502
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_masterServerConnection

Runtime-introspected API for `g_masterServerConnection`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 24 top-level fields

<TypeFilter fieldTypes={{
  array: 173,
  class: 39,
  function: 3095,
  "global-ref": 35,
  object: 576,
  other: 132,
  primitive: 1502,
}} />

## Overview

The `g_masterServerConnection` global contains the following structure:

## Fields

- <span data-field-type="function">**reconnectToMasterServer**: `function`</span>
- <span data-field-type="function">**disconnectFromMasterServer**: `function`</span>
- <span data-field-type="function">**onMasterServerList**: `function`</span>
- <span data-field-type="function">**onMasterServerListStart**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**setCallbackTarget**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**onServerInfoStart**: `function`</span>
- <span data-field-type="function">**init**: `function`</span>
- <span data-field-type="function">**onServerInfoEnd**: `function`</span>
- <span data-field-type="function">**onMasterServerListEnd**: `function`</span>
- <span data-field-type="function">**onServerInfoDetails**: `function`</span>
- <span data-field-type="function">**onServerInfo**: `function`</span>
- <span data-field-type="function">**onServerInfoDetailsFailed**: `function`</span>
- <span data-field-type="function">**onConnectionFailed**: `function`</span>
- <span data-field-type="function">**onConnectionReady**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**connectToMasterServer**: `function`</span>
- <span data-field-type="function">**connectToMasterServerFront**: `function`</span>
- <span data-field-type="primitive">**lastBackServerIndex**: `number`</span>
- <span data-field-type="object">**masterServerCallbackTarget**: `table`</span>
  - **Methods**: 39 available
    - `onLoadedMapI3DFiles()`
    - `update()`
    - `isa()`
    - `loadVehiclesFinished()`
    - `loadVehiclesFinish()`
    - `loadPlaceablesFinished()`
    - `loadVehicles()`
    - `loadItemsFinished()`
    - `canUnpauseGame()`
    - `superClass()`
    - `copy()`
    - `class()`
    - `loadItems()`
    - `loadEnvironment()`
    - `removeLoadFinishedListener()`
    - `addLoadFinishedListener()`
    - `onCreateStartPoint()`
    - `unregisterObjectToCallOnMissionStart()`
    - `registerObjectToCallOnMissionStart()`
    - `loadAdditionalFilesFinished()`
    - *...and 19 more methods*
  - <span data-field-type="primitive">**isRunning**: `boolean`</span>
  - <span data-field-type="object">**loadingConnection**: `table`</span>
    - <span data-field-type="object">**localConnection**: `table`</span>
    - <span data-field-type="primitive">**highestAckedSeq**: `number`</span>
    - <span data-field-type="primitive">**lastSeqSent**: `number`</span>
    - <span data-field-type="primitive">**isConnected**: `boolean`</span>
    - <span data-field-type="primitive">**streamId**: `number`</span>
    - <span data-field-type="object">**pendingDeleteObjectPacketIds**: `table`</span>
    - <span data-field-type="object">**pendingDeleteObjects**: `table`</span>
    - <span data-field-type="primitive">**hasPacketsToAck**: `boolean`</span>
    - <span data-field-type="primitive">**isReadyForObjects**: `boolean`</span>
    - <span data-field-type="primitive">**lastSeqReceived**: `number`</span>
    - <span data-field-type="primitive">**sendStatsTime**: `number`</span>
    - <span data-field-type="primitive">**ackPingPacketSent**: `boolean`</span>
    - <span data-field-type="object">**objectsInfo**: `table`</span>
    - <span data-field-type="primitive">**isServer**: `boolean`</span>
    - <span data-field-type="primitive">**ackMask**: `number`</span>
    - *...and 2 more fields*
  - <span data-field-type="primitive">**presenceMode**: `number`</span>
  - <span data-field-type="array">**mapHotspots**: `table[]` (length: 1)</span>
  - <span data-field-type="object">**loadFinishedListeners**: `table`</span>
  - <span data-field-type="object">**growthSystem**: `table`</span>
    - <span data-field-type="object">**environment**: `table`</span>
    - <span data-field-type="primitive">**growthEnabled**: `boolean`</span>
    - <span data-field-type="array">**seasonalFruitData**: `table[]` (length: 18)</span>
    - <span data-field-type="object">**mission**: `table`</span>
    - <span data-field-type="primitive">**weedUpdater**: `number`</span>
    - <span data-field-type="other">**nonSeasonalFruitData**: `map`</span>
    - <span data-field-type="object">**missionInfo**: `table`</span>
    - <span data-field-type="object">**growthQueue**: `table`</span>
    - <span data-field-type="primitive">**isServer**: `boolean`</span>
    - <span data-field-type="object">**fieldCropsUpdaters**: `table`</span>
    - <span data-field-type="primitive">**fieldCropsUpdatersCellSize**: `number`</span>
    - <span data-field-type="primitive">**stoneUpdater**: `number`</span>
  - <span data-field-type="object">**shopController**: `table`</span>
    - <span data-field-type="primitive">**buyItemPrice**: `number`</span>
    - <span data-field-type="class">**playerFarm**: `Farm`</span>
    - <span data-field-type="object">**leasedFarmItems**: `table`</span>
    - <span data-field-type="other">**ownedFarmItems**: `reverse-hash-map`</span>
    - <span data-field-type="global-ref">**fillTypeManager**: `global-ref` → [`g_fillTypeManager`](../globals/g_fillTypeManager.md)</span>
    - <span data-field-type="array">**displayPacks**: `table[]` (length: 17)</span>
    - <span data-field-type="array">**displayPlaceableCategories**: `table[]` (length: 18)</span>
    - <span data-field-type="array">**displayObjectCategories**: `table[]` (length: 4)</span>
    - <span data-field-type="array">**displayToolCategories**: `table[]` (length: 52)</span>
    - <span data-field-type="array">**displayVehicleCategories**: `table[]` (length: 24)</span>
    - <span data-field-type="array">**displayBrands**: `table[]` (length: 144)</span>
    - <span data-field-type="primitive">**buyHandToolNow**: `number`</span>
    - <span data-field-type="primitive">**buyObjectNow**: `number`</span>
    - <span data-field-type="primitive">**buyVehicleNow**: `number`</span>
    - <span data-field-type="primitive">**isSelling**: `boolean`</span>
    - *...and 12 more fields*
  - <span data-field-type="object">**guiSoundPlayer**: `table`</span>
    - <span data-field-type="global-ref">**soundManager**: `global-ref` → [`g_soundManager`](../globals/g_soundManager.md)</span>
    - <span data-field-type="object">**soundSamples**: `table`</span>
  - <span data-field-type="other">**shopMenu**: `map`</span>
  - <span data-field-type="other">**inGameMenu**: `map`</span>
  - <span data-field-type="global-ref">**fruitTypeManager**: `global-ref` → [`g_fruitTypeManager`](../globals/g_fruitTypeManager.md)</span>
  - <span data-field-type="global-ref">**fillTypeManager**: `global-ref` → [`g_fillTypeManager`](../globals/g_fillTypeManager.md)</span>
  - <span data-field-type="global-ref">**modManager**: `global-ref` → [`g_modManager`](../globals/g_modManager.md)</span>
  - <span data-field-type="object">**vehicleSaleSystem**: `table`</span>
    - <span data-field-type="array">**items**: `table[]` (length: 4)</span>
    - <span data-field-type="object">**freeIds**: `table`</span>
    - <span data-field-type="object">**mission**: `table`</span>
    - <span data-field-type="primitive">**numMultiplayerItems**: `number`</span>
    - <span data-field-type="primitive">**numGeneratedItems**: `number`</span>
    - <span data-field-type="primitive">**nextFreeId**: `number`</span>
  - <span data-field-type="object">**inputManager**: `table`</span>
    - <span data-field-type="array">**actions**: `table[]` (length: 285)</span>
    - <span data-field-type="object">**missingDevices**: `table`</span>
    - <span data-field-type="object">**newlyConnectedDevices**: `table`</span>
    - <span data-field-type="object">**internalIdToEngineDeviceId**: `table`</span>
    - <span data-field-type="object">**engineDeviceIdCounts**: `table`</span>
    - <span data-field-type="object">**internalToDeviceId**: `table`</span>
    - <span data-field-type="object">**deviceIdToInternal**: `table`</span>
    - <span data-field-type="other">**devicesByCategory**: `map`</span>
    - <span data-field-type="other">**devicesByInternalId**: `map`</span>
    - <span data-field-type="primitive">**isConsoleVersion**: `boolean`</span>
    - <span data-field-type="primitive">**debugRegisteredActions**: `boolean`</span>
    - <span data-field-type="primitive">**debugContextEnabled**: `boolean`</span>
    - <span data-field-type="primitive">**mousePosXLast**: `number`</span>
    - <span data-field-type="primitive">**inputMouseYAxisValue**: `number`</span>
    - <span data-field-type="primitive">**debugEnabled**: `boolean`</span>
    - *...and 44 more fields*
  - *...and 209 more fields*
- <span data-field-type="primitive">**isInit**: `boolean`</span>

## Usage Example

```lua
-- Access g_masterServerConnection fields
```
