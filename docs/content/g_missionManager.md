---
title: g_missionManager
description: Global g_missionManager - Runtime introspected API
fieldTypes:
  array: 4
  function: 62
  object: 12
  other: 3
  primitive: 14
---

# g_missionManager

Runtime-introspected API for `g_missionManager`.

**Source**: schemas (depth 2)  
**Fields**: 87 top-level fields

## Field Statistics

Total fields: **87**

- **Function**: 62
- **Object**: 4
- **Array**: 4
- **Primitive**: 14
- **Other**: 3

## Fields by Type

<details>
<summary><strong>Functions (62)</strong></summary>

- **`convertWorldToAccessPosition()`**
- **`setMissionMapForMission()`**
- **`getMissionAtWorldPosition()`**
- **`getMissionMapValue()`**
- **`consoleLoadMissionNextVehicle()`**
- **`validateMissionOnField()`**
- **`addPendingMissionVehiclesFile()`**
- **`consoleHarvestTests()`**
- **`loadFromXMLFile()`**
- **`consoleHarvestField()`**
- **`deleteMission()`**
- **`update()`**
- **`saveToXMLFile()`**
- **`consoleGenerateFieldMission()`**
- **`onMissionDeleted()`**
- **`loadMissionVehicles()`**
- **`loadTransportMissions()`**
- **`superClass()`**
- **`copy()`**
- **`class()`**
- **`createMissionMap()`**
- **`testHarvestField()`**
- **`delete()`**
- **`cancelMissionOnField()`**
- **`getIsMissionWorkAllowed()`**
- **`removeMissionFromMissionMap()`**
- **`addMissionToMissionMap()`**
- **`getVehicleGroupFromIdentifier()`**
- **`getRandomVehicleGroup()`**
- **`removeTransportMissionTrigger()`**
- **`addTransportMissionTrigger()`**
- **`getMissionsList()`**
- **`getIsAnyMissionActive()`**
- **`dismissMission()`**
- **`cancelMission()`**
- **`initDataStructures()`**
- **`getTransportMissionConfigById()`**
- **`getTransportMissionConfig()`**
- **`getMissionTypeById()`**
- **`unregisterMissionType()`**
- **`registerMissionType()`**
- **`assignGenerationTime()`**
- **`getMissionType()`**
- **`generateMissions()`**
- **`updateMissions()`**
- **`getFreeActiveMissionId()`**
- **`canMissionStillRun()`**
- **`hasFarmReachedMissionLimit()`**
- **`removeMissionFromList()`**
- **`getActiveMissions()`**
- **`loadNextVehicle()`**
- **`consoleLoadAllFieldMissionVehicles()`**
- **`getFieldData()`**
- **`consoleLoadMissionVehicles()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`new()`**
- **`generateNewFieldMission()`**
- **`startMission()`**
- **`isa()`**
- **`destroyMissionMap()`**
- **`getMissionForActiveMissionId()`**

</details>

<details open>
<summary><strong>Objects/Tables (4)</strong></summary>

- **`pendingMissionVehicleFiles`** : `table`
- **`transportMissions`** : `table`
- **`missionVehicles`** : `table`
  - **`cultivate`** : `table`
  - **`fertilize`** : `table`
  - **`harvest`** : `table`
  - **`mow_bale`** : `table`
  - **`plow`** : `table`
  - **`sow`** : `table`
  - **`spray`** : `table`
  - **`weed`** : `table`
- **`transportTriggers`** : `table`

</details>

<details>
<summary><strong>Arrays (4)</strong></summary>

- **`missionTypeIdToType`** : `table[]` (length: 9)
- **`missionTypes`** : `table[]` (length: 9)
- **`possibleTransportMissionsWeighted`** : `table[]` (length: 1)
- **`missions`** : `table[]` (length: 7)

</details>

<details>
<summary><strong>Primitives (14)</strong></summary>

- **`numTransportTriggers`** : `number`
- **`missionMapNumChannels`** : `number`
- **`defaultMissionMapHeight`** : `number`
- **`defaultMissionMapWidth`** : `number`
- **`transportMissionNextStartTime`** : `number`
- **`loadedMapData`** : `boolean`
- **`numTransportMissions`** : `number`
- **`generationTimer`** : `number`
- **`nextGeneratedMissionId`** : `number`
- **`nextMissionTypeId`** : `number`
- **`missionNextGenerationTime`** : `number`
- **`missionMapWidth`** : `number`
- **`missionMap`** : `number`
- **`missionMapHeight`** : `number`

</details>

<details>
<summary><strong>Other (3)</strong></summary>

- **`fieldToMission`** : `map`
- **`fieldDataFilter`** : `userdata`
- **`fieldDataDmod`** : `userdata`

</details>


## Usage Example

```lua
-- Access g_missionManager fields
```
