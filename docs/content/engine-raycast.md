---
title: Engine Functions - Raycast
description: Raycast functions from FS22 engine
---

# Raycast Functions

2 functions starting with `raycast`.

### `raycastAll()`

Raycast objects, see raycast callback function

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `nx` (`float`) - nx
- `ny` (`float`) - ny
- `nz` (`float`) - nz
- `raycastFunctionCallback` (`string`) - raycastFunctionCallback
- `maxDistance` (`float`) - maxDistance
- `targetObject` (`object`) - targetObject
- `collisionMask` (`integer`) - collisionMask
- `generateNormal` (`boolean`) - generateNormal
- `async` (`boolean`) - if true, callback will be called in the next frame and calculations will be done in a background thread. In Async mode, the return value has no meaning and if no hit is found, the callback is called once with 0 ids.

**Returns:** `integer`

```lua
local result = raycastAll(x, y, z, nx, ny, nz, raycastFunctionCallback, maxDistance, targetObject, collisionMask, generateNormal, async)
```

### `raycastClosest()`

Raycast closest object, see raycast callback function

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `nx` (`float`) - nx
- `ny` (`float`) - ny
- `nz` (`float`) - nz
- `raycastFunctionCallback` (`string`) - raycastFunctionCallback boolean continueReporting
- `maxDistance` (`float`) - maxDistance
- `targetObject` (`object`) - targetObject
- `collisionMask` (`integer`) - collisionMask
- `generateNormal` (`boolean`) - generateNormal
- `async` (`boolean`) - if true, callback will be called in the next frame and calculations will be done in a background thread. In Async mode, the return value has no meaning and if no hit is found, the callback is called once with 0 ids.

**Returns:** `integer`

```lua
local result = raycastClosest(x, y, z, nx, ny, nz, raycastFunctionCallback, maxDistance, targetObject, collisionMask, generateNormal, async)
```

