---
title: Engine Functions - Overlap
description: Overlap functions from FS22 engine
---

# Overlap Functions

3 functions starting with `overlap`.

### `overlapBox()`

Overlap box objects

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `rx` (`float`) - rx
- `ry` (`float`) - ry
- `rz` (`float`) - rz
- `ex` (`float`) - ex
- `ey` (`float`) - ey
- `ez` (`float`) - ez
- `overlapFunctionCallback` (`string`) - function )
- `targetObject` (`object`) - targetObject
- `collisionMask` (`integer`) - collisionMask
- `includeDynamics` (`boolean`) - includeDynamics
- `includeStatics` (`boolean`) - includeStatics
- `exactTest` (`boolean`) - exactTest
- `async` (`boolean`) - if true, callback will be called in the next frame and calculations will be done in a background thread

**Returns:** `integer`

```lua
local result = overlapBox(x, y, z, rx, ry, rz, ex, ey, ez, overlapFunctionCallback, targetObject, collisionMask, includeDynamics, includeStatics, exactTest, async)
```

### `overlapConvex()`

Overlap with an arbitrary convex mesh

**Parameters:**

- `shapeId` (`integer`)
- `overlapFunctionCallback` (`string`) - function )
- `targetObject` (`object`) - targetObject
- `collisionMask` (`integer`) - collisionMask
- `includeDynamics` (`boolean`) - includeDynamics
- `includeStatics` (`boolean`) - includeStatics
- `exactTest` (`boolean`) - exactTest
- `async` (`boolean`) - if true, callback will be called in the next frame and calculations will be done in a background thread

**Returns:** `integer`

```lua
local result = overlapConvex(shapeId, overlapFunctionCallback, targetObject, collisionMask, includeDynamics, includeStatics, exactTest, async)
```

### `overlapSphere()`

Overlap sphere objects

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `radius` (`float`) - radius
- `overlapFunctionCallback` (`string`) - function )
- `targetObject` (`object`) - targetObject
- `collisionMask` (`integer`) - collisionMask
- `includeDynamics` (`boolean`) - includeDynamics
- `includeStatics` (`boolean`) - includeStatics
- `exactTest` (`boolean`) - exactTest
- `async` (`boolean`) - if true, callback will be called in the next frame and calculations will be done in a background thread

**Returns:** `integer`

```lua
local result = overlapSphere(x, y, z, radius, overlapFunctionCallback, targetObject, collisionMask, includeDynamics, includeStatics, exactTest, async)
```

