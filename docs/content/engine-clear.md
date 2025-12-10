---
title: Engine Functions - Clear
description: Clear functions from FS22 engine
---

# Clear Functions

3 functions starting with `clear`.

### `clearAnimTrackClip()`

Clear animation track clip assignment

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId

```lua
clearAnimTrackClip(characterSetId, trackId)
```

### `clearEntireSharedI3DFileCache()`

Clears the shared i3d cache, deleting all data and calling finish callbacks on all pending loads with failedReason = Cancelled.

```lua
clearEntireSharedI3DFileCache()
```

### `clearOverlayArea()`

Clears all overlays in the given area

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `width` (`float`) - width
- `height` (`float`) - height
- `rotation` (`float`) - rotation
- `rotCenterX` (`float`) - center of rotation x
- `rotCenterY` (`float`) - center of rotation y

```lua
clearOverlayArea(x, y, width, height, rotation, rotCenterX, rotCenterY)
```

