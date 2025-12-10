---
title: g_farmlandManager
description: Global g_farmlandManager - Runtime introspected API
fieldTypes:
  array: 1
  function: 35
  other: 3
  primitive: 6
---

# g_farmlandManager

Runtime-introspected API for `g_farmlandManager`.

**Source**: schemas (depth 2)  
**Fields**: 45 top-level fields

## Field Statistics

Total fields: **45**

- **Function**: 35
- **Array**: 1
- **Primitive**: 6
- **Other**: 3

## Fields by Type

<details>
<summary><strong>Functions (35)</strong></summary>

- **`draw()`**
- **`loadFarmlandData()`**
- **`consoleCommandShowFarmlands()`**
- **`consoleCommandSellAllFarmlands()`**
- **`getIsOwnedByFarmAtWorldPosition()`**
- **`getFarmlandAtWorldPosition()`**
- **`consoleCommandSellFarmland()`**
- **`initDataStructures()`**
- **`convertWorldToLocalPosition()`**
- **`loadMapData()`**
- **`consoleCommandBuyFarmland()`**
- **`loadFromXMLFile()`**
- **`farmDestroyed()`**
- **`getFarmlandById()`**
- **`setLandOwnership()`**
- **`new()`**
- **`addStateChangeListener()`**
- **`getFarmlandOwner()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`getIsValidFarmlandId()`**
- **`getLocalMap()`**
- **`removeStateChangeListener()`**
- **`consoleCommandBuyAllFarmlands()`**
- **`delete()`**
- **`getFarmlands()`**
- **`getOwnedFarmlandIdsByFarmId()`**
- **`getPricePerHa()`**
- **`getOwnerIdAtWorldPosition()`**
- **`getCanAccessLandAtWorldPosition()`**
- **`superClass()`**
- **`getFarmlandIdAtWorldPosition()`**
- **`saveToXMLFile()`**
- **`unloadMapData()`**

</details>

<details>
<summary><strong>Arrays (1)</strong></summary>

- **`sortedFarmlandIds`** : `number[]` (length: 43)

</details>

<details>
<summary><strong>Primitives (6)</strong></summary>

- **`pricePerHa`** : `number`
- **`loadedMapData`** : `boolean`
- **`numberOfBits`** : `number`
- **`localMapHeight`** : `number`
- **`localMapWidth`** : `number`
- **`localMap`** : `number`

</details>

<details>
<summary><strong>Other (3)</strong></summary>

- **`farmlandMapping`** : `map`
- **`farmlands`** : `map`
- **`stateChangeListener`** : `reverse-hash-map`

</details>


## Usage Example

```lua
-- Access g_farmlandManager fields
```
