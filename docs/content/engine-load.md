---
title: Engine Functions - Load
description: Load functions from FS22 engine
---

# Load Functions

6 functions starting with `load`.

### `loadI3DFile()`

Load I3D file

**Parameters:**

- `filename` (`string`) - filename
- `addPhysics` (`boolean`) - addPhysics
- `callOnCreate` (`boolean`) - callOnCreate
- `verbose` (`boolean`) - verbose

**Returns:** `integer`

```lua
local result = loadI3DFile(filename, addPhysics, callOnCreate, verbose)
```

### `loadSample()`

Load sample object

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `sampleFilename` (`string`) - sampleFilename
- `b3DSound` (`boolean`) - b3DSound

**Returns:** `boolean`

```lua
local result = loadSample(sampleId, sampleFilename, b3DSound)
```

### `loadSharedI3DFile()`

Load shared I3D file. If another shared stream request is still pending for the same i3d, the call blocks until this request is finished

**Parameters:**

- `filename` (`string`) - filename
- `addPhysics` (`boolean`) - addPhysics
- `callOnCreate` (`boolean`) - callOnCreate
- `verbose` (`boolean`) - verbose

**Returns:** `integer`

```lua
local result = loadSharedI3DFile(filename, addPhysics, callOnCreate, verbose)
```

### `loadStreamedSample()`

Load streamed sample object

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `bgmusicFilename` (`string`) - bgmusicFilename

**Returns:** `boolean`

```lua
local result = loadStreamedSample(sampleId, bgmusicFilename)
```

### `loadXMLFile()`

Load XML file

**Parameters:**

- `objectName` (`string`) - objectName
- `filename` (`string`) - filename

**Returns:** `integer`

```lua
local result = loadXMLFile(objectName, filename)
```

### `loadXMLFileFromMemory()`

Load XML file from memory

**Parameters:**

- `objectName` (`string`) - objectName
- `content` (`string`) - content

**Returns:** `integer`

```lua
local result = loadXMLFileFromMemory(objectName, content)
```

