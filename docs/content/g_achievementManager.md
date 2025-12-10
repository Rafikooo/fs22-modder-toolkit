---
title: g_achievementManager
description: Global g_achievementManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 16
  global-ref: 1
  object: 92
  primitive: 28
---

# g_achievementManager

Runtime-introspected API for `g_achievementManager`.

**Source**: schemas (depth 2)  
**Fields**: 49 top-level fields

## Field Statistics

Total fields: **49**

- **Function**: 16
- **Object**: 2
- **Array**: 2
- **Global-ref**: 1
- **Primitive**: 28

## Fields by Type

<details>
<summary><strong>Functions (16)</strong></summary>

- **`updateAchievements()`**
- **`new()`**
- **`update()`**
- **`tryUnlock()`**
- **`resetAchievementsState()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`load()`**
- **`loadAchievementsState()`**
- **`addAchievement()`**
- **`initDataStructures()`**
- **`handleStandardScoreAchievement()`**
- **`updatePlates()`**
- **`loadMapData()`**
- **`superClass()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`achievementListByName`** : `table`
  - **`BreedChicken`** : `table`
  - **`BreedCows`** : `table`
  - **`BreedPigs`** : `table`
  - **`BreedSheep`** : `table`
  - **`CarDriving`** : `table`
  - **`CollectiblesAlpine`** : `table`
  - **`CollectiblesFR`** : `table`
  - **`CollectiblesUS`** : `table`
  - **`CottonBales`** : `table`
  - **`Cultivate`** : `table`
  - **`CultivateFirst`** : `table`
  - **`CutTree`** : `table`
  - **`CutTreeFirst`** : `table`
  - **`DeliveryGrapes`** : `table`
  - **`DeliveryOlives`** : `table`
  - **`DeliverySorghum`** : `table`
  - **`DeliveryStones`** : `table`
  - **`Fertilize`** : `table`
  - **`FertilizeFirst`** : `table`
  - **`Harvested`** : `table`
  - **`HarvestedFirst`** : `table`
  - **`HorseJumps`** : `table`
  - **`HorseJumpsFirst`** : `table`
  - **`HorseRiding`** : `table`
  - **`HorseRidingFirst`** : `table`
  - **`LoadedOldSavegame`** : `table`
  - **`Mission`** : `table`
  - **`MissionFirst`** : `table`
  - **`Money`** : `table`
  - **`NumBeehives`** : `table`
  - **`NumDrivables`** : `table`
  - **`NumPlaceables`** : `table`
  - **`NumProductionPoints`** : `table`
  - **`NumVehiclesLarge`** : `table`
  - **`NumVehiclesSmall`** : `table`
  - **`PetDog`** : `table`
  - **`PlayTime`** : `table`
  - **`Sow`** : `table`
  - **`SowFirst`** : `table`
  - **`TractorDriving`** : `table`
  - **`TruckDriving`** : `table`
  - **`VehicleRepaint`** : `table`
  - **`VehicleRepair`** : `table`
  - **`VehicleRepairFirst`** : `table`
  - **`WrappedBales`** : `table`
- **`achievementListById`** : `table`
  - **`10`** : `table`
  - **`11`** : `table`
  - **`12`** : `table`
  - **`13`** : `table`
  - **`14`** : `table`
  - **`15`** : `table`
  - **`16`** : `table`
  - **`17`** : `table`
  - **`18`** : `table`
  - **`19`** : `table`
  - **`2`** : `table`
  - **`20`** : `table`
  - **`21`** : `table`
  - **`22`** : `table`
  - **`23`** : `table`
  - **`24`** : `table`
  - **`25`** : `table`
  - **`26`** : `table`
  - **`27`** : `table`
  - **`28`** : `table`
  - **`29`** : `table`
  - **`3`** : `table`
  - **`30`** : `table`
  - **`31`** : `table`
  - **`32`** : `table`
  - **`33`** : `table`
  - **`34`** : `table`
  - **`35`** : `table`
  - **`36`** : `table`
  - **`37`** : `table`
  - **`38`** : `table`
  - **`39`** : `table`
  - **`4`** : `table`
  - **`40`** : `table`
  - **`41`** : `table`
  - **`42`** : `table`
  - **`43`** : `table`
  - **`44`** : `table`
  - **`45`** : `table`
  - **`46`** : `table`
  - **`5`** : `table`
  - **`6`** : `table`
  - **`7`** : `table`
  - **`8`** : `table`
  - **`9`** : `table`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`achievementList`** : `table[]` (length: 45)
- **`fillTypeAchievements`** : `table[]` (length: 4)

</details>

<details>
<summary><strong>Global References (1)</strong></summary>

- **`messageCenter`** : `global-ref` → [`g_messageCenter`](./g_messageCenter.md)

</details>

<details>
<summary><strong>Primitives (28)</strong></summary>

- **`startRepaintVehicleCount`** : `number`
- **`startRepairVehicleCount`** : `number`
- **`startBreedSheepCount`** : `number`
- **`startBreedCowsCount`** : `number`
- **`startCutTreeCount`** : `number`
- **`startThreshedHectares`** : `number`
- **`startFertilizedHectares`** : `number`
- **`startSownHectares`** : `number`
- **`startCultivatedHectares`** : `number`
- **`startFieldJobMissionCount`** : `number`
- **`startPlayTime`** : `number`
- **`startSoldCottonBales`** : `number`
- **`startHorseJumpCount`** : `number`
- **`startHorseDistance`** : `number`
- **`startCarDistance`** : `number`
- **`startTruckDistance`** : `number`
- **`startTractorDistance`** : `number`
- **`startPetDogCount`** : `number`
- **`startBreedChickenCount`** : `number`
- **`startBreedPigsCount`** : `number`
- **`startMoney`** : `number`
- **`numberOfAchievements`** : `number`
- **`achievementTimeInterval`** : `number`
- **`achievementTimer`** : `number`
- **`numberOfUnlockedAchievements`** : `number`
- **`startWrappedBales`** : `number`
- **`achievementsValid`** : `boolean`
- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_achievementManager fields
```
