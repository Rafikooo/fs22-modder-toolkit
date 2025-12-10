---
title: Engine Functions - Add
description: Add functions from FS22 engine
---

# Add Functions

11 functions starting with `add`.

### `addAudioSourceSampleElement()`

Add an element to an AudioSource

**Parameters:**

- `objectId` (`integer`) - objectId
- `filename` (`string`) - filename
- `probability` (`float`) - probability

```lua
addAudioSourceSampleElement(objectId, filename, probability)
```

### `addDifferential()`

Add differential

**Parameters:**

- `objectId` (`integer`) - objectId
- `diff0Index` (`integer`) - diff0Index
- `diffIndex0IsWheel` (`boolean`) - diffIndex0IsWheel
- `diff1Index` (`integer`) - diff1Index
- `diffIndex1IsWheel` (`boolean`) - diffIndex1IsWheel
- `ratio` (`float`) - ratio
- `bias` (`float`) - bias

```lua
addDifferential(objectId, diff0Index, diffIndex0IsWheel, diff1Index, diffIndex1IsWheel, ratio, bias)
```

### `addFoliageTypFromXML()`

Load a new foliage type from an XML file, creating a new multilayer if a new density map is used

**Parameters:**

- `dmId` (`integer`) - id for density map to use for the foliage layer, or a dataplane that shares this density map
- `name` (`string`) - name of new layer
- `xmlFilename` (`string`) - XML filename containing the layer definition
- `_` (`string`)

**Returns:** `integer`

```lua
local result = addFoliageTypFromXML(dmId, name, xmlFilename, _)
```

### `addForce()`

Add force to object

**Parameters:**

- `transformId` (`integer`) - transformId
- `forceX` (`float`) - forceX
- `forceY` (`float`) - forceY
- `forceZ` (`float`) - forceZ
- `positionX` (`float`) - positionX
- `positionY` (`float`) - positionY
- `positionZ` (`float`) - positionZ
- `isPositionLocal` (`boolean`) - isPositionLocal

```lua
addForce(transformId, forceX, forceY, forceZ, positionX, positionY, positionZ, isPositionLocal)
```

### `addImpulse()`

Add impulse to object

**Parameters:**

- `transformId` (`integer`) - transformId
- `impulseX` (`float`) - impulseX
- `impulseY` (`float`) - impulseY
- `impulseZ` (`float`) - impulseZ
- `positionX` (`float`) - positionX
- `positionY` (`float`) - positionY
- `positionZ` (`float`) - positionZ
- `isPositionLocal` (`boolean`) - isPositionLocal

```lua
addImpulse(transformId, impulseX, impulseY, impulseZ, positionX, positionY, positionZ, isPositionLocal)
```

### `addParticleSystemSimulationTime()`

Add particle system simulation time

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `dt` (`float`) - dt
- `_` (`integer`)
- `_` (`integer`)

```lua
addParticleSystemSimulationTime(particleSystemId, dt, _, _)
```

### `addToPhysics()`

Add to physics

**Parameters:**

- `transformId` (`integer`) - transformId

```lua
addToPhysics(transformId)
```

### `addTorque()`

Adds torque to a collision

**Parameters:**

- `objectId` (`integer`) - objectId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

```lua
addTorque(objectId, x, y, z)
```

### `addTorqueImpulse()`

Adds torque impulse to a collision

**Parameters:**

- `objectId` (`integer`) - objectId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

```lua
addTorqueImpulse(objectId, x, y, z)
```

### `addTrackPoint()`

Adds a tire track position

**Parameters:**

- `systemId` (`integer`) - systemId
- `trackId` (`integer`) - trackId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `r` (`float`) - r
- `g` (`float`) - g
- `b` (`float`) - b
- `a` (`float`) - a
- `uw` (`float`) - uw
- `dTheta` (`float`) - dTheta
- `_` (`unknown`)

```lua
addTrackPoint(systemId, trackId, x, y, z, x, y, z, r, g, b, a, uw, dTheta, _)
```

### `addVehicleLink()`

Add vehicle link

**Parameters:**

- `transformId` (`integer`) - transformId
- `transformId2` (`integer`) - transformId2

```lua
addVehicleLink(transformId, transformId2)
```

