---
title: Engine Functions - Build
description: Build functions from FS22 engine
---

# Build Functions

1 functions starting with `build`.

### `buildNavMesh()`

Build the navigation mesh based on the specified world data

**Parameters:**

- `navMeshId` (`integer`) - navMeshId
- `worldNode` (`integer`) - worldNode
- `cellSize` (`float`) - cellSize
- `cellHeight` (`float`) - cellHeight
- `agentHeight` (`float`) - agentHeight
- `agentRadius` (`float`) - agentRadius
- `agentMaxClimb` (`float`) - agentMaxClimb
- `agentMaxSlope` (`float`) - agentMaxSlope
- `minRegionSize` (`float`) - minRegionSize
- `mergeRegionSize` (`float`) - mergeRegionSize
- `maxEdgeLength` (`float`) - maxEdgeLength
- `maxSimplificationError` (`float`) - maxSimplificationError
- `navMeshBuildMask` (`integer`) - navMeshBuildMask
- `terrainDetail` (`float`) - terrainDetail
- `terrainCullInfoLayer` (`string`) - terrainCullInfoLayer
- `terrainCullInfoLayerChannels` (`integer`) - terrainCullInfoLayerChannels
- `_` (`integer`)
- `_` (`integer`)
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `float`

```lua
local result = buildNavMesh(navMeshId, worldNode, cellSize, cellHeight, agentHeight, agentRadius, agentMaxClimb, agentMaxSlope, minRegionSize, mergeRegionSize, maxEdgeLength, maxSimplificationError, navMeshBuildMask, terrainDetail, terrainCullInfoLayer, terrainCullInfoLayerChannels, _, _, _, _)
```

