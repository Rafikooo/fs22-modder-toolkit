---
title: Engine Functions - Create
description: Create functions from FS22 engine
---

# Create Functions

15 functions starting with `create`.

### `createAudioSource()`

Create audio source object for 3D sounds

**Parameters:**

- `audioSourceName` (`string`) - audioSourceName
- `sampleFilename` (`string`) - sampleFilename
- `radius` (`float`) - radius
- `innerRadius` (`float`) - innerRadius
- `volume` (`float`) - volume
- `loops` (`integer`) - loops

**Returns:** `integer`

```lua
local result = createAudioSource(audioSourceName, sampleFilename, radius, innerRadius, volume, loops)
```

### `createCCT()`

Create character controller

**Parameters:**

- `transformId` (`integer`) - transformId
- `radius` (`float`) - radius
- `height` (`float`) - height
- `stepOffset` (`float`) - stepOffset
- `slopeLimit` (`float`) - slopeLimit
- `skinWidth` (`float`) - skinWidth
- `collisionMask` (`integer`) - collisionMask
- `mass` (`float`) - mass

**Returns:** `integer`

```lua
local result = createCCT(transformId, radius, height, stepOffset, slopeLimit, skinWidth, collisionMask, mass)
```

### `createCamera()`

Create camera

**Parameters:**

- `cameraName` (`string`) - cameraName
- `fovy` (`float`) - fovy
- `nearClip` (`float`) - nearClip
- `farClip` (`float`) - farClip

**Returns:** `integer`

```lua
local result = createCamera(cameraName, fovy, nearClip, farClip)
```

### `createConditionalAnimation()`

Create conditional animation

**Returns:** `integer`

```lua
local result = createConditionalAnimation()
```

### `createFillPlaneShape()`

Creates a fill plane shape based on shapeId

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `shapeName` (`string`) - shapeName
- `volume` (`float`) - volume
- `deltaMax` (`float`) - deltaMax
- `maxSurfaceAngle` (`float`) - maxSurfaceAngle
- `maxPhysicalSurfaceAngle` (`float`) - maxPhysicalSurfaceAngle
- `maxSurfaceDistanceError` (`float`) - maxSurfaceDistanceError
- `maxSubDivEdgeLength` (`float`) - maxSubDivEdgeLength
- `syncMaxSubDivEdgeLength` (`float`) - syncMaxSubDivEdgeLength
- `createSidePlanes` (`boolean`) - createSidePlanes
- `retessellateTop` (`boolean`) - retessellateTop
- `foliageBendingSystemId` (`integer`)
- `minX` (`float`)
- `maxX` (`float`)
- `minZ` (`float`)
- `maxZ` (`float`)
- `yOffset` (`float`)
- `centerTransformid` (`integer`)

**Returns:** `integer`

```lua
local result = createFillPlaneShape(shapeId, shapeName, volume, deltaMax, maxSurfaceAngle, maxPhysicalSurfaceAngle, maxSurfaceDistanceError, maxSubDivEdgeLength, syncMaxSubDivEdgeLength, createSidePlanes, retessellateTop, foliageBendingSystemId, minX, maxX, minZ, maxZ, yOffset, centerTransformid)
```

### `createImageOverlay()`

Create overlay object

**Parameters:**

- `textureFilename` (`string`) - textureFilename
- `_` (`integer`)
- `_` (`string`)
- `_` (`string`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)

**Returns:** `integer`

```lua
local result = createImageOverlay(textureFilename, _, _, _, _, _, _, _)
```

### `createLoopSynthesisSample()`

Create a loop synthesis sample object

**Parameters:**

- `objectName` (`string`) - objectName

**Returns:** `integer`

```lua
local result = createLoopSynthesisSample(objectName)
```

### `createNavMesh()`

Create a navigation mesh node.

**Parameters:**

- `name` (`string`) - name

**Returns:** `integer`

```lua
local result = createNavMesh(name)
```

### `createNoteNode()`

Create note node

**Parameters:**

- `parentId` (`integer`) - Parent ID
- `text` (`string`) - Text
- `colorR` (`float`) - R component of note color
- `colorG` (`float`) - G component of note color
- `colorB` (`float`) - B component of note color
- `fixedSize` (`boolean`) - Fixed size on screen

**Returns:** `integer`

```lua
local result = createNoteNode(parentId, text, colorR, colorG, colorB, fixedSize)
```

### `createSample()`

Create sample object

**Parameters:**

- `objectName` (`string`) - objectName
- `_` (`string`)
- `_` (`string`)
- `_` (`float`)
- `_` (`float`)
- `_` (`boolean`)

**Returns:** `integer`

```lua
local result = createSample(objectName, _, _, _, _, _)
```

### `createStreamedSample()`

Create streamed sample object

**Parameters:**

- `objectName` (`string`) - objectName
- `isBackgroundMusic` (`boolean`) - isBackgroundMusic

**Returns:** `integer`

```lua
local result = createStreamedSample(objectName, isBackgroundMusic)
```

### `createTrack()`

Creates a tire track system

**Parameters:**

- `systemId` (`integer`) - systemId
- `width` (`float`) - width
- `atlasIndex` (`integer`) - atlasIndex

**Returns:** `integer`

```lua
local result = createTrack(systemId, width, atlasIndex)
```

### `createTransformGroup()`

Create transform group

**Parameters:**

- `transformName` (`string`) - transformName

**Returns:** `integer`

```lua
local result = createTransformGroup(transformName)
```

### `createWheelShape()`

Create wheel shape

**Parameters:**

- `transformId` (`integer`) - transformId
- `positionX` (`float`) - positionX
- `positionY` (`float`) - positionY
- `positionZ` (`float`) - positionZ
- `radius` (`float`) - radius
- `suspensionTravel` (`float`) - suspensionTravel
- `spring` (`float`) - spring
- `damperCompressionLowSpeed` (`float`) - damperCompressionLowSpeed
- `damperCompressionHighSpeed` (`float`) - damperCompressionHighSpeed
- `damperCompressionLowSpeedThreshold` (`float`) - damperCompressionLowSpeedThreshold
- `damperRelaxationLowSpeed` (`float`) - damperRelaxationLowSpeed
- `damperRelaxationHighSpeed` (`float`) - damperRelaxationHighSpeed
- `damperRelaxationLowSpeedThreshold` (`float`) - damperRelaxationLowSpeedThreshold
- `mass` (`float`) - mass
- `collisionMask` (`integer`) - collisionMask
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `integer`

```lua
local result = createWheelShape(transformId, positionX, positionY, positionZ, radius, suspensionTravel, spring, damperCompressionLowSpeed, damperCompressionHighSpeed, damperCompressionLowSpeedThreshold, damperRelaxationLowSpeed, damperRelaxationHighSpeed, damperRelaxationLowSpeedThreshold, mass, collisionMask, wheelShapeIndex)
```

### `createXMLFile()`

Create an empty XML file

**Parameters:**

- `objectName` (`string`) - objectName
- `filename` (`string`) - filename
- `rootNodeName` (`string`) - rootNodeName

**Returns:** `integer`

```lua
local result = createXMLFile(objectName, filename, rootNodeName)
```

