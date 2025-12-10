---
title: Engine Functions - Draw
description: Draw functions from FS22 engine
---

# Draw Functions

3 functions starting with `draw`.

### `drawDebugArrow()`

Render an arrow. Only use for debug rendering

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `dirX` (`float`) - dirX
- `dirY` (`float`) - dirY
- `dirZ` (`float`) - dirZ
- `tangX` (`float`) - tangX
- `tangY` (`float`) - tangY
- `tangZ` (`float`) - tangZ
- `r` (`float`) - r
- `g` (`float`) - g
- `b` (`float`) - b
- `solid` (`boolean`) - solid

```lua
drawDebugArrow(x, y, z, dirX, dirY, dirZ, tangX, tangY, tangZ, r, g, b, solid)
```

### `drawDebugLine()`

Render a line. Only use for debug rendering

**Parameters:**

- `x0` (`float`) - x0
- `y0` (`float`) - y0
- `z0` (`float`) - z0
- `r0` (`float`) - r0
- `g0` (`float`) - g0
- `b0` (`float`) - b0
- `x1` (`float`) - x1
- `y1` (`float`) - y1
- `z1` (`float`) - z1
- `r1` (`float`) - r1
- `g1` (`float`) - g1
- `b1` (`float`) - b1
- `solid` (`boolean`) - solid

```lua
drawDebugLine(x0, y0, z0, r0, g0, b0, x1, y1, z1, r1, g1, b1, solid)
```

### `drawDebugPoint()`

Render a point. Only use for debug rendering

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `r` (`float`) - r
- `g` (`float`) - g
- `b` (`float`) - b
- `a` (`float`) - a
- `solid` (`boolean`) - solid

```lua
drawDebugPoint(x, y, z, r, g, b, a, solid)
```

