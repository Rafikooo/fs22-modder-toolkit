---
title: Engine Functions - Local
description: Local functions from FS22 engine
---

# Local Functions

4 functions starting with `local`.

### `localDirectionToLocal()`

Local space to local space transformation, only direction without translation

**Parameters:**

- `transformId` (`integer`) - transformId
- `targetTransformId` (`integer`) - targetTransformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

**Returns:** `float`

```lua
local result = localDirectionToLocal(transformId, targetTransformId, x, y, z)
```

### `localDirectionToWorld()`

Local space to world space transformation, only direction without translation

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)

**Returns:** `float`

```lua
local result = localDirectionToWorld(transformId, x, y, z, _, _, _, _)
```

### `localToLocal()`

Local space to local space transformation

**Parameters:**

- `transformId` (`integer`) - transformId
- `targetTransformId` (`integer`) - targetTransformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

**Returns:** `float`

```lua
local result = localToLocal(transformId, targetTransformId, x, y, z)
```

### `localToWorld()`

Local space to world space transformation

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)

**Returns:** `float`

```lua
local result = localToWorld(transformId, x, y, z, _, _, _, _, _, _)
```

