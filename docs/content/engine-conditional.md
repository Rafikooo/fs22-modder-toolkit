---
title: Engine Functions - Conditional
description: Conditional functions from FS22 engine
---

# Conditional Functions

3 functions starting with `conditional`.

### `conditionalAnimationDebugDraw()`

Debug draw

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

```lua
conditionalAnimationDebugDraw(conditionalAnimationId, x, y, z)
```

### `conditionalAnimationRegisterParameter()`

Register parameter

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `parameterId` (`integer`)
- `parameterType` (`integer`)
- `parameterLabel` (`string`)

```lua
conditionalAnimationRegisterParameter(conditionalAnimationId, parameterId, parameterType, parameterLabel)
```

### `conditionalAnimationZeroiseTrackTimes()`

Zeroise track times

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)

```lua
conditionalAnimationZeroiseTrackTimes(conditionalAnimationId, _, _, _, _, _, _, _, _, _, _, _)
```

