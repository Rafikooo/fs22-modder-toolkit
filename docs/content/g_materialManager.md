---
title: g_materialManager
description: Global g_materialManager - Runtime introspected API
fieldTypes:
  array: 3
  function: 25
  object: 16
  other: 1
  primitive: 30
---

# g_materialManager

Runtime-introspected API for `g_materialManager`.

**Source**: schemas (depth 2)  
**Fields**: 36 top-level fields

## Field Statistics

Total fields: **36**

- **Function**: 25
- **Object**: 6
- **Array**: 3
- **Primitive**: 1
- **Other**: 1

## Fields by Type

<details>
<summary><strong>Functions (25)</strong></summary>

- **`new()`**
- **`getMaterial()`**
- **`addBaseMaterial()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`initDataStructures()`**
- **`getMaterialTypeByName()`**
- **`loadMapData()`**
- **`registerXMLPaths()`**
- **`fontMaterialLoaded()`**
- **`loadFontMaterialsXML()`**
- **`getBaseMaterialByName()`**
- **`addMaterial()`**
- **`addModMaterialHolder()`**
- **`materialHolderLoaded()`**
- **`loadModMaterialHolders()`**
- **`addParticleMaterial()`**
- **`getFontMaterial()`**
- **`getParticleMaterial()`**
- **`getMaterialFromTarget()`**
- **`addMaterialToTarget()`**
- **`superClass()`**
- **`addMaterialType()`**
- **`unloadMapData()`**

</details>

<details open>
<summary><strong>Objects/Tables (6)</strong></summary>

- **`loadedMaterialHolderNodes`** : `table`
- **`baseMaterialsByName`** : `table`
  - **`BELT`** : `number`
  - **`FILLPLANE`** : `number`
  - **`LEVELER`** : `number`
  - **`PIPE`** : `number`
  - **`SLURRY`** : `number`
  - **`SLURRYSIDETOSIDE`** : `number`
  - **`SMOKEPARTICLE`** : `number`
  - **`SOIL`** : `number`
  - **`UNLOADING`** : `number`
  - **`UNLOADINGPARTICLE`** : `number`
  - **`UNLOADINGSMOKE`** : `number`
  - **`WASHER`** : `number`
- **`fontMaterialsByName`** : `table`
  - **`DIGIT`** : `table`
  - **`DIGIT_BOLD`** : `table`
  - **`GENERIC`** : `table`
  - **`GENERIC_BOLD`** : `table`
  - **`LICENSE_PLATE_CZ`** : `table`
  - **`LICENSE_PLATE_DE`** : `table`
  - **`LICENSE_PLATE_FR`** : `table`
  - **`LICENSE_PLATE_PL`** : `table`
  - **`LICENSE_PLATE_UK`** : `table`
  - **`LICENSE_PLATE_US`** : `table`
- **`modMaterialHoldersToLoad`** : `table`
- **`particleMaterials`** : `table`
- **`nameToIndex`** : `table`
  - **`BELT`** : `number`
  - **`BELT_CROPCLEAN`** : `number`
  - **`BELT_CROPDIRT`** : `number`
  - **`CHOPPER`** : `number`
  - **`FILLPLANE`** : `number`
  - **`ICON`** : `number`
  - **`LEVELER`** : `number`
  - **`MOWER`** : `number`
  - **`PICKUP`** : `number`
  - **`PIPE`** : `number`
  - **`SMOKE`** : `number`
  - **`SOIL`** : `number`
  - **`SPRAYER`** : `number`
  - **`SPREADER`** : `number`
  - **`STRAW`** : `number`
  - **`UNLOADING`** : `number`
  - **`WASHER`** : `number`

</details>

<details>
<summary><strong>Arrays (3)</strong></summary>

- **`baseMaterials`** : `number[]` (length: 12)
- **`materialTypes`** : `string[]` (length: 17)
- **`fontMaterials`** : `table[]` (length: 10)

</details>

<details>
<summary><strong>Primitives (1)</strong></summary>

- **`loadedMapData`** : `boolean`

</details>

<details>
<summary><strong>Other (1)</strong></summary>

- **`materials`** : `map`

</details>


## Usage Example

```lua
-- Access g_materialManager fields
```
