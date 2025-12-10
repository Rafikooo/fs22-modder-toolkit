---
title: g_fruitTypeManager
description: Global g_fruitTypeManager - Runtime introspected API
fieldTypes:
  array: 6
  function: 47
  object: 24
  other: 5
  primitive: 32
---

# g_fruitTypeManager

Runtime-introspected API for `g_fruitTypeManager`.

**Source**: schemas (depth 2)  
**Fields**: 64 top-level fields

## Field Statistics

Total fields: **64**

- **Function**: 47
- **Object**: 6
- **Array**: 6
- **Primitive**: 2
- **Other**: 3

## Fields by Type

<details>
<summary><strong>Functions (47)</strong></summary>

- **`getFruitTypeByFillTypeIndex()`**
- **`getFillTypeByFruitTypeIndex()`**
- **`loadFruitTypeDestruction()`**
- **`loadFruitTypeMapColors()`**
- **`getFruitTypes()`**
- **`loadFruitTypeCropCare()`**
- **`loadFruitTypePreparing()`**
- **`loadFruitTypeCultivation()`**
- **`loadFruitTypeHarvest()`**
- **`loadFruitTypeGrowth()`**
- **`loadFruitTypeWindrow()`**
- **`loadFruitTypeGeneral()`**
- **`addFruitType()`**
- **`loadMapData()`**
- **`addModFoliageType()`**
- **`loadDefaultTypes()`**
- **`getFruitTypeIndexByFillTypeIndex()`**
- **`new()`**
- **`getConverterDataByName()`**
- **`addFruitTypeConversion()`**
- **`addFruitTypeConverter()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`getFillTypeLiterPerSqm()`**
- **`getFruitTypeByIndex()`**
- **`getFillTypesByFruitTypeCategoryName()`**
- **`initDataStructures()`**
- **`superClass()`**
- **`getFruitTypeNameByIndex()`**
- **`addFruitTypeToCategory()`**
- **`addFruitTypeCategory()`**
- **`loadFruitTypeOptions()`**
- **`loadFruitTypes()`**
- **`getWindrowFillTypeIndexByFruitTypeIndex()`**
- **`isFillTypeWindrow()`**
- **`getFruitTypeByName()`**
- **`getFillTypesByFruitTypeNames()`**
- **`getFruitTypesByNames()`**
- **`getFruitTypesByCategoryNames()`**
- **`getCutHeightByFruitTypeIndex()`**
- **`getFillTypeIndexByFruitTypeIndex()`**
- **`getIsFruitCut()`**
- **`getIsFruitWithered()`**
- **`getIsFruitHarvestable()`**
- **`getIsFruitPreparableForHarvest()`**
- **`getIsFruitGrowing()`**

</details>

<details open>
<summary><strong>Objects/Tables (6)</strong></summary>

- **`categories`** : `table`
  - **`DIRECTCUTTER`** : `number`
  - **`GRAINHEADER`** : `number`
  - **`MAIZECUTTER`** : `number`
  - **`MAIZEHEADER`** : `number`
  - **`PICKUP`** : `number`
  - **`PLANTER`** : `number`
  - **`SOWINGMACHINE`** : `number`
  - **`SUGARCANE_PLANTER`** : `number`
  - **`WEEDER`** : `number`
- **`modFoliageTypesToLoad`** : `table`
- **`nameToIndex`** : `table`
  - **`BARLEY`** : `number`
  - **`CANOLA`** : `number`
  - **`COTTON`** : `number`
  - **`GRAPE`** : `number`
  - **`GRASS`** : `number`
  - **`MAIZE`** : `number`
  - **`MEADOW`** : `number`
  - **`OAT`** : `number`
  - **`OILSEEDRADISH`** : `number`
  - **`OLIVE`** : `number`
  - **`POPLAR`** : `number`
  - **`POTATO`** : `number`
  - **`SORGHUM`** : `number`
  - **`SOYBEAN`** : `number`
  - **`SUGARBEET`** : `number`
  - **`SUGARCANE`** : `number`
  - **`SUNFLOWER`** : `number`
  - **`UNKNOWN`** : `number`
  - **`WHEAT`** : `number`
- **`nameToConverter`** : `table`
  - **`FORAGEHARVESTER`** : `map`
  - **`MOWER`** : `map`
- **`converterNameToIndex`** : `table`
  - **`FORAGEHARVESTER`** : `number`
  - **`MOWER`** : `number`
- **`nameToFruitType`** : `table`
  - **`BARLEY`** : `table`
  - **`CANOLA`** : `table`
  - **`COTTON`** : `table`
  - **`GRAPE`** : `table`
  - **`GRASS`** : `table`
  - **`MAIZE`** : `table`
  - **`MEADOW`** : `table`
  - **`OAT`** : `table`
  - **`OILSEEDRADISH`** : `table`
  - **`OLIVE`** : `table`
  - **`POPLAR`** : `table`
  - **`POTATO`** : `table`
  - **`SORGHUM`** : `table`
  - **`SOYBEAN`** : `table`
  - **`SUGARBEET`** : `table`
  - **`SUGARCANE`** : `table`
  - **`SUNFLOWER`** : `table`
  - **`WHEAT`** : `table`

</details>

<details>
<summary><strong>Arrays (6)</strong></summary>

- **`fruitTypes`** : `table[]` (length: 18)
- **`categoryToFruitTypes`** : `table[]` (length: 9)
- **`indexToCategory`** : `string[]` (length: 9)
- **`fruitTypeConverters`** : `table[]` (length: 2)
- **`fruitTypeIndexToFillType`** : `table[]` (length: 18)
- **`indexToFruitType`** : `table[]` (length: 18)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`loadedMapData`** : `boolean`
- **`numCategories`** : `number`

</details>

<details>
<summary><strong>Other (3)</strong></summary>

- **`fruitTypeIndexToWindrowFillTypeIndex`** : `map`
- **`windrowFillTypes`** : `map`
- **`fillTypeIndexToFruitTypeIndex`** : `map`

</details>


## Usage Example

```lua
-- Access g_fruitTypeManager fields
```
