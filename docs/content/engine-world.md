---
title: Engine Functions - World
description: World functions from FS22 engine
---

# World Functions

2 functions starting with `world`.

### `worldDirectionToLocal()`

World space to local space transformation, only direction without translation

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
local result = worldDirectionToLocal(transformId, x, y, z, _, _, _, _)
```

### `worldToLocal()`

World space to local space transformation

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

**Returns:** `float`

```lua
local result = worldToLocal(transformId, x, y, z)
```

