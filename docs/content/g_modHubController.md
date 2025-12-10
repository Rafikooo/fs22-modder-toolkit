---
title: g_modHubController
description: Global g_modHubController - Runtime introspected API
fieldTypes:
  function: 90
  global-ref: 2
  object: 8
  primitive: 36
---

# g_modHubController

Runtime-introspected API for `g_modHubController`.

**Source**: schemas (depth 2)  
**Fields**: 53 top-level fields

## Field Statistics

Total fields: **53**

- **Function**: 43
- **Object**: 6
- **Global-ref**: 2
- **Primitive**: 2

## Fields by Type

<details>
<summary><strong>Functions (43)</strong></summary>

- **`getCategory()`**
- **`loadCategoriesFromXML()`**
- **`getModsByCategory()`**
- **`getModInfo()`**
- **`getPostFix()`**
- **`getDependendMods()`**
- **`updateRecommendationSystem()`**
- **`update()`**
- **`load()`**
- **`generateSearchScore()`**
- **`getCategories()`**
- **`searchMods()`**
- **`setShowAllMods()`**
- **`reset()`**
- **`reload()`**
- **`new()`**
- **`setDiscSpaceChangedCallback()`**
- **`setUninstalledCallback()`**
- **`setUninstallFailedCallback()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`setModInstallFailedCallback()`**
- **`install()`**
- **`isContestEnabled()`**
- **`getTotalModSpaceKb()`**
- **`getUsedModSpaceKb()`**
- **`getFreeModSpaceKb()`**
- **`getTotalFilesizeKb()`**
- **`getVisibleCategories()`**
- **`endModification()`**
- **`startModification()`**
- **`userProfileChanged()`**
- **`searchInCategory()`**
- **`isCategorySearchable()`**
- **`getVote()`**
- **`setVotedCallback()`**
- **`vote()`**
- **`uninstall()`**
- **`superClass()`**
- **`setAddedToDownloadCallback()`**
- **`setDependendModIstallFailedCallback()`**
- **`getCategoryData()`**

</details>

<details open>
<summary><strong>Objects/Tables (6)</strong></summary>

- **`priceMapping`** : `table`
  - **`br`** : `string`
  - **`cs`** : `string`
  - **`ct`** : `string`
  - **`cz`** : `string`
  - **`da`** : `string`
  - **`de`** : `string`
  - **`ea`** : `string`
  - **`en`** : `string`
  - **`es`** : `string`
  - **`fc`** : `string`
  - **`fi`** : `string`
  - **`fr`** : `string`
  - **`hu`** : `string`
  - **`it`** : `string`
  - **`jp`** : `string`
  - **`kr`** : `string`
  - **`nl`** : `string`
  - **`no`** : `string`
  - **`pl`** : `string`
  - **`pt`** : `string`
  - **`ro`** : `string`
  - **`ru`** : `string`
  - **`sv`** : `string`
  - **`tr`** : `string`
- **`categoryNameMapping`** : `table`
- **`modIdToInfo`** : `table`
- **`categories`** : `table`
- **`l10n`** : `table`
  - **Methods**: 47 available
    - `setMoneyUnit()`
    - `getCurrencySymbol()`
    - `loadEntriesFromXML()`
    - `saveUsedKeysToXML()`
    - `formatNumMonth()`
    - `formatDayInPeriod()`
    - `superClass()`
    - `load()`
    - `formatMinutes()`
    - `consoleCommandVerifyAll()`
    - `getDistance()`
    - `convertText()`
    - `hasText()`
    - `formatPeriod()`
    - `getTemperature()`
    - `addModI18N()`
    - `new()`
    - `getText()`
    - `getCurrency()`
    - `formatNumDay()`
    - `isa()`
    - `copy()`
    - `class()`
    - `getCurrentDate()`
    - `formatMoney()`
    - `getPower()`
    - `formatMass()`
    - `formatVolume()`
    - `formatFluid()`
    - `getTemperatureUnit()`
    - `formatArea()`
    - `formatTemperature()`
    - `getSpeed()`
    - `getSpeedMeasuringUnit()`
    - `getMeasuringUnit()`
    - `getAreaUnit()`
    - `getArea()`
    - `setText()`
    - `getFluid()`
    - `formatNumber()`
    - `getCurrencyFactor()`
    - `getVolumeUnit()`
    - `getVolume()`
    - `loadUsedKeysFromXML()`
    - `setUseFahrenheit()`
    - `setUseAcre()`
    - `setUseMiles()`
  - **`useAcre`** : `boolean`
  - **`useFahrenheit`** : `boolean`
  - **`useMiles`** : `boolean`
  - **`thousandsGroupingChar`** : `string`
  - **`powerFactorKW`** : `number`
  - **`moneyUnit`** : `number`
  - **`powerFactorHP`** : `number`
  - **`fluidFactor`** : `number`
  - **`modEnvironments`** : `table`
  - **`texts`** : `table`
  - **`decimalSeparator`** : `string`
  - **`debugActive`** : `boolean`
- **`localCategories`** : `table`

</details>

<details>
<summary><strong>Global References (2)</strong></summary>

- **`gameSettings`** : `global-ref` → [`g_gameSettings`](./g_gameSettings.md)
- **`messageCenter`** : `global-ref` → [`g_messageCenter`](./g_messageCenter.md)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`hasChanges`** : `boolean`
- **`hasTriggedUUIDInEngine`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_modHubController fields
```
