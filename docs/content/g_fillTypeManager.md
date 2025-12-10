---
title: g_fillTypeManager
description: Global g_fillTypeManager - Runtime introspected API
fieldTypes:
  array: 9
  function: 42
  object: 115
  other: 28
  primitive: 143
---

# g_fillTypeManager

Runtime-introspected API for `g_fillTypeManager`.

**Source**: schemas (depth 2)  
**Fields**: 67 top-level fields

## Field Statistics

Total fields: **67**

- **Function**: 42
- **Object**: 7
- **Array**: 9
- **Primitive**: 8
- **Other**: 1

## Fields by Type

<details>
<summary><strong>Functions (42)</strong></summary>

- **`assignDensityMapHeightTextureArrays()`**
- **`constructDensityMapHeightTextureArrays()`**
- **`getFillTypesFromXML()`**
- **`getIsFillTypeInCategory()`**
- **`getFillTypeTitleByIndex()`**
- **`getSmokeColorByFillTypeIndex()`**
- **`getPrioritizedEffectTypeByFillTypeIndex()`**
- **`getFillTypeTextureArraySize()`**
- **`initDataStructures()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`assignFillTypeTextureArrays()`**
- **`getFillTypeByIndex()`**
- **`getTextureArrayIndexByFillTypeIndex()`**
- **`addModWithFillTypes()`**
- **`constructFillTypeDistanceTextureArray()`**
- **`getFillTypeNamesByIndices()`**
- **`new()`**
- **`getFillTypeNameByIndex()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`getSampleByFillType()`**
- **`getFillTypeIndexByName()`**
- **`getConverterDataByName()`**
- **`addFillTypeConversion()`**
- **`addFillTypeConverter()`**
- **`getFillTypeTextureArrays()`**
- **`addFillTypeToCategory()`**
- **`addFillTypeCategory()`**
- **`getFillTypes()`**
- **`getFillTypeByName()`**
- **`registerXMLPaths()`**
- **`loadDefaultTypes()`**
- **`getFillTypesByNames()`**
- **`loadFillTypes()`**
- **`getFillTypesByCategoryNames()`**
- **`constructFillTypeTextureArrays()`**
- **`deleteDensityMapHeightTextureArrays()`**
- **`deleteFillTypeTextureArrays()`**
- **`addFillType()`**
- **`superClass()`**

</details>

<details open>
<summary><strong>Objects/Tables (7)</strong></summary>

- **`modsToLoad`** : `table`
- **`categoryNameToFillTypes`** : `table`
  - **`ANIMAL`** : `map`
  - **`AUGERWAGON`** : `map`
  - **`BULK`** : `map`
  - **`COMBINE`** : `map`
  - **`FARMSILO`** : `map`
  - **`FORAGEHARVESTER`** : `map`
  - **`FORAGEWAGON`** : `map`
  - **`FORK`** : `map`
  - **`HAYLOFT`** : `map`
  - **`HORSE`** : `map`
  - **`LIQUID`** : `map`
  - **`LOADINGVEHICLE`** : `map`
  - **`MANURESPREADER`** : `map`
  - **`MIXERWAGON`** : `map`
  - **`PIECE`** : `map`
  - **`PRODUCT`** : `map`
  - **`PRODUCT_BGA`** : `map`
  - **`SHOVEL`** : `map`
  - **`SILAGETRAILER`** : `map`
  - **`SLURRYTANK`** : `map`
  - **`SPRAYER`** : `map`
  - **`SPREADER`** : `map`
  - **`TRAINWAGON`** : `map`
  - **`VEGETABLES`** : `map`
  - **`WINDROW`** : `map`
- **`nameToCategoryIndex`** : `table`
  - **`ANIMAL`** : `number`
  - **`AUGERWAGON`** : `number`
  - **`BULK`** : `number`
  - **`COMBINE`** : `number`
  - **`FARMSILO`** : `number`
  - **`FORAGEHARVESTER`** : `number`
  - **`FORAGEWAGON`** : `number`
  - **`FORK`** : `number`
  - **`HAYLOFT`** : `number`
  - **`HORSE`** : `number`
  - **`LIQUID`** : `number`
  - **`LOADINGVEHICLE`** : `number`
  - **`MANURESPREADER`** : `number`
  - **`MIXERWAGON`** : `number`
  - **`PIECE`** : `number`
  - **`PRODUCT`** : `number`
  - **`PRODUCT_BGA`** : `number`
  - **`SHOVEL`** : `number`
  - **`SILAGETRAILER`** : `number`
  - **`SLURRYTANK`** : `number`
  - **`SPRAYER`** : `number`
  - **`SPREADER`** : `number`
  - **`TRAINWAGON`** : `number`
  - **`VEGETABLES`** : `number`
  - **`WINDROW`** : `number`
- **`nameToConverter`** : `table`
  - **`SUGARBEET_CUTTER`** : `map`
  - **`TEDDER`** : `map`
- **`converterNameToIndex`** : `table`
  - **`SUGARBEET_CUTTER`** : `number`
  - **`TEDDER`** : `number`
- **`nameToFillType`** : `table`
  - **`AIR`** : `table`
  - **`BARLEY`** : `table`
  - **`BOARDS`** : `table`
  - **`BREAD`** : `table`
  - **`BUTTER`** : `table`
  - **`CAKE`** : `table`
  - **`CANOLA`** : `table`
  - **`CANOLA_OIL`** : `table`
  - **`CEREAL`** : `table`
  - **`CHAFF`** : `table`
  - **`CHEESE`** : `table`
  - **`CHICKEN`** : `table`
  - **`CHICKEN_ROOSTER`** : `table`
  - **`CHOCOLATE`** : `table`
  - **`CLOTHES`** : `table`
  - **`COTTON`** : `table`
  - **`COW_ANGUS`** : `table`
  - **`COW_HOLSTEIN`** : `table`
  - **`COW_LIMOUSIN`** : `table`
  - **`COW_SWISS_BROWN`** : `table`
  - **`DEF`** : `table`
  - **`DIESEL`** : `table`
  - **`DIGESTATE`** : `table`
  - **`DRYGRASS`** : `table`
  - **`DRYGRASS_WINDROW`** : `table`
  - **`EGG`** : `table`
  - **`ELECTRICCHARGE`** : `table`
  - **`FABRIC`** : `table`
  - **`FERTILIZER`** : `table`
  - **`FLOUR`** : `table`
  - **`FORAGE`** : `table`
  - **`FORAGE_MIXING`** : `table`
  - **`FURNITURE`** : `table`
  - **`GRAPE`** : `table`
  - **`GRAPEJUICE`** : `table`
  - **`GRASS`** : `table`
  - **`GRASS_WINDROW`** : `table`
  - **`HERBICIDE`** : `table`
  - **`HONEY`** : `table`
  - **`HORSE_BAY`** : `table`
  - **`HORSE_BLACK`** : `table`
  - **`HORSE_CHESTNUT`** : `table`
  - **`HORSE_DUN`** : `table`
  - **`HORSE_GRAY`** : `table`
  - **`HORSE_PALOMINO`** : `table`
  - **`HORSE_PINTO`** : `table`
  - **`HORSE_SEAL_BROWN`** : `table`
  - **`LETTUCE`** : `table`
  - **`LIME`** : `table`
  - **`LIQUIDFERTILIZER`** : `table`
  - **`LIQUIDMANURE`** : `table`
  - **`MAIZE`** : `table`
  - **`MANURE`** : `table`
  - **`MEADOW`** : `table`
  - **`METHANE`** : `table`
  - **`MILK`** : `table`
  - **`MINERAL_FEED`** : `table`
  - **`OAT`** : `table`
  - **`OILSEEDRADISH`** : `table`
  - **`OLIVE`** : `table`
  - **`OLIVE_OIL`** : `table`
  - **`PIGFOOD`** : `table`
  - **`PIG_BERKSHIRE`** : `table`
  - **`PIG_BLACK_PIED`** : `table`
  - **`PIG_LANDRACE`** : `table`
  - **`POPLAR`** : `table`
  - **`POTATO`** : `table`
  - **`RAISINS`** : `table`
  - **`ROADSALT`** : `table`
  - **`ROUNDBALE`** : `table`
  - **`ROUNDBALE_COTTON`** : `table`
  - **`ROUNDBALE_DRYGRASS`** : `table`
  - **`ROUNDBALE_GRASS`** : `table`
  - **`ROUNDBALE_WOOD`** : `table`
  - **`SEEDS`** : `table`
  - **`SHEEP_BLACK_WELSH`** : `table`
  - **`SHEEP_LANDRACE`** : `table`
  - **`SHEEP_STEINSCHAF`** : `table`
  - **`SHEEP_SWISS_MOUNTAIN`** : `table`
  - **`SILAGE`** : `table`
  - **`SILAGE_ADDITIVE`** : `table`
  - **`SNOW`** : `table`
  - **`SORGHUM`** : `table`
  - **`SOYBEAN`** : `table`
  - **`SQUAREBALE`** : `table`
  - **`SQUAREBALE_COTTON`** : `table`
  - **`SQUAREBALE_DRYGRASS`** : `table`
  - **`SQUAREBALE_GRASS`** : `table`
  - **`SQUAREBALE_WOOD`** : `table`
  - **`STONE`** : `table`
  - **`STRAW`** : `table`
  - **`STRAWBERRY`** : `table`
  - **`SUGAR`** : `table`
  - **`SUGARBEET`** : `table`
  - **`SUGARBEET_CUT`** : `table`
  - **`SUGARCANE`** : `table`
  - **`SUNFLOWER`** : `table`
  - **`SUNFLOWER_OIL`** : `table`
  - **`TARP`** : `table`
  - **`TOMATO`** : `table`
  - **`TREESAPLINGS`** : `table`
  - **`UNKNOWN`** : `table`
  - **`WATER`** : `table`
  - **`WEED`** : `table`
  - **`WHEAT`** : `table`
  - **`WOOD`** : `table`
  - **`WOODCHIPS`** : `table`
  - **`WOOL`** : `table`
- **`nameToIndex`** : `table`
  - **`AIR`** : `number`
  - **`BARLEY`** : `number`
  - **`BOARDS`** : `number`
  - **`BREAD`** : `number`
  - **`BUTTER`** : `number`
  - **`CAKE`** : `number`
  - **`CANOLA`** : `number`
  - **`CANOLA_OIL`** : `number`
  - **`CEREAL`** : `number`
  - **`CHAFF`** : `number`
  - **`CHEESE`** : `number`
  - **`CHICKEN`** : `number`
  - **`CHICKEN_ROOSTER`** : `number`
  - **`CHOCOLATE`** : `number`
  - **`CLOTHES`** : `number`
  - **`COTTON`** : `number`
  - **`COW_ANGUS`** : `number`
  - **`COW_HOLSTEIN`** : `number`
  - **`COW_LIMOUSIN`** : `number`
  - **`COW_SWISS_BROWN`** : `number`
  - **`DEF`** : `number`
  - **`DIESEL`** : `number`
  - **`DIGESTATE`** : `number`
  - **`DRYGRASS`** : `number`
  - **`DRYGRASS_WINDROW`** : `number`
  - **`EGG`** : `number`
  - **`ELECTRICCHARGE`** : `number`
  - **`FABRIC`** : `number`
  - **`FERTILIZER`** : `number`
  - **`FLOUR`** : `number`
  - **`FORAGE`** : `number`
  - **`FORAGE_MIXING`** : `number`
  - **`FURNITURE`** : `number`
  - **`GRAPE`** : `number`
  - **`GRAPEJUICE`** : `number`
  - **`GRASS`** : `number`
  - **`GRASS_WINDROW`** : `number`
  - **`HERBICIDE`** : `number`
  - **`HONEY`** : `number`
  - **`HORSE_BAY`** : `number`
  - **`HORSE_BLACK`** : `number`
  - **`HORSE_CHESTNUT`** : `number`
  - **`HORSE_DUN`** : `number`
  - **`HORSE_GRAY`** : `number`
  - **`HORSE_PALOMINO`** : `number`
  - **`HORSE_PINTO`** : `number`
  - **`HORSE_SEAL_BROWN`** : `number`
  - **`LETTUCE`** : `number`
  - **`LIME`** : `number`
  - **`LIQUIDFERTILIZER`** : `number`
  - **`LIQUIDMANURE`** : `number`
  - **`MAIZE`** : `number`
  - **`MANURE`** : `number`
  - **`MEADOW`** : `number`
  - **`METHANE`** : `number`
  - **`MILK`** : `number`
  - **`MINERAL_FEED`** : `number`
  - **`OAT`** : `number`
  - **`OILSEEDRADISH`** : `number`
  - **`OLIVE`** : `number`
  - **`OLIVE_OIL`** : `number`
  - **`PIGFOOD`** : `number`
  - **`PIG_BERKSHIRE`** : `number`
  - **`PIG_BLACK_PIED`** : `number`
  - **`PIG_LANDRACE`** : `number`
  - **`POPLAR`** : `number`
  - **`POTATO`** : `number`
  - **`RAISINS`** : `number`
  - **`ROADSALT`** : `number`
  - **`ROUNDBALE`** : `number`
  - **`ROUNDBALE_COTTON`** : `number`
  - **`ROUNDBALE_DRYGRASS`** : `number`
  - **`ROUNDBALE_GRASS`** : `number`
  - **`ROUNDBALE_WOOD`** : `number`
  - **`SEEDS`** : `number`
  - **`SHEEP_BLACK_WELSH`** : `number`
  - **`SHEEP_LANDRACE`** : `number`
  - **`SHEEP_STEINSCHAF`** : `number`
  - **`SHEEP_SWISS_MOUNTAIN`** : `number`
  - **`SILAGE`** : `number`
  - **`SILAGE_ADDITIVE`** : `number`
  - **`SNOW`** : `number`
  - **`SORGHUM`** : `number`
  - **`SOYBEAN`** : `number`
  - **`SQUAREBALE`** : `number`
  - **`SQUAREBALE_COTTON`** : `number`
  - **`SQUAREBALE_DRYGRASS`** : `number`
  - **`SQUAREBALE_GRASS`** : `number`
  - **`SQUAREBALE_WOOD`** : `number`
  - **`STONE`** : `number`
  - **`STRAW`** : `number`
  - **`STRAWBERRY`** : `number`
  - **`SUGAR`** : `number`
  - **`SUGARBEET`** : `number`
  - **`SUGARBEET_CUT`** : `number`
  - **`SUGARCANE`** : `number`
  - **`SUNFLOWER`** : `number`
  - **`SUNFLOWER_OIL`** : `number`
  - **`TARP`** : `number`
  - **`TOMATO`** : `number`
  - **`TREESAPLINGS`** : `number`
  - **`UNKNOWN`** : `number`
  - **`WATER`** : `number`
  - **`WEED`** : `number`
  - **`WHEAT`** : `number`
  - **`WOOD`** : `number`
  - **`WOODCHIPS`** : `number`
  - **`WOOL`** : `number`

</details>

<details>
<summary><strong>Arrays (9)</strong></summary>

- **`categories`** : `string[]` (length: 25)
- **`fillTypes`** : `table[]` (length: 108)
- **`fillTypeToSample`** : `table[]` (length: 108)
- **`fillTypeSamples`** : `table[]` (length: 18)
- **`categoryIndexToFillTypes`** : `table[]` (length: 25)
- **`fillTypeConverters`** : `table[]` (length: 2)
- **`indexToTitle`** : `string[]` (length: 108)
- **`indexToName`** : `string[]` (length: 108)
- **`indexToFillType`** : `table[]` (length: 108)

</details>

<details>
<summary><strong>Primitives (8)</strong></summary>

- **`densityMapHeightSpecularMap`** : `number`
- **`fillTypeTextureSpecularMap`** : `number`
- **`densityMapHeightNormalMap`** : `number`
- **`densityMapHeightDiffuseMap`** : `number`
- **`fillTypeTextureArraySize`** : `number`
- **`loadedMapData`** : `boolean`
- **`fillTypeTextureNormalMap`** : `number`
- **`fillTypeTextureDiffuseMap`** : `number`

</details>

<details>
<summary><strong>Other (1)</strong></summary>

- **`fillTypeIndexToCategories`** : `map`

</details>


## Usage Example

```lua
-- Access g_fillTypeManager fields
```
