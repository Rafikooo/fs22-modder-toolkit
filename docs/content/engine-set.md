---
title: Engine Functions - Set
description: Set functions from FS22 engine
---

# Set Functions

100 functions starting with `set`.

### `setAngularDamping()`

Set angular damping

**Parameters:**

- `transformId` (`integer`) - transformId
- `angularDamping` (`float`) - angularDamping

```lua
setAngularDamping(transformId, angularDamping)
```

### `setAngularVelocity()`

Set angular velocity of transform object

**Parameters:**

- `transformId` (`integer`) - transformId
- `velocityX` (`float`) - velocityX
- `velocityY` (`float`) - velocityY
- `velocityZ` (`float`) - velocityZ

```lua
setAngularVelocity(transformId, velocityX, velocityY, velocityZ)
```

### `setAnimTrackBlendWeight()`

Set animation track blend weight

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId
- `weight` (`float`) - weight

```lua
setAnimTrackBlendWeight(characterSetId, trackId, weight)
```

### `setAnimTrackLoopState()`

Set animation track loop state

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId
- `loopState` (`boolean`) - loopState

```lua
setAnimTrackLoopState(characterSetId, trackId, loopState)
```

### `setAnimTrackSpeedScale()`

Set animation track speed scale

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId
- `speedScale` (`float`) - speedScale

```lua
setAnimTrackSpeedScale(characterSetId, trackId, speedScale)
```

### `setAnimTrackTime()`

Set animation track time

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId
- `time` (`float`) - time
- `immediateUpdate` (`boolean`) - immediateUpdate

```lua
setAnimTrackTime(characterSetId, trackId, time, immediateUpdate)
```

### `setAudioCullingWorldProperties()`

Set audio culling world properties

**Parameters:**

- `gridMinX` (`float`) - gridMinX
- `gridMinY` (`float`) - gridMinY
- `gridMinZ` (`float`) - gridMinZ
- `gridMaxX` (`float`) - gridMaxX
- `gridMaxY` (`float`) - gridMaxY
- `gridMaxZ` (`float`) - gridMaxZ
- `gridSize` (`integer`) - gridSize
- `clipDistanceThreshold1` (`float`) - clipDistanceThreshold1
- `clipDistanceThreshold2` (`float`) - clipDistanceThreshold2
- `_` (`integer`)
- `_` (`boolean`)
- `_` (`integer`)
- `_` (`float`)

```lua
setAudioCullingWorldProperties(gridMinX, gridMinY, gridMinZ, gridMaxX, gridMaxY, gridMaxZ, gridSize, clipDistanceThreshold1, clipDistanceThreshold2, _, _, _, _)
```

### `setAudioSourceMaxRetriggerDelay()`

Set the AudioSource's max retrigger delay

**Parameters:**

- `objectId` (`integer`) - objectId
- `maxRetriggerDelay` (`float`) - maxRetriggerDelay

```lua
setAudioSourceMaxRetriggerDelay(objectId, maxRetriggerDelay)
```

### `setAudioSourceMinRetriggerDelay()`

Get the AudioSource's min retrigger delay

**Parameters:**

- `objectId` (`integer`) - objectId
- `minRetriggerDelay` (`float`) - minRetriggerDelay

```lua
setAudioSourceMinRetriggerDelay(objectId, minRetriggerDelay)
```

### `setAudioSourceRandomPlayback()`

Set the AudioSource's random playback state

**Parameters:**

- `objectId` (`integer`) - objectId
- `randomPlayback` (`boolean`) - randomPlayback
- `_` (`integer`)
- `_` (`float`)

```lua
setAudioSourceRandomPlayback(objectId, randomPlayback, _, _)
```

### `setAudioSourceSampleElementProbability()`

Set the AudioSource's sample element's probability

**Parameters:**

- `objectId` (`integer`) - objectId
- `index` (`integer`) - index
- `probability` (`float`) - probability
- `_` (`integer`)
- `_` (`boolean`)

```lua
setAudioSourceSampleElementProbability(objectId, index, probability, _, _)
```

### `setCamera()`

Set camera

**Parameters:**

- `cameraId` (`integer`) - cameraId

```lua
setCamera(cameraId)
```

### `setCenterOfMass()`

Set center of mass

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

```lua
setCenterOfMass(transformId, x, y, z)
```

### `setClipDistance()`

Set object clip distance

**Parameters:**

- `objectId` (`integer`) - objectId
- `distance` (`float`) - distance

```lua
setClipDistance(objectId, distance)
```

### `setCollisionMask()`

Set collision mask

**Parameters:**

- `transformId` (`integer`) - transformId
- `mask` (`integer`) - mask

```lua
setCollisionMask(transformId, mask)
```

### `setConditionalAnimationBoolValue()`

Set boolean value

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `parameterId` (`integer`) - parameterId
- `value` (`boolean`) - value

**Returns:** `boolean`

```lua
local result = setConditionalAnimationBoolValue(conditionalAnimationId, parameterId, value)
```

### `setConditionalAnimationFloatValue()`

Set float value

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `parameterId` (`integer`) - parameterId
- `value` (`float`) - value

**Returns:** `boolean`

```lua
local result = setConditionalAnimationFloatValue(conditionalAnimationId, parameterId, value)
```

### `setConditionalAnimationSpecificParameterIds()`

Set specific parameter ids

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `velocityParmId` (`integer`) - velocityParmId
- `angularVelocityParmId` (`integer`) - angularVelocityParmId

```lua
setConditionalAnimationSpecificParameterIds(conditionalAnimationId, velocityParmId, angularVelocityParmId)
```

### `setConditionalAnimationTime()`

Set time

**Parameters:**

- `conditionalAnimationId` (`integer`)
- `time` (`float`)
- `densityMapSyncer` (`integer`) - id
- `densityMap` (`integer`) - id
- `callbackFunctionName` (`string`) - callback function
- `target` (`object`) - target

```lua
setConditionalAnimationTime(conditionalAnimationId, time, densityMapSyncer, densityMap, callbackFunctionName, target)
```

### `setDirection()`

Set the direction of an object, the positive z-axis points towards the given direction. The y-axis lies in the direction-up-plane.

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `upX` (`float`) - upX
- `upY` (`float`) - upY
- `upZ` (`float`) - upZ

```lua
setDirection(transformId, x, y, z, upX, upY, upZ)
```

### `setEmitCountScale()`

Set particle system count scale

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `countScale` (`float`) - countScale

```lua
setEmitCountScale(particleSystemId, countScale)
```

### `setEmitStartTime()`

Set emitter starting time.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `emitStartTime` (`float`) - emitStartTime

```lua
setEmitStartTime(particleSystemId, emitStartTime)
```

### `setEmitStopTime()`

Set emitter stop time.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `emitStopTime` (`float`) - emitStopTime

```lua
setEmitStopTime(particleSystemId, emitStopTime)
```

### `setEmitterShape()`

Sets the emitter shape of the particle system

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `shapeId` (`integer`) - shapeId

```lua
setEmitterShape(particleSystemId, shapeId)
```

### `setEmitterShapeVelocityScale()`

Sets the emitter shape velocity scale of the particle system

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `shape` (`float`) - velocity scale

```lua
setEmitterShapeVelocityScale(particleSystemId, shape)
```

### `setEmittingState()`

Set whether the particle system should emit new particles

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `state` (`boolean`) - state
- `densityMapSyncer` (`integer`) - id
- `densityMap` (`integer`) - id
- `cellX` (`integer`) - cell index
- `cellZ` (`integer`) - cell index
- `enable` (`boolean`) - enable flag

```lua
setEmittingState(particleSystemId, state, densityMapSyncer, densityMap, cellX, cellZ, enable)
```

### `setFarClip()`

Set the far clip distance

**Parameters:**

- `cameraId` (`integer`) - cameraId
- `farClip` (`float`) - farClip

```lua
setFarClip(cameraId, farClip)
```

### `setFastShadowUpdate()`

Set fast shadow update for camera

**Parameters:**

- `cameraId` (`integer`) - cameraId
- `fastUpdate` (`boolean`) - set true for fast shadow update or false for far shadows

```lua
setFastShadowUpdate(cameraId, fastUpdate)
```

### `setFillPlaneMaxPhysicalSurfaceAngle()`

Set fill plane physical surface angle

**Parameters:**

- `fillPlaneId` (`integer`) - fillPlaneId
- `physicalSurfAngle` (`float`) - physicalSurfAngle
- `foliageBendingSystemId` (`integer`)
- `rectangleId` (`integer`)
- `minX` (`float`)
- `maxX` (`float`)
- `minZ` (`float`)
- `maxZ` (`float`)
- `yOffset` (`float`)
- `_` (`integer`)
- `_` (`integer`)

```lua
setFillPlaneMaxPhysicalSurfaceAngle(fillPlaneId, physicalSurfAngle, foliageBendingSystemId, rectangleId, minX, maxX, minZ, maxZ, yOffset, _, _)
```

### `setFovY()`

Sets the vertical field of view angle

**Parameters:**

- `cameraId` (`integer`) - id of the camera
- `fovY` (`float`) - field of view angle

```lua
setFovY(cameraId, fovY)
```

### `setFrictionVelocity()`

Sets friction velocity to collision

**Parameters:**

- `objectId` (`integer`) - objectId
- `velocity` (`float`) - velocity
- `_` (`integer`)
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`integer`)
- `_` (`boolean`)
- `_` (`integer`)
- `_` (`boolean`)

```lua
setFrictionVelocity(objectId, velocity, _, _, _, _, _, _, _, _)
```

### `setIsNonRenderable()`

Set if shape is non-renderable

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `isNonRenderable` (`boolean`)
- `_` (`integer`)
- `_` (`boolean`)

```lua
setIsNonRenderable(shapeId, isNonRenderable, _, _)
```

### `setJointAngularDrive()`

Set joint angular drive

**Parameters:**

- `jointIndex` (`integer`)
- `axis` (`integer`)
- `usePosition` (`boolean`)
- `useVelocity` (`boolean`)
- `spring` (`float`)
- `damping` (`float`)
- `forceLimit` (`float`)
- `targetRotation` (`float`)
- `targetAngularVelocity` (`float`)

```lua
setJointAngularDrive(jointIndex, axis, usePosition, useVelocity, spring, damping, forceLimit, targetRotation, targetAngularVelocity)
```

### `setJointDrive()`

Set joint drive. Drives orientation if position drive or angular velocity if velocity drive.

**Parameters:**

- `jointIndex` (`integer`)
- `isLinear` (`boolean`)
- `isPosition` (`boolean`)
- `valueX` (`float`)
- `valueY` (`float`)
- `valueZ` (`float`)
- `angle` (`float`)

```lua
setJointDrive(jointIndex, isLinear, isPosition, valueX, valueY, valueZ, angle)
```

### `setJointLinearDrive()`

Set joint linear drive

**Parameters:**

- `jointIndex` (`integer`)
- `axis` (`integer`)
- `usePosition` (`boolean`)
- `useVelocity` (`boolean`)
- `spring` (`float`)
- `damping` (`float`)
- `forceLimit` (`float`)
- `targetPosition` (`float`)
- `targetVelocity` (`float`)

```lua
setJointLinearDrive(jointIndex, axis, usePosition, useVelocity, spring, damping, forceLimit, targetPosition, targetVelocity)
```

### `setLightRange()`

Set range of a light

**Parameters:**

- `lightId` (`integer`) - lightId
- `range` (`float`) - range
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`integer`)
- `_` (`boolean`)
- `_` (`integer`)

```lua
setLightRange(lightId, range, _, _, _, _, _, _, _, _, _, _, _)
```

### `setLinearDamping()`

Set linear damping

**Parameters:**

- `transformId` (`integer`) - transformId
- `linearDamping` (`float`) - linearDamping

```lua
setLinearDamping(transformId, linearDamping)
```

### `setLinearVelocity()`

Set linear velocity of transform object

**Parameters:**

- `transformId` (`integer`) - transformId
- `velocityX` (`float`) - velocityX
- `velocityY` (`float`) - velocityY
- `velocityZ` (`float`) - velocityZ

```lua
setLinearVelocity(transformId, velocityX, velocityY, velocityZ)
```

### `setLockedGroup()`

Set transform object locked group flag

**Parameters:**

- `transformId` (`integer`) - transformId
- `locked` (`boolean`) - group locked group

```lua
setLockedGroup(transformId, locked)
```

### `setMass()`

Set mass

**Parameters:**

- `transformId` (`integer`) - transformId
- `mass` (`float`) - mass

```lua
setMass(transformId, mass)
```

### `setMaterial()`

Set material by index

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `materialId` (`integer`) - materialId
- `material` (`integer`) - index material index
- `materialId` (`integer`)
- `name` (`string`)
- `filename` (`string`)
- `textueWrap` (`boolean`)
- `isSRGB` (`boolean`)
- `sharedEdit` (`boolean`)
- `materialId` (`integer`)
- `shaderVariationName` (`string`)
- `sharedEdit` (`boolean`)
- `materialId` (`integer`)
- `filename` (`string`)
- `textueWrap` (`boolean`)
- `isSRGB` (`boolean`)
- `sharedEdit` (`boolean`)
- `materialId` (`integer`)
- `filename` (`string`)
- `textueWrap` (`boolean`)
- `isSRGB` (`boolean`)
- `sharedEdit` (`boolean`)
- `materialId` (`integer`)
- `filename` (`string`)
- `textueWrap` (`boolean`)
- `isSRGB` (`boolean`)
- `sharedEdit` (`boolean`)

**Returns:** `integer`

```lua
local result = setMaterial(shapeId, materialId, material, materialId, name, filename, textueWrap, isSRGB, sharedEdit, materialId, shaderVariationName, sharedEdit, materialId, filename, textueWrap, isSRGB, sharedEdit, materialId, filename, textueWrap, isSRGB, sharedEdit, materialId, filename, textueWrap, isSRGB, sharedEdit)
```

### `setMinClipDistance()`

Set minimum clip distance

**Parameters:**

- `objectId` (`integer`) - objectId
- `minDist` (`float`) - minDist
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`unknown`)
- `_` (`unknown`)

```lua
setMinClipDistance(objectId, minDist, _, _, _, _, _, _, _, _, _)
```

### `setName()`

Set object name

**Parameters:**

- `objectId` (`integer`) - objectId
- `objectName` (`string`) - objectName

```lua
setName(objectId, objectName)
```

### `setNearClip()`

Set the near clip distance

**Parameters:**

- `cameraId` (`integer`) - cameraId
- `nearClip` (`float`) - nearClip

```lua
setNearClip(cameraId, nearClip)
```

### `setNoteNodeColor()`

Set note node color

**Parameters:**

- `noteId` (`integer`) - Id of the note node
- `colorR` (`float`) - R component of note color
- `colorG` (`float`) - G component of note color
- `colorB` (`float`) - B component of note color

```lua
setNoteNodeColor(noteId, colorR, colorG, colorB)
```

### `setNoteNodeFixedSize()`

Set note node fixed size

**Parameters:**

- `noteId` (`integer`) - Id of the note node
- `fixedSize` (`boolean`)

```lua
setNoteNodeFixedSize(noteId, fixedSize)
```

### `setNoteNodeText()`

Set note node text

**Parameters:**

- `noteId` (`integer`) - Id of the note node
- `text` (`string`)

```lua
setNoteNodeText(noteId, text)
```

### `setObjectMask()`

Set object mask

**Parameters:**

- `objectId` (`integer`) - objectId
- `mask` (`integer`) - mask
- `_` (`integer`)
- `_` (`float`)

```lua
setObjectMask(objectId, mask, _, _)
```

### `setOverlayColor()`

Set overlay color

**Parameters:**

- `overlayId` (`integer`) - overlayId
- `red` (`float`) - red
- `green` (`float`) - green
- `blue` (`float`) - blue
- `alpha` (`float`) - alpha

```lua
setOverlayColor(overlayId, red, green, blue, alpha)
```

### `setOverlayCornerColor()`

Set overlay color of a single corner

**Parameters:**

- `overlayId` (`integer`) - overlayId
- `cornerIndex` (`integer`) - corner index
- `red` (`float`) - red
- `green` (`float`) - green
- `blue` (`float`) - blue
- `alpha` (`float`) - alpha

```lua
setOverlayCornerColor(overlayId, cornerIndex, red, green, blue, alpha)
```

### `setOverlayLayer()`

Set layer for texture array overlays

**Parameters:**

- `overlayId` (`integer`)
- `layer` (`integer`)

```lua
setOverlayLayer(overlayId, layer)
```

### `setOverlayRotation()`

Set overlay rotation

**Parameters:**

- `overlayId` (`integer`) - overlayId
- `rotation` (`float`) - rotation
- `pivotX` (`float`) - x position of pivot of rotation
- `pivotY` (`float`) - y position of pivot of rotation

```lua
setOverlayRotation(overlayId, rotation, pivotX, pivotY)
```

### `setOverlaySignedDistanceFieldWidth()`

Set overlay signed distance field width

**Parameters:**

- `overlayId` (`integer`) - overlayId
- `sdfWidth` (`float`) - range of the sdf in normalized color

```lua
setOverlaySignedDistanceFieldWidth(overlayId, sdfWidth)
```

### `setOverlayUVs()`

Set overlay uv coordinates

**Parameters:**

- `overlayId` (`integer`) - overlayId
- `v0` (`float`) - v0
- `u0` (`float`) - u0
- `v1` (`float`) - v1
- `u1` (`float`) - u1
- `v2` (`float`) - v2
- `u2` (`float`) - u2
- `v3` (`float`) - v3
- `u3` (`float`) - u3

```lua
setOverlayUVs(overlayId, v0, u0, v1, u1, v2, u2, v3, u3)
```

### `setParticleSystemLifespan()`

Set particle system life span.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `lifeSpan` (`float`) - lifeSpan
- `keepBlendTimes` (`boolean`) - keepBlendTimes

```lua
setParticleSystemLifespan(particleSystemId, lifeSpan, keepBlendTimes)
```

### `setParticleSystemTimeScale()`

Sets the time scale for the particle simulation.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `timeScale` (`float`) - timeScale

```lua
setParticleSystemTimeScale(particleSystemId, timeScale)
```

### `setPolylineTranslation()`

Translate polyline

**Parameters:**

- `fillPlaneId` (`integer`) - fillPlaneId
- `polyLineIdx` (`integer`) - polyLineIdx
- `dx` (`float`) - dx
- `dz` (`float`) - dz
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)

```lua
setPolylineTranslation(fillPlaneId, polyLineIdx, dx, dz, _, _, _)
```

### `setQuaternion()`

Sets quaternion

**Parameters:**

- `objectId` (`integer`) - objectId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `w` (`float`) - w

```lua
setQuaternion(objectId, x, y, z, w)
```

### `setRigidBodyType()`

Set rigid body type

**Parameters:**

- `transformId` (`integer`) - transformId
- `type` (`integer`) - RIGID_BODY_TYPE

```lua
setRigidBodyType(transformId, type)
```

### `setRootNode()`

Set rootnode

**Parameters:**

- `objectId` (`integer`) - objectId

```lua
setRootNode(objectId)
```

### `setRotation()`

Set rotation

**Parameters:**

- `objectId` (`integer`) - objectId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

```lua
setRotation(objectId, x, y, z)
```

### `setSamplePitch()`

Set sample pitch

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `pitch` (`float`) - pitch

```lua
setSamplePitch(sampleId, pitch)
```

### `setSampleVelocity()`

Set velocity of a sample object

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

```lua
setSampleVelocity(sampleId, x, y, z)
```

### `setSampleVolume()`

Set sample volume

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `volume` (`float`) - volume

```lua
setSampleVolume(sampleId, volume)
```

### `setScale()`

Set scale of a transform object

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

```lua
setScale(transformId, x, y, z)
```

### `setShaderParameter()`

Set shader parameter

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `parameterName` (`string`) - parameterName
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `w` (`float`) - w
- `shared` (`boolean`) - shared
- `_` (`integer`)

```lua
setShaderParameter(shapeId, parameterName, x, y, z, w, shared, _)
```

### `setShapeBones()`

The new root newRootBoneId must match with oldRootBoneId or the currently assigned root if oldRootBoneId is 0.

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `newRootBoneId` (`integer`) - The roof the new skeleton
- `oldRootBoneId` (`integer`) - The root of the currently assigned skeleton. If 0, the lowest common root node of the currently assigned bones is used
- `keepBindPoses` (`boolean`) - If true, the bind poses of the current bones are kept, otherwise the new bones are assumed to be in the bind pose

**Returns:** `boolean`

```lua
local result = setShapeBones(shapeId, newRootBoneId, oldRootBoneId, keepBindPoses)
```

### `setShapeBonesFromShape()`

Set the same bones as the other shape uses. Both shapes must use exactly the same number of bones

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `sourceShapeId` (`integer`) - sourceShapeId

**Returns:** `boolean`

```lua
local result = setShapeBonesFromShape(shapeId, sourceShapeId)
```

### `setShapeBoundingSphere()`

Set the bounding sphere of this shape only

**Parameters:**

- `shapeId` (`integer`)
- `localPosX` (`float`)
- `localPosY` (`float`)
- `localPosZ` (`float`)
- `radius` (`float`) - if < 0, the bounding sphere of the geometry will be used

```lua
setShapeBoundingSphere(shapeId, localPosX, localPosY, localPosZ, radius)
```

### `setShapeCastShadowmap()`

Set Cast Shadowmap flag

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `castShadowmap` (`boolean`) - castShadowmap

```lua
setShapeCastShadowmap(shapeId, castShadowmap)
```

### `setShapeGeometryBoundingSphere()`

Warning: This does not update the bounding volumes of other shapes using this geometry. Those are only updated if they are invalided, e.g. by moving the shape or calling invalidShapeBoundingVolume

**Parameters:**

- `shapeId` (`integer`)
- `localPosX` (`float`)
- `localPosY` (`float`)
- `localPosZ` (`float`)
- `radius` (`float`)

```lua
setShapeGeometryBoundingSphere(shapeId, localPosX, localPosY, localPosZ, radius)
```

### `setSolverIterationCount()`

Set solver iteration count

**Parameters:**

- `transformId` (`integer`) - transformId
- `count` (`integer`) - count

```lua
setSolverIterationCount(transformId, count)
```

### `setSplineCV()`

Set the position of a spline control point.

**Parameters:**

- `shapeId` (`integer`) - Spline id
- `index` (`integer`) - The index of the control point to be positioned
- `x` (`float`) - New spline point position x
- `y` (`float`) - New spline point position y
- `z` (`float`) - New spline point position z

```lua
setSplineCV(shapeId, index, x, y, z)
```

### `setSplineEP()`

Set the position of a spline edit point.

**Parameters:**

- `shapeId` (`integer`) - Spline id
- `index` (`integer`) - The index of the edit point to be positioned
- `x` (`float`) - New spline point position x
- `y` (`float`) - New spline point position y
- `z` (`float`) - New spline point position z

```lua
setSplineEP(shapeId, index, x, y, z)
```

### `setStreamI3DFileDelay()`

Set random delay parameters for streamed I3D loading

**Parameters:**

- `minDelay` (`float`) - min delay in seconds
- `maxDelay` (`float`) - max delay in seconds

```lua
setStreamI3DFileDelay(minDelay, maxDelay)
```

### `setStreamSharedI3DFileDelay()`

Set random delay parameters for shared I3D loading

**Parameters:**

- `minDelay` (`float`) - min delay in seconds for loaded shared I3D
- `maxDelay` (`float`) - max delay in seconds for loaded shared I3D
- `minDelayCached` (`float`) - min delay in seconds for cached shared I3D
- `maxDelayCached` (`float`) - max delay in seconds for cached shared I3D
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)

```lua
setStreamSharedI3DFileDelay(minDelay, maxDelay, minDelayCached, maxDelayCached, _, _, _, _, _)
```

### `setStreamedSampleVolume()`

Set streamed sample volume

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `volume` (`float`) - volume

```lua
setStreamedSampleVolume(sampleId, volume)
```

### `setTextAlignment()`

Set the text alignment to be used for the following renderText calls

**Parameters:**

- `alignment` (`integer`) - alignment

```lua
setTextAlignment(alignment)
```

### `setTextBold()`

Set the text boldness to be used for the following renderText calls

**Parameters:**

- `isBold` (`boolean`) - isBold

```lua
setTextBold(isBold)
```

### `setTextClipArea()`

Set to unit area to disable.

**Parameters:**

- `clipMinX` (`float`)
- `clipMinY` (`float`)
- `clipMaxX` (`float`)
- `clipMaxY` (`float`)

```lua
setTextClipArea(clipMinX, clipMinY, clipMaxX, clipMaxY)
```

### `setTextColor()`

Set the text color to be used for the following renderText calls

**Parameters:**

- `r` (`float`) - r
- `g` (`float`) - g
- `b` (`float`) - b
- `a` (`float`) - a
- `_` (`boolean`)

```lua
setTextColor(r, g, b, a, _)
```

### `setTextLineBounds()`

Set text line bounds

**Parameters:**

- `startLine` (`integer`) - startLine
- `numLines` (`integer`) - numLines
- `_` (`float`)
- `_` (`integer`)
- `_` (`integer`)

```lua
setTextLineBounds(startLine, numLines, _, _, _)
```

### `setTextWidthScale()`

Set the text scale width to be used for the following renderText calls

**Parameters:**

- `scaleWidth` (`float`) - scaleWidth

```lua
setTextWidthScale(scaleWidth)
```

### `setTextWrapWidth()`

Set text wrap width

**Parameters:**

- `wrapWidth` (`float`) - wrapWidth
- `allowForcedWrap` (`boolean`) - allow wrapping mid word when no separator is available

```lua
setTextWrapWidth(wrapWidth, allowForcedWrap)
```

### `setTranslation()`

Set translation of a transform object

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `_` (`integer`)
- `_` (`boolean`)

```lua
setTranslation(transformId, x, y, z, _, _)
```

### `setUserAttribute()`

Set user attribute value

**Parameters:**

- `objectId` (`integer`) - objectId
- `attributeName` (`string`) - attributeName
- `typeName` (`string`)
- `value` (`any`) - value

```lua
setUserAttribute(objectId, attributeName, typeName, value)
```

### `setVisibility()`

Set transform object visibility

**Parameters:**

- `transformId` (`integer`) - transformId
- `visibility` (`boolean`) - visibility

```lua
setVisibility(transformId, visibility)
```

### `setVisibilityConditionDayOfYear()`

Set the day of year condition of the visibility condition

**Parameters:**

- `objectId` (`integer`) - objectId
- `dayOfYearStart` (`integer`) - dayOfYearStart
- `dayOfYearEnd` (`integer`) - dayOfYearEnd

```lua
setVisibilityConditionDayOfYear(objectId, dayOfYearStart, dayOfYearEnd)
```

### `setVisibilityConditionMinuteOfDay()`

Set the minute of day condition of the visibility condition

**Parameters:**

- `objectId` (`integer`) - objectId
- `minuteOfDayStart` (`integer`) - minuteOfDayStart
- `minuteOfDayEnd` (`integer`) - minuteOfDayEnd

```lua
setVisibilityConditionMinuteOfDay(objectId, minuteOfDayStart, minuteOfDayEnd)
```

### `setVisibilityConditionRenderInvisible()`

Set the render invisible property of the visibility condition

**Parameters:**

- `objectId` (`integer`) - objectId
- `renderInvisible` (`boolean`) - if true, the object will always be rendered and the custom shader is supposed to change the rendering based on the visibility parameter

```lua
setVisibilityConditionRenderInvisible(objectId, renderInvisible)
```

### `setVisibilityConditionViewerSpacialityMask()`

Set the viewerspaciality mask condition of the visibility condition

**Parameters:**

- `objectId` (`integer`) - objectId
- `viewerSpacialityRequiredMask` (`integer`)
- `viewerSpacialityPreventMask` (`integer`)

```lua
setVisibilityConditionViewerSpacialityMask(objectId, viewerSpacialityRequiredMask, viewerSpacialityPreventMask)
```

### `setVisibilityConditionVisibleShaderParameter()`

Set the shader parameter of the visibility condition

**Parameters:**

- `objectId` (`integer`) - objectId
- `shaderVisibilityParam` (`float`) - shader parameter when condition is met

```lua
setVisibilityConditionVisibleShaderParameter(objectId, shaderVisibilityParam)
```

### `setVisibilityConditionWeatherMask()`

Set the weather mask condition of the visibility condition

**Parameters:**

- `objectId` (`integer`) - objectId
- `weatherRequiredMask` (`integer`)
- `weatherPreventMask` (`integer`)

```lua
setVisibilityConditionWeatherMask(objectId, weatherRequiredMask, weatherPreventMask)
```

### `setWheelShapeForcePoint()`

Set wheel shape force point

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex
- `positionX` (`float`) - positionX
- `positionY` (`float`) - positionY
- `positionZ` (`float`) - positionZ

```lua
setWheelShapeForcePoint(transformId, wheelShapeIndex, positionX, positionY, positionZ)
```

### `setWheelShapeProps()`

Set wheel shape properties

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex
- `motorTorque` (`float`) - motorTorque
- `brakeTorque` (`float`) - brakeTorque
- `steerAngle` (`float`) - steerAngle
- `rotationDamping` (`float`) - rotationDamping

```lua
setWheelShapeProps(transformId, wheelShapeIndex, motorTorque, brakeTorque, steerAngle, rotationDamping)
```

### `setWheelShapeTireFriction()`

Set wheel shape tire friction

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex
- `maxLongStiffness` (`float`) - maxLongStiffness
- `maxLatStiffness` (`float`) - maxLatStiffness
- `maxLatStiffnessTireLoad` (`float`) - maxLatStiffnessTireLoad
- `frictionMultiplier` (`float`) - frictionMultiplier

```lua
setWheelShapeTireFriction(transformId, wheelShapeIndex, maxLongStiffness, maxLatStiffness, maxLatStiffnessTireLoad, frictionMultiplier)
```

### `setXMLBool()`

Set XML file boolean attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath
- `value` (`boolean`) - value

```lua
setXMLBool(xmlId, attributePath, value)
```

### `setXMLFloat()`

Set XML file float attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath
- `value` (`float`) - value

```lua
setXMLFloat(xmlId, attributePath, value)
```

### `setXMLInt()`

Set XML file integer attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath
- `value` (`integer`) - value

```lua
setXMLInt(xmlId, attributePath, value)
```

### `setXMLString()`

Set XML file string attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath
- `value` (`string`) - value

```lua
setXMLString(xmlId, attributePath, value)
```

