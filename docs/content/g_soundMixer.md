---
title: g_soundMixer
description: Global g_soundMixer - Runtime introspected API
fieldTypes:
  array: 3
  function: 14
  other: 1
  primitive: 2
---

# g_soundMixer

Runtime-introspected API for `g_soundMixer`.

**Source**: schemas (depth 2)  
**Fields**: 20 top-level fields

## Field Statistics

Total fields: **20**

- **Function**: 14
- **Array**: 3
- **Primitive**: 2
- **Other**: 1

## Fields by Type

<details>
<summary><strong>Functions (14)</strong></summary>

- **`onGameStateChanged()`**
- **`new()`**
- **`draw()`**
- **`delete()`**
- **`copy()`**
- **`update()`**
- **`superClass()`**
- **`addVolumeChangedListener()`**
- **`setMasterVolume()`**
- **`setAudioGroupVolumeFactor()`**
- **`class()`**
- **`loadFromXML()`**
- **`consoleCommandToggleDebug()`**
- **`isa()`**

</details>

<details>
<summary><strong>Arrays (3)</strong></summary>

- **`volumeChangedListeners`** : `table[]` (length: 6)
- **`volumeFactors`** : `number[]` (length: 6)
- **`volumes`** : `number[]` (length: 6)

</details>

<details>
<summary><strong>Primitives (2)</strong></summary>

- **`isDirty`** : `boolean`
- **`masterVolume`** : `number`

</details>

<details>
<summary><strong>Other (1)</strong></summary>

- **`gameStates`** : `map`

</details>


## Usage Example

```lua
-- Access g_soundMixer fields
```
