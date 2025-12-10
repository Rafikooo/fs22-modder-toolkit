---
title: Engine Functions - Compute
description: Compute functions from FS22 engine
---

# Compute Functions

1 functions starting with `compute`.

### `computeWheelShapeTireForces()`

Calculate wheel shape tire forces

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex
- `longSlipRatio` (`float`) - longSlipRatio
- `latSlipAngle` (`float`) - latSlipAngle
- `tireLoad` (`float`) - tireLoad

**Returns:** `float`

```lua
local result = computeWheelShapeTireForces(transformId, wheelShapeIndex, longSlipRatio, latSlipAngle, tireLoad)
```

