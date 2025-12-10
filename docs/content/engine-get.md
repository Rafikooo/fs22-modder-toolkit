---
title: Engine Functions - Get
description: Get functions from FS22 engine
---

# Get Functions

156 functions starting with `get`.

### `getAllSharedI3DFileRequestIds()`

Get all shared I3D file request ids

**Returns:** `intarray`

```lua
local result = getAllSharedI3DFileRequestIds()
```

### `getAllStreamI3DFileRequestIds()`

Get all streaming I3D file request ids

**Returns:** `intarray`

```lua
local result = getAllStreamI3DFileRequestIds()
```

### `getAngularDamping()`

Get angular damping

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getAngularDamping(transformId)
```

### `getAngularVelocity()`

Get angular velocity of transform object

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getAngularVelocity(transformId)
```

### `getAnimCharacterSet()`

Get animation character set id

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `integer`

```lua
local result = getAnimCharacterSet(objectId)
```

### `getAnimClipDuration()`

Get the duration of the clip at the given index

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `index` (`integer`) - index

**Returns:** `float`

```lua
local result = getAnimClipDuration(characterSetId, index)
```

### `getAnimClipIndex()`

Return the index of the clip with the given name

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `clipName` (`string`) - clipName

**Returns:** `integer`

```lua
local result = getAnimClipIndex(characterSetId, clipName)
```

### `getAnimNumOfClips()`

Get number of clips

**Parameters:**

- `characterSetId` (`integer`) - characterSetId

**Returns:** `integer`

```lua
local result = getAnimNumOfClips(characterSetId)
```

### `getAnimTrackAssignedClip()`

Get animation track assigned clip index number

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId

**Returns:** `integer`

```lua
local result = getAnimTrackAssignedClip(characterSetId, trackId)
```

### `getAnimTrackBlendWeight()`

Get animation track blend weight

**Parameters:**

- `characterSetId` (`integer`) - characterSetId
- `trackId` (`integer`) - trackId

**Returns:** `float`

```lua
local result = getAnimTrackBlendWeight(characterSetId, trackId)
```

### `getAnimTrackTime()`

Get animation track loop state

**Parameters:**

- `trackId` (`integer`) - trackId
- `_` (`integer`)
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getAnimTrackTime(trackId, _, _, _)
```

### `getAudioSourceMaxRetriggerDelay()`

Get the AudioSource's max retrigger delay

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `float`

```lua
local result = getAudioSourceMaxRetriggerDelay(objectId)
```

### `getAudioSourceMinRetriggerDelay()`

Get the AudioSource's min retrigger delay

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `float`

```lua
local result = getAudioSourceMinRetriggerDelay(objectId)
```

### `getAudioSourceRandomPlayback()`

Get the AudioSource's random playback state

**Parameters:**

- `objectId` (`integer`) - objectId
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getAudioSourceRandomPlayback(objectId, _)
```

### `getAudioSourceSample()`

Gets the sample id of an audio source

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `integer`

```lua
local result = getAudioSourceSample(objectId)
```

### `getAudioSourceSampleElementProbability()`

Get the AudioSource's sample element's probability

**Parameters:**

- `objectId` (`integer`) - objectId
- `index` (`integer`) - index
- `_` (`integer`)

**Returns:** `boolean`

```lua
local result = getAudioSourceSampleElementProbability(objectId, index, _)
```

### `getCCTCollisionFlags()`

Get character controller collision flags

**Parameters:**

- `characterIndex` (`integer`) - characterIndex

**Returns:** `boolean`

```lua
local result = getCCTCollisionFlags(characterIndex)
```

### `getCamera()`

Get camera

**Returns:** `integer`

```lua
local result = getCamera()
```

### `getCanRenderUnicode()`

Get can render unicode

**Parameters:**

- `unicode` (`integer`) - unicode

**Returns:** `boolean`

```lua
local result = getCanRenderUnicode(unicode)
```

### `getCenterOfMass()`

Get center of mass

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getCenterOfMass(transformId)
```

### `getChild()`

Get child id

**Parameters:**

- `objectId` (`integer`) - objectId
- `childName` (`string`) - childName

**Returns:** `integer`

```lua
local result = getChild(objectId, childName)
```

### `getChildAt()`

Get child id at given index

**Parameters:**

- `objectId` (`integer`) - objectId
- `index` (`integer`) - index

**Returns:** `integer`

```lua
local result = getChildAt(objectId, index)
```

### `getChildIndex()`

Get child index

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `integer`

```lua
local result = getChildIndex(objectId)
```

### `getClipDistance()`

Get object clip distance

**Parameters:**

- `objectId` (`integer`) - objectId
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getClipDistance(objectId, _)
```

### `getClosestSplinePosition()`

Get closest world space position and time on spline to given world space position

**Parameters:**

- `shapeId` (`integer`)
- `worldX` (`float`)
- `worldY` (`float`)
- `worldZ` (`float`)
- `eps` (`float`) - acceptable world space error

**Returns:** `float`

```lua
local result = getClosestSplinePosition(shapeId, worldX, worldY, worldZ, eps)
```

### `getCollisionMask()`

Get collision mask

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `integer`

```lua
local result = getCollisionMask(transformId)
```

### `getConditionalAnimationBoolValue()`

Get boolean value

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `parameterId` (`integer`) - parameterId

**Returns:** `boolean`

```lua
local result = getConditionalAnimationBoolValue(conditionalAnimationId, parameterId)
```

### `getConditionalAnimationFloatValue()`

Get float value

**Parameters:**

- `conditionalAnimationId` (`integer`) - conditionalAnimationId
- `parameterId` (`integer`) - parameterId

**Returns:** `float`

```lua
local result = getConditionalAnimationFloatValue(conditionalAnimationId, parameterId)
```

### `getConditionalAnimationTime()`

Get time

**Parameters:**

- `conditionalAnimationId` (`integer`)

**Returns:** `float`

```lua
local result = getConditionalAnimationTime(conditionalAnimationId)
```

### `getCurrentMasterVolume()`

Get current master volume

**Returns:** `float`

```lua
local result = getCurrentMasterVolume()
```

### `getDataPlaneAssociatedTransformGroup()`

Get associated transform group from a given dataplane

**Parameters:**

- `dataPlaneId` (`integer`) - dataplane ID

**Returns:** `integer`

```lua
local result = getDataPlaneAssociatedTransformGroup(dataPlaneId)
```

### `getDensity()`

Get density

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getDensity(transformId)
```

### `getDensityAtWorldPos()`

Get density at world position

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

**Returns:** `integer`

```lua
local result = getDensityAtWorldPos(transformId, x, y, z)
```

### `getDensityHeightAtWorldPos()`

Get height of the density map at the world position

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

**Returns:** `float`

```lua
local result = getDensityHeightAtWorldPos(transformId, x, y, z)
```

### `getDensityMapSize()`

Get density map file name

**Parameters:**

- `transformId` (`integer`) - transformId
- `densityMapSyncer` (`integer`) - id
- `densityMap` (`integer`) - id
- `worldX` (`float`) - world X coordinate
- `worldZ` (`float`) - world Z coordinate
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)

**Returns:** `float`

```lua
local result = getDensityMapSize(transformId, densityMapSyncer, densityMap, worldX, worldZ, _, _, _, _)
```

### `getDensityRegion()`

Get density region

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `z` (`float`) - z
- `width` (`float`) - width
- `height` (`float`) - height
- `firstChannel` (`integer`) - firstChannel
- `numChannels` (`integer`) - numChannels

**Returns:** `integer`

```lua
local result = getDensityRegion(transformId, x, z, width, height, firstChannel, numChannels)
```

### `getDensityRegionWorld()`

Get density region world

**Parameters:**

- `transformId` (`integer`) - transformId
- `x` (`float`) - x
- `z` (`float`) - z
- `width` (`float`) - width
- `height` (`float`) - height
- `firstChannel` (`integer`) - firstChannel
- `numChannels` (`integer`) - numChannels
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `boolean`

```lua
local result = getDensityRegionWorld(transformId, x, z, width, height, firstChannel, numChannels, _, _)
```

### `getEmitStartTime()`

Get emitter starting time.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId

**Returns:** `float`

```lua
local result = getEmitStartTime(particleSystemId)
```

### `getEmitStopTime()`

Get emitter stop time.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId

**Returns:** `float`

```lua
local result = getEmitStopTime(particleSystemId)
```

### `getEmitterShape()`

Returns the emitter shape of the particle system

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId

**Returns:** `integer`

```lua
local result = getEmitterShape(particleSystemId)
```

### `getEmitterShapeVelocityScale()`

Returns the emitter shape velocity scale of the particle system

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId

**Returns:** `float`

```lua
local result = getEmitterShapeVelocityScale(particleSystemId)
```

### `getFarClip()`

Get the far clip distance

**Parameters:**

- `cameraId` (`integer`) - cameraId

**Returns:** `float`

```lua
local result = getFarClip(cameraId)
```

### `getFillPlaneHeightAtLocalPos()`

Get the fill plane height at a specific position

**Parameters:**

- `fillPlaneId` (`integer`) - fillPlaneId
- `x` (`float`) - x
- `z` (`float`) - z
- `foliageBendingSystemId` (`integer`)
- `rectangleId` (`integer`)

**Returns:** `float`

```lua
local result = getFillPlaneHeightAtLocalPos(fillPlaneId, x, z, foliageBendingSystemId, rectangleId)
```

### `getFoliageTransformGroupIdByFoliageName()`

Get foliage transform group from foliage name

**Parameters:**

- `terrainId` (`integer`) - terrainId
- `detailName` (`string`) - detailName

**Returns:** `integer`

```lua
local result = getFoliageTransformGroupIdByFoliageName(terrainId, detailName)
```

### `getFovY()`

Get the vertical field of view angle

**Parameters:**

- `cameraId` (`integer`) - id of the camera

**Returns:** `float`

```lua
local result = getFovY(cameraId)
```

### `getGamepadAxisLabel()`

Get joystick/gamepad axis label

**Parameters:**

- `axisNumber` (`integer`) - axisNumber
- `gamepadIndex` (`integer`) - gamepadIndex
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `string`

```lua
local result = getGamepadAxisLabel(axisNumber, gamepadIndex, _, _)
```

### `getGamepadButtonLabel()`

Get joystick/gamepad button label

**Parameters:**

- `buttonNumber` (`integer`) - buttonNumber
- `gamepadIndex` (`integer`) - gamepadIndex
- `_` (`integer`)
- `_` (`integer`)
- `_` (`integer`)
- `_` (`integer`)
- `_` (`float`)
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `integer`

```lua
local result = getGamepadButtonLabel(buttonNumber, gamepadIndex, _, _, _, _, _, _, _)
```

### `getGamepadName()`

Get name of joystick/gamepad

**Parameters:**

- `gamepadIndex` (`integer`) - gamepadIndex
- `_` (`integer`)
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `integer`

```lua
local result = getGamepadName(gamepadIndex, _, _, _)
```

### `getGeometry()`

Get shape geometry id

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `integer`

```lua
local result = getGeometry(shapeId)
```

### `getHasClassId()`

Get has class id

**Parameters:**

- `objectId` (`integer`) - objectId
- `classId` (`integer`) - classId

**Returns:** `boolean`

```lua
local result = getHasClassId(objectId, classId)
```

### `getHasShaderParameter()`

Get has shader parameter

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `parameterName` (`string`) - parameterName

**Returns:** `boolean`

```lua
local result = getHasShaderParameter(shapeId, parameterName)
```

### `getHasTouchpad()`

Get existence of a touchpad - this is dynamic

**Returns:** `boolean`

```lua
local result = getHasTouchpad()
```

### `getHasTrigger()`

Get has trigger flag

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `boolean`

```lua
local result = getHasTrigger(objectId)
```

### `getInputAxis()`

Get joystick/gamepad axis value

**Parameters:**

- `axisNumber` (`integer`) - axisNumber
- `gamepadIndex` (`integer`) - gamepadIndex

**Returns:** `float`

```lua
local result = getInputAxis(axisNumber, gamepadIndex)
```

### `getInputButton()`

Get joystick/gamepad button value

**Parameters:**

- `buttonNumber` (`integer`) - buttonNumber
- `gamepadIndex` (`integer`) - gamepadIndex
- `_` (`integer`)
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `boolean`

```lua
local result = getInputButton(buttonNumber, gamepadIndex, _, _, _)
```

### `getIsLockedGroup()`

Get transform object locked group flag

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `boolean`

```lua
local result = getIsLockedGroup(transformId)
```

### `getIsNonRenderable()`

Get if shape is non-renderable

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `_` (`integer`)

**Returns:** `boolean`

```lua
local result = getIsNonRenderable(shapeId, _)
```

### `getIsSplineClosed()`

Checks if given spline has closed form

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `boolean`

```lua
local result = getIsSplineClosed(shapeId)
```

### `getLODTransformGroup()`

Returns the LOD transform group that this transform group belongs to

**Parameters:**

- `transformId` (`integer`) - transformId is either a shape, an audio source or a light source

**Returns:** `integer`

```lua
local result = getLODTransformGroup(transformId)
```

### `getLevenshteinDistance()`

Get levenshtein distance

**Parameters:**

- `value1` (`string`) - value1
- `value2` (`string`) - value2

**Returns:** `integer`

```lua
local result = getLevenshteinDistance(value1, value2)
```

### `getLightCastingShadowMap()`

Returns whether the light source casts a shadow or not.

**Parameters:**

- `lightId` (`integer`) - lightId

**Returns:** `boolean`

```lua
local result = getLightCastingShadowMap(lightId)
```

### `getLightRange()`

Get range of a light

**Parameters:**

- `lightId` (`integer`) - lightId
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getLightRange(lightId, _)
```

### `getLightType()`

Get light type

**Parameters:**

- `lightId` (`integer`) - lightId

**Returns:** `integer`

```lua
local result = getLightType(lightId)
```

### `getLinearDamping()`

Get linear damping

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getLinearDamping(transformId)
```

### `getLinearVelocity()`

Get linear velocity of transform object

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getLinearVelocity(transformId)
```

### `getLocalClosestSplinePosition()`

Get closest world space position and time on spline to given world space position

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `time` (`float`)
- `timeRange` (`float`)
- `worldX` (`float`)
- `worldY` (`float`)
- `worldZ` (`float`)
- `eps` (`float`) - world space error

**Returns:** `float`

```lua
local result = getLocalClosestSplinePosition(shapeId, time, timeRange, worldX, worldY, worldZ, eps)
```

### `getLocalLinearVelocity()`

Get local linear velocity of transform object

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getLocalLinearVelocity(transformId)
```

### `getMass()`

Get mass

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getMass(transformId)
```

### `getMasterVolume()`

Get master volume

**Returns:** `float`

```lua
local result = getMasterVolume()
```

### `getMaterial()`

Get material by index

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `materialIdx` (`integer`) - materialIdx
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)
- `materialId` (`integer`)

**Returns:** `float`

```lua
local result = getMaterial(shapeId, materialIdx, materialId, materialId, materialId, materialId, materialId, materialId, materialId, materialId, materialId, materialId, materialId, materialId, materialId)
```

### `getMinClipDistance()`

Get minimum clip distance

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `float`

```lua
local result = getMinClipDistance(objectId)
```

### `getMotorRotationSpeed()`

Set vehicle properties

**Parameters:**

- `transformId` (`integer`) - transformId
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getMotorRotationSpeed(transformId, _)
```

### `getName()`

Get object name

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `string`

```lua
local result = getName(objectId)
```

### `getNearClip()`

Set the near clip distance

**Parameters:**

- `cameraId` (`integer`) - cameraId

**Returns:** `float`

```lua
local result = getNearClip(cameraId)
```

### `getNoteNodeText()`

Get note node text

**Parameters:**

- `noteId` (`integer`) - Id of the note node

**Returns:** `string`

```lua
local result = getNoteNodeText(noteId)
```

### `getNumOfAudioSourceSampleElements()`

Get the number of sample elements for an AudioSource

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `integer`

```lua
local result = getNumOfAudioSourceSampleElements(objectId)
```

### `getNumOfChildren()`

Get number of children

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `integer`

```lua
local result = getNumOfChildren(objectId)
```

### `getNumOfGamepads()`

Get number of joysticks/gamepads

**Returns:** `integer`

```lua
local result = getNumOfGamepads()
```

### `getNumOfMaterials()`

Get number of materials

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `shapeId` (`integer`) - shapeId

**Returns:** `integer`

```lua
local result = getNumOfMaterials(shapeId, shapeId)
```

### `getNumOfSharedI3DFiles()`

Gets the number of shared I3d files

**Returns:** `integer`

```lua
local result = getNumOfSharedI3DFiles()
```

### `getNumUserAttribute()`

Get number of user attributes

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `integer`

```lua
local result = getNumUserAttribute(objectId)
```

### `getObjectMask()`

Get object mask

**Parameters:**

- `objectId` (`integer`) - objectId
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getObjectMask(objectId, _)
```

### `getParent()`

Get parent id

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `integer`

```lua
local result = getParent(objectId)
```

### `getParticleSystemAverageSpeed()`

Get particle system average speed.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId

**Returns:** `float`

```lua
local result = getParticleSystemAverageSpeed(particleSystemId)
```

### `getParticleSystemLifespan()`

Get particle system life span.

**Parameters:**

- `particleSystemId` (`integer`) - particleSystemId
- `_` (`integer`)
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getParticleSystemLifespan(particleSystemId, _, _)
```

### `getQuaternion()`

gets quaternion

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `float`

```lua
local result = getQuaternion(objectId)
```

### `getRigidBodyType()`

Get rigid body type

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `integer`

```lua
local result = getRigidBodyType(transformId)
```

### `getRootNode()`

Get root node

**Returns:** `integer`

```lua
local result = getRootNode()
```

### `getRotation()`

Get rotation of a transform object

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getRotation(transformId)
```

### `getSampleDuration()`

Get sample duration

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleDuration(sampleId)
```

### `getSampleLoopSynthesisLoadFactor()`

Get the loop synthesis sample load factor currently played

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisLoadFactor(sampleId)
```

### `getSampleLoopSynthesisMaxRPM()`

Get the loop synthesis sample max RPM

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisMaxRPM(sampleId)
```

### `getSampleLoopSynthesisMinRPM()`

Get the loop synthesis sample min RPM

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisMinRPM(sampleId)
```

### `getSampleLoopSynthesisRPM()`

Get the loop synthesis sample RPM currently played

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `useNormalizedValue` (`boolean`) - If true, return normalized value between ; else return real range value.

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisRPM(sampleId, useNormalizedValue)
```

### `getSampleLoopSynthesisStartDuration()`

Get the loop synthesis sample start sound duration

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisStartDuration(sampleId)
```

### `getSampleLoopSynthesisStopDuration()`

Get the loop synthesis sample stop sound duration

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisStopDuration(sampleId)
```

### `getSampleLoopSynthesisTargetLoadFactor()`

Get the loop synthesis sample target load factor

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisTargetLoadFactor(sampleId)
```

### `getSampleLoopSynthesisTargetRPM()`

Get the loop synthesis sample target RPM

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `useNormalizedValue` (`boolean`) - If true, return normalized value between ; else return real range value.

**Returns:** `float`

```lua
local result = getSampleLoopSynthesisTargetRPM(sampleId, useNormalizedValue)
```

### `getSamplePitch()`

Set sample pitch

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSamplePitch(sampleId)
```

### `getSamplePlayOffset()`

Get sample play offset

**Parameters:**

- `sampleId` (`integer`) - sampleId
- `_` (`integer`)

**Returns:** `float`

```lua
local result = getSamplePlayOffset(sampleId, _)
```

### `getSampleVelocity()`

Get velocity of a sample object

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleVelocity(sampleId)
```

### `getSampleVolume()`

Get sample volume

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getSampleVolume(sampleId)
```

### `getScale()`

Get scale of a transform object

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getScale(transformId)
```

### `getShaderParameter()`

Get shader parameter

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `parameterName` (`string`) - parameterName
- `shapeId` (`integer`)
- `boneIndex` (`integer`)

**Returns:** `integer`

```lua
local result = getShaderParameter(shapeId, parameterName, shapeId, boneIndex)
```

### `getShapeBoundingSphere()`

Returns bounding sphere of shape

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `float`

```lua
local result = getShapeBoundingSphere(shapeId)
```

### `getShapeIsCPUMesh()`

Get if shape is marked as CPU mesh

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `boolean`

```lua
local result = getShapeIsCPUMesh(shapeId)
```

### `getShapeIsSkinned()`

Get if shape is skinned

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `boolean`

```lua
local result = getShapeIsSkinned(shapeId)
```

### `getSharedI3DFileProgressInfo()`

Get shared I3D file progress information

**Parameters:**

- `requestId` (`integer`) - request id from streamSharedI3DFile

**Returns:** `string`

```lua
local result = getSharedI3DFileProgressInfo(requestId)
```

### `getSharedI3DFileRefCount()`

Gets the number references a shared I3D file has

**Parameters:**

- `filename` (`string`)

**Returns:** `integer`

```lua
local result = getSharedI3DFileRefCount(filename)
```

### `getSplineCV()`

Get spline control vertex

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `index` (`integer`) - index

**Returns:** `float`

```lua
local result = getSplineCV(shapeId, index)
```

### `getSplineDirection()`

Get spline direction

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `time` (`float`) - time

**Returns:** `float`

```lua
local result = getSplineDirection(shapeId, time)
```

### `getSplineEP()`

Get spline edit point

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `index` (`integer`) - index

**Returns:** `float`

```lua
local result = getSplineEP(shapeId, index)
```

### `getSplineLength()`

Get spline length

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `float`

```lua
local result = getSplineLength(shapeId)
```

### `getSplineNumOfCV()`

Get number of spline control vertices

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `integer`

```lua
local result = getSplineNumOfCV(shapeId)
```

### `getSplineOrientation()`

Get spline orientation

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `time` (`float`) - time
- `upDirX` (`float`) - upDirX
- `upDirY` (`float`) - upDirY
- `upDirZ` (`float`) - upDirZ

**Returns:** `float`

```lua
local result = getSplineOrientation(shapeId, time, upDirX, upDirY, upDirZ)
```

### `getSplinePosition()`

Get spline position

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `time` (`float`) - time

**Returns:** `float`

```lua
local result = getSplinePosition(shapeId, time)
```

### `getSplinePositionWithDistance()`

Get world space position and time on spline that has the given world space distance to the position on the spline at the given

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `time` (`float`)
- `distance` (`float`)
- `positiveTimeOffset` (`boolean`) - search in positive or negative direction of t
- `eps` (`float`) - world space

**Returns:** `float`

```lua
local result = getSplinePositionWithDistance(shapeId, time, distance, positiveTimeOffset, eps)
```

### `getSplitType()`

Get split type

**Parameters:**

- `shapeId` (`integer`) - shapeId

**Returns:** `integer`

```lua
local result = getSplitType(shapeId)
```

### `getStreamI3DFileProgressInfo()`

Get streaming I3D file progress information

**Parameters:**

- `requestId` (`integer`) - request id from streamI3DFile

**Returns:** `string`

```lua
local result = getStreamI3DFileProgressInfo(requestId)
```

### `getStreamedSampleVolume()`

Get streamed sample volume

**Parameters:**

- `sampleId` (`integer`) - sampleId

**Returns:** `float`

```lua
local result = getStreamedSampleVolume(sampleId)
```

### `getTerrainAttributesAtWorldPos()`

Get terrain attributes at world pos

**Parameters:**

- `terrainId` (`integer`) - terrainId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `xComb` (`boolean`) - xComb
- `yComb` (`boolean`) - yComb
- `zComb` (`boolean`) - zComb
- `wComb` (`boolean`) - wComb
- `uComb` (`boolean`) - uComb

**Returns:** `float`

```lua
local result = getTerrainAttributesAtWorldPos(terrainId, x, y, z, xComb, yComb, zComb, wComb, uComb)
```

### `getTerrainDataPlaneByName()`

Get terrain data plane by name

**Parameters:**

- `terrainId` (`integer`) - terrainId
- `detailName` (`string`) - detailName

**Returns:** `integer`

```lua
local result = getTerrainDataPlaneByName(terrainId, detailName)
```

### `getTerrainDetailByName()`

Get terrain detail by name

**Parameters:**

- `terrainId` (`integer`) - terrainId
- `detailName` (`string`) - detailName

**Returns:** `integer`

```lua
local result = getTerrainDetailByName(terrainId, detailName)
```

### `getTerrainDetailName()`

Get terrain detail name

**Parameters:**

- `terrainId` (`integer`) - terrainId

**Returns:** `string`

```lua
local result = getTerrainDetailName(terrainId)
```

### `getTerrainDetailNumChannels()`

Get number of terrain detail channels

**Parameters:**

- `terrain` (`integer`) - id terrain id

**Returns:** `integer`

```lua
local result = getTerrainDetailNumChannels(terrain)
```

### `getTerrainDetailTypeIndex()`

Get density map type ID for terrain detail

**Parameters:**

- `terrainId` (`integer`) - terrain id

**Returns:** `integer`

```lua
local result = getTerrainDetailTypeIndex(terrainId)
```

### `getTerrainHeightAtWorldPos()`

Get terrain height at world pos

**Parameters:**

- `terrainId` (`integer`) - terrainId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z

**Returns:** `float`

```lua
local result = getTerrainHeightAtWorldPos(terrainId, x, y, z)
```

### `getTerrainNormalAtWorldPos()`

Get terrain normal at world pos

**Parameters:**

- `terrainId` (`integer`) - terrainId
- `x` (`float`) - x
- `y` (`float`) - y
- `z` (`float`) - z
- `_` (`integer`)

**Returns:** `string`

```lua
local result = getTerrainNormalAtWorldPos(terrainId, x, y, z, _)
```

### `getTerrainSize()`

Get terrain size

**Parameters:**

- `terrainId` (`integer`) - terrainId
- `_` (`float`)
- `_` (`string`)
- `_` (`float`)
- `_` (`string`)
- `_` (`integer`)
- `_` (`float`)
- `_` (`string`)
- `_` (`float`)
- `_` (`float`)
- `_` (`string`)

**Returns:** `float`

```lua
local result = getTerrainSize(terrainId, _, _, _, _, _, _, _, _, _, _)
```

### `getTextHeight()`

Get text height

**Parameters:**

- `fontSize` (`float`) - fontSize
- `utf8string` (`string`) - utf8string

**Returns:** `float`

```lua
local result = getTextHeight(fontSize, utf8string)
```

### `getTextLength()`

Get text length

**Parameters:**

- `fontSize` (`float`) - fontSize
- `utf8string` (`string`) - utf8string
- `maxNumLines` (`integer`) - maxNumLines

**Returns:** `integer`

```lua
local result = getTextLength(fontSize, utf8string, maxNumLines)
```

### `getTextLineLength()`

Get text length

**Parameters:**

- `fontSize` (`float`) - fontSize
- `utf8string` (`string`) - utf8string
- `maxWidth` (`float`) - maxWidth

**Returns:** `integer`

```lua
local result = getTextLineLength(fontSize, utf8string, maxWidth)
```

### `getTextWidth()`

Get text width

**Parameters:**

- `fontSize` (`float`) - fontSize
- `utf8string` (`string`) - utf8string

**Returns:** `float`

```lua
local result = getTextWidth(fontSize, utf8string)
```

### `getTimeAtSplineCV()`

Get spline time of the control vertex with the given index

**Parameters:**

- `shapeId` (`integer`) - shapeId
- `index` (`integer`) - index

**Returns:** `float`

```lua
local result = getTimeAtSplineCV(shapeId, index)
```

### `getTranslation()`

Get translation of a transform object

**Parameters:**

- `transformId` (`integer`) - transformId
- `_` (`integer`)

**Returns:** `boolean`

```lua
local result = getTranslation(transformId, _)
```

### `getUserAttribute()`

Get user attribute value

**Parameters:**

- `objectId` (`integer`) - objectId
- `attributeName` (`string`) - attributeName

**Returns:** `any`

```lua
local result = getUserAttribute(objectId, attributeName)
```

### `getUserAttributeByIndex()`

Get user attribute value by index

**Parameters:**

- `objectId` (`integer`) - objectId
- `attributeIndex` (`integer`) - attributeIndex

**Returns:** `any`

```lua
local result = getUserAttributeByIndex(objectId, attributeIndex)
```

### `getVelocityAtLocalPos()`

Get velocity at local position of transform object

**Parameters:**

- `transformId` (`integer`) - transformId
- `positionX` (`float`) - positionX
- `positionY` (`float`) - positionY
- `positionZ` (`float`) - positionZ

**Returns:** `float`

```lua
local result = getVelocityAtLocalPos(transformId, positionX, positionY, positionZ)
```

### `getVelocityAtWorldPos()`

Get velocity at world position of transform object

**Parameters:**

- `transformId` (`integer`) - transformId
- `positionX` (`float`) - positionX
- `positionY` (`float`) - positionY
- `positionZ` (`float`) - positionZ

**Returns:** `float`

```lua
local result = getVelocityAtWorldPos(transformId, positionX, positionY, positionZ)
```

### `getVisibility()`

Get transform object visibility

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `boolean`

```lua
local result = getVisibility(transformId)
```

### `getVolume()`

Get volume, only for dynamic and kinematic shapes, 0 otherwise

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getVolume(transformId)
```

### `getWheelShapeAxleSpeed()`

Get wheel shape axle speed

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `float`

```lua
local result = getWheelShapeAxleSpeed(transformId, wheelShapeIndex)
```

### `getWheelShapeContactForce()`

Get wheel shape contact force

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `float`

```lua
local result = getWheelShapeContactForce(transformId, wheelShapeIndex)
```

### `getWheelShapeContactNormal()`

Get wheel shape contact normal

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `float`

```lua
local result = getWheelShapeContactNormal(transformId, wheelShapeIndex)
```

### `getWheelShapeContactObject()`

Get wheel shape contact object

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `integer`

```lua
local result = getWheelShapeContactObject(transformId, wheelShapeIndex)
```

### `getWheelShapeContactPoint()`

Get wheel shape contact point

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `float`

```lua
local result = getWheelShapeContactPoint(transformId, wheelShapeIndex)
```

### `getWheelShapePosition()`

Get wheel shape contact point

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `float`

```lua
local result = getWheelShapePosition(transformId, wheelShapeIndex)
```

### `getWheelShapeSlip()`

Get wheel shape slip

**Parameters:**

- `transformId` (`integer`) - transformId
- `wheelShapeIndex` (`integer`) - wheelShapeIndex

**Returns:** `float`

```lua
local result = getWheelShapeSlip(transformId, wheelShapeIndex)
```

### `getWorldQuaternion()`

Gets world quaternion

**Parameters:**

- `objectId` (`integer`) - objectId

**Returns:** `float`

```lua
local result = getWorldQuaternion(objectId)
```

### `getWorldRotation()`

Get world rotation of a transform object

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getWorldRotation(transformId)
```

### `getWorldTranslation()`

Get world translation of a transform object

**Parameters:**

- `transformId` (`integer`) - transformId

**Returns:** `float`

```lua
local result = getWorldTranslation(transformId)
```

### `getXMLBool()`

Get XML file boolean attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath

**Returns:** `boolean`

```lua
local result = getXMLBool(xmlId, attributePath)
```

### `getXMLFilename()`

Get XML filename

**Parameters:**

- `xmlId` (`integer`) - xmlId

**Returns:** `string`

```lua
local result = getXMLFilename(xmlId)
```

### `getXMLFloat()`

Get XML file float attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath

**Returns:** `float`

```lua
local result = getXMLFloat(xmlId, attributePath)
```

### `getXMLInt()`

Get XML file integer attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath

**Returns:** `integer`

```lua
local result = getXMLInt(xmlId, attributePath)
```

### `getXMLString()`

Get XML file string attribute.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `attributePath` (`string`) - attributePath

**Returns:** `string`

```lua
local result = getXMLString(xmlId, attributePath)
```

