---
title: Engine Functions - Reset
description: Reset functions from FS22 engine
---

# Reset Functions

3 functions starting with `reset`.

### `resetEmitStartTimer()`

Resets the start timer of emitted particles.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `time` (`float`) - scale time scale

```lua
resetEmitStartTimer(particleSystemId, time)
```

### `resetEmitStopTimer()`

Resets the stop timer of emitted particles.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `time` (`float`) - scale time scale

```lua
resetEmitStopTimer(particleSystemId, time)
```

### `resetNumOfEmittedParticles()`

Resets the counter of emitted particles. This is used if the maxEmit attribute is set for the particle system.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId

```lua
resetNumOfEmittedParticles(particleSystemId)
```

