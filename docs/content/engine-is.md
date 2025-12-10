---
title: Engine Functions - Is
description: Is functions from FS22 engine
---

# Is Functions

3 functions starting with `is`.

### `isAnimTrackClipAssigned()`

Is clip assigned to animation track

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId

**Returns:** `boolean`

```lua
local result = isAnimTrackClipAssigned(characterSetId, trackId)
```

### `isAnimTrackEnabled()`

Is animation track enabled

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId

**Returns:** `boolean`

```lua
local result = isAnimTrackEnabled(characterSetId, trackId)
```

### `isSamplePlaying()`

Is sample playing

**Parameters:**

- `sampleId` (`integer`)

**Returns:** `object`

```lua
local result = isSamplePlaying(sampleId)
```

