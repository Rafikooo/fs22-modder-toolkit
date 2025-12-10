---
title: Engine Functions - Read
description: Read functions from FS22 engine
---

# Read Functions

1 functions starting with `read`.

### `readFillPlaneFromStream()`

Write fill plane surface information to stream

**Parameters:**

- `fillPlaneId` (`integer`) - fillPlaneId
- `streamId` (`integer`) - streamId
- `totalVolume` (`float`) - total volume of the fill plane
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `boolean`

```lua
local result = readFillPlaneFromStream(fillPlaneId, streamId, totalVolume, _, _)
```

