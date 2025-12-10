---
title: g_treePlantManager
description: Global g_treePlantManager - Runtime introspected API
fieldTypes:
  array: 2
  function: 39
  object: 24
  primitive: 6
---

# g_treePlantManager

Runtime-introspected API for `g_treePlantManager`.

**Source**: schemas (depth 2)  
**Fields**: 48 top-level fields

## Field Statistics

Total fields: **48**

- **Function**: 39
- **Object**: 4
- **Array**: 2
- **Primitive**: 3

## Fields by Type

<details>
<summary><strong>Functions (39)</strong></summary>

- **`setSplitShapeLeafScaleAndVariation()`**
- **`onTreeCutCommandSplitCallback()`**
- **`initialize()`**
- **`initDataStructures()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`loadTreeTrunk()`**
- **`loadFromXMLFile()`**
- **`cleanupDeletedTrees()`**
- **`plantTree()`**
- **`saveToXMLFile()`**
- **`getTreeTypeDescFromIndex()`**
- **`onTreeCutCommandOverlapCallback()`**
- **`new()`**
- **`getClientTree()`**
- **`removeClientTree()`**
- **`addClientTree()`**
- **`loadTreeTypes()`**
- **`getTreeTypeNameFromIndex()`**
- **`class()`**
- **`getTreeTypeFilename()`**
- **`deleteTreesData()`**
- **`registerTreeType()`**
- **`addingSplitShape()`**
- **`consoleCommandCutTrees()`**
- **`removingSplitShape()`**
- **`getTreeTypeIndexFromName()`**
- **`loadDefaultTypes()`**
- **`isa()`**
- **`readFromServerStream()`**
- **`superClass()`**
- **`canPlantTree()`**
- **`updateTrees()`**
- **`cutTreeTrunkCallback()`**
- **`addTreeCutJoint()`**
- **`getTreeTypeDescFromName()`**
- **`loadTreeNode()`**
- **`writeToClientStream()`**
- **`copy()`**

</details>

<details open>
<summary><strong>Objects/Tables (4)</strong></summary>

- **`nameToTreeType`** : `table`
  - **`AMERICANELM`** : `table`
  - **`BIRCH`** : `table`
  - **`CYPRESS`** : `table`
  - **`DOWNYSERVICEBERRY`** : `table`
  - **`MAPLE`** : `table`
  - **`OAK`** : `table`
  - **`OLIVETREE`** : `table`
  - **`PAGODADOGWOOD`** : `table`
  - **`PINE`** : `table`
  - **`POPLAR`** : `table`
  - **`SHAGBARKHICKORY`** : `table`
  - **`SPRUCE1`** : `table`
  - **`SPRUCE2`** : `table`
  - **`STONEPINE`** : `table`
  - **`WILLOW1`** : `table`
  - **`WILLOW2`** : `table`
- **`treesData`** : `table`
  - **`clientTrees`** : `table`
  - **`growingTrees`** : `table`
  - **`numTreesWithoutSplits`** : `number`
  - **`rootNode`** : `number`
  - **`splitTrees`** : `table`
  - **`treeCutJoints`** : `table`
  - **`updateDtGame`** : `number`
- **`activeDecayingSplitShapes`** : `table`
- **`treeFileCache`** : `table`

</details>

<details>
<summary><strong>Arrays (2)</strong></summary>

- **`indexToTreeType`** : `table[]` (length: 16)
- **`treeTypes`** : `table[]` (length: 16)

</details>

<details>
<summary><strong>Primitives (3)</strong></summary>

- **`updateDecayDtGame`** : `number`
- **`numTreesWithoutSplits`** : `number`
- **`loadedMapData`** : `boolean`

</details>


## Usage Example

```lua
-- Access g_treePlantManager fields
```
