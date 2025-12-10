---
title: g_farmManager
description: Global g_farmManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 36
  object: 1
  primitive: 3
---

# g_farmManager

Runtime-introspected API for `g_farmManager`.

**Source**: schemas (depth 2)  
**Fields**: 42 top-level fields

## Field Statistics

Total fields: **42**

- **Function**: 36
- **Object**: 1
- **Array**: 2
- **Primitive**: 3

## Fields by Type

<details>
<summary><strong>Functions (36)</strong></summary>

- **`playerJoinedGame()`**
- **`consoleCommandSetFarm()`**
- **`initDataStructures()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`loadDefaults()`**
- **`mergeFarmsForSingleplayer()`**
- **`loadFromXMLFile()`**
- **`appendFarm()`**
- **`removeFarm()`**
- **`update()`**
- **`getFarmById()`**
- **`getFarms()`**
- **`new()`**
- **`updateFarmStats()`**
- **`updateFarms()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`mergeFarmlandsForSingleplayer()`**
- **`findNextFarmId()`**
- **`destroyFarm()`**
- **`createFarm()`**
- **`onFarmObjectCreated()`**
- **`superClass()`**
- **`mergeObjectsForSingleplayer()`**
- **`playerQuitGame()`**
- **`delete()`**
- **`onFarmObjectDeleted()`**
- **`getSpawnPoint()`**
- **`transferMoney()`**
- **`saveToXMLFile()`**
- **`getSleepCamera()`**
- **`removeUserFromFarm()`**
- **`getFarmByUserId()`**
- **`getFarmForUniqueUserId()`**

</details>

<details open>
<summary><strong>Objects/Tables (1)</strong></summary>

- **`defaultHandtools`** : `table`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`farms`** : `table[]` (length: 2)
- **`farmIdToFarm`** : `table[]` (length: 2)

</details>

<details>
<summary><strong>Primitives (3)</strong></summary>

- **`loadedMapData`** : `boolean`
- **`debug_hasAskedCreate`** : `boolean`
- **`spFarmWasMerged`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_farmManager fields
```
