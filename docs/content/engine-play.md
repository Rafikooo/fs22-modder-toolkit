---
title: Engine Functions - Play
description: Play functions from FS22 engine
---

# Play Functions

2 functions starting with `play`.

### `playSample()`

Play sample object

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `loops` (`integer`) - loops
- `volume` (`float`) - volume
- `offset` (`float`) - offset to start playing
- `delay` (`float`) - delay until to start playing
- `playAfterSample` (`integer`) - optionally wait until playAfterSample has finished playing

```lua
playSample(sampleId, loops, volume, offset, delay, playAfterSample)
```

### `playStreamedSample()`

Play streamed sample object

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `_repeat` (`integer`) - repeat

```lua
playStreamedSample(sampleId, _repeat)
```

