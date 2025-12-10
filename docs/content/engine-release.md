---
title: Engine Functions - Release
description: Release functions from FS22 engine
---

# Release Functions

1 functions starting with `release`.

### `releaseSharedI3DFile()`

Reduces the ref count of the given shared i3d. Must be called for every successfull loadSharedI3DFile and streamSharedI3DFile call to avoid memory leaks.

**Parameters:**

- `requestId` (`integer`) - stream I3D request ID
- `warnIfInvalid` (`boolean`) - print a warning if the request ID is invalid

```lua
releaseSharedI3DFile(requestId, warnIfInvalid)
```

