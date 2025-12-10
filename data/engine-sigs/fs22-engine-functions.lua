--- Auto-generated FarmingSimulator API stubs for EmmyLua
---
--- Source: GIANTS Software GmbH - Farming Simulator 22 SDK
--- Original file: scriptBinding.xml
--- Generated from: scriptBinding.xml using generate-signatures.py
---
--- This file is a transformative work for educational and development purposes.
--- It provides IDE autocomplete support for the FS22 modding community.
--- Users should own a legitimate copy of Farming Simulator 22.
---
--- Farming Simulator is a trademark of GIANTS Software GmbH.
---
---@meta

--- Add an element to an AudioSource
---@param objectId integer objectId
---@param filename string filename
---@param probability float probability
function addAudioSourceSampleElement(objectId, filename, probability) end

--- Add differential
---@param objectId integer objectId
---@param diff0Index integer diff0Index
---@param diffIndex0IsWheel boolean diffIndex0IsWheel
---@param diff1Index integer diff1Index
---@param diffIndex1IsWheel boolean diffIndex1IsWheel
---@param ratio float ratio
---@param bias float bias
function addDifferential(objectId, diff0Index, diffIndex0IsWheel, diff1Index, diffIndex1IsWheel, ratio, bias) end

--- Load a new foliage type from an XML file, creating a new multilayer if a new density map is used
---@param dmId integer id for density map to use for the foliage layer, or a dataplane that shares this density map
---@param name string name of new layer
---@param xmlFilename string XML filename containing the layer definition
---@param _ string
---@return integer
function addFoliageTypFromXML(dmId, name, xmlFilename, _) end

--- Add force to object
---@param transformId integer transformId
---@param forceX float forceX
---@param forceY float forceY
---@param forceZ float forceZ
---@param positionX float positionX
---@param positionY float positionY
---@param positionZ float positionZ
---@param isPositionLocal boolean isPositionLocal
function addForce(transformId, forceX, forceY, forceZ, positionX, positionY, positionZ, isPositionLocal) end

--- Add impulse to object
---@param transformId integer transformId
---@param impulseX float impulseX
---@param impulseY float impulseY
---@param impulseZ float impulseZ
---@param positionX float positionX
---@param positionY float positionY
---@param positionZ float positionZ
---@param isPositionLocal boolean isPositionLocal
function addImpulse(transformId, impulseX, impulseY, impulseZ, positionX, positionY, positionZ, isPositionLocal) end

--- Add particle system simulation time
---@param particleSystemId integer particleSystemId
---@param dt float dt
function addParticleSystemSimulationTime(particleSystemId, dt) end

---@param _ integer
---@param _ integer
function addTerrainUpdateConnection(_, _) end

--- Add to physics
---@param transformId integer transformId
function addToPhysics(transformId) end

--- Adds torque to a collision
---@param objectId integer objectId
---@param x float x
---@param y float y
---@param z float z
function addTorque(objectId, x, y, z) end

--- Adds torque impulse to a collision
---@param objectId integer objectId
---@param x float x
---@param y float y
---@param z float z
function addTorqueImpulse(objectId, x, y, z) end

--- Adds a tire track position
---@param systemId integer systemId
---@param trackId integer trackId
---@param x float x
---@param y float y
---@param z float z
---@param x float x
---@param y float y
---@param z float z
---@param r float r
---@param g float g
---@param b float b
---@param a float a
---@param uw float uw
---@param dTheta float dTheta
---@param _ unknown
function addTrackPoint(systemId, trackId, x, y, z, x, y, z, r, g, b, a, uw, dTheta, _) end

--- Add vehicle link
---@param transformId integer transformId
---@param transformId2 integer transformId2
function addVehicleLink(transformId, transformId2) end

--- Aim camera
---@param cameraId integer cameraId
---@param x float x
---@param y float y
---@param z float z
---@param distance float distance
---@param dt float dt
---@param springStrength float springStrength
function aimCamera(cameraId, x, y, z, distance, dt, springStrength) end

--- Converts an ascii latin1 encoded string to an utf8 string
---@param asciiString string asciiString
---@return string
function asciiToUtf8(asciiString) end

--- Assign clip to animation track
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@param clipIndex integer clipIndex
function assignAnimTrackClip(characterSetId, trackId, clipIndex) end

--- base64 decode
---@param input string input
---@return bytearray
function base64Decode(input) end

--- base64 encode
---@param input bytearray input
---@return string
function base64Encode(input) end

--- bit AND-Operation
---@param value1 integer value1
---@param value2 integer value2
---@return integer
function bitAND(value1, value2) end

--- bit HighestSet-Operation
---@param input integer input
---@return integer
function bitHighestSet(input) end

--- bit OR-Operation
---@param value1 integer value1
---@param value2 integer value2
---@return integer
function bitOR(value1, value2) end

--- bit ShiftRight-Operation
---@param value1 integer value1
---@param value2 integer value2
---@return integer
function bitShiftRight(value1, value2) end

--- Build the navigation mesh based on the specified world data
---@param navMeshId integer navMeshId
---@param worldNode integer worldNode
---@param cellSize float cellSize
---@param cellHeight float cellHeight
---@param agentHeight float agentHeight
---@param agentRadius float agentRadius
---@param agentMaxClimb float agentMaxClimb
---@param agentMaxSlope float agentMaxSlope
---@param minRegionSize float minRegionSize
---@param mergeRegionSize float mergeRegionSize
---@param maxEdgeLength float maxEdgeLength
---@param maxSimplificationError float maxSimplificationError
---@param navMeshBuildMask integer navMeshBuildMask
---@param terrainDetail float terrainDetail
---@param terrainCullInfoLayer string terrainCullInfoLayer
---@param terrainCullInfoLayerChannels integer terrainCullInfoLayerChannels
---@return boolean
function buildNavMesh(navMeshId, worldNode, cellSize, cellHeight, agentHeight, agentRadius, agentMaxClimb, agentMaxSlope, minRegionSize, mergeRegionSize, maxEdgeLength, maxSimplificationError, navMeshBuildMask, terrainDetail, terrainCullInfoLayer, terrainCullInfoLayerChannels) end

---@param _ integer
---@param _ integer
---@return float
function calcDistanceFrom(_, _) end

---@param _ integer
---@param _ integer
---@return float
function calcDistanceSquaredFrom(_, _) end

--- Cancel streaming I3D file
---@param requestId integer request id from streamI3DFile
function cancelStreamI3DFile(requestId) end

--- Clear animation track clip assignment
---@param characterSetId integer characterSetId
---@param trackId integer trackId
function clearAnimTrackClip(characterSetId, trackId) end

--- Clears the shared i3d cache, deleting all data and calling finish callbacks on all pending loads with failedReason = Cancelled.
function clearEntireSharedI3DFileCache() end

--- Clears all overlays in the given area
---@param x float x
---@param y float y
---@param width float width
---@param height float height
---@param rotation float rotation
---@param rotCenterX float center of rotation x
---@param rotCenterY float center of rotation y
function clearOverlayArea(x, y, width, height, rotation, rotCenterX, rotCenterY) end

--- Clone scenegraph object
---@param objectId integer objectId
---@param groupUnderParent boolean groupUnderParent
---@param callOnCreate boolean callOnCreate
---@param addPhysics boolean addPhysics
---@return integer
function clone(objectId, groupUnderParent, callOnCreate, addPhysics) end

--- Clone anim character set
---@param objectId integer objectId
---@param targetId integer targetId
---@return boolean
function cloneAnimCharacterSet(objectId, targetId) end

--- Calculate wheel shape tire forces
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@param longSlipRatio float longSlipRatio
---@param latSlipAngle float latSlipAngle
---@param tireLoad float tireLoad
---@return float, float
function computeWheelShapeTireForces(transformId, wheelShapeIndex, longSlipRatio, latSlipAngle, tireLoad) end

--- Debug draw
---@param conditionalAnimationId integer conditionalAnimationId
---@param x float x
---@param y float y
---@param z float z
function conditionalAnimationDebugDraw(conditionalAnimationId, x, y, z) end

--- Register parameter
---@param conditionalAnimationId integer conditionalAnimationId
---@param parameterId integer
---@param parameterType integer
---@param parameterLabel string
function conditionalAnimationRegisterParameter(conditionalAnimationId, parameterId, parameterType, parameterLabel) end

--- Zeroise track times
---@param conditionalAnimationId integer conditionalAnimationId
function conditionalAnimationZeroiseTrackTimes(conditionalAnimationId) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
function controlVehicle(_, _, _, _, _, _, _, _, _, _, _) end

--- Create audio source object for 3D sounds
---@param audioSourceName string audioSourceName
---@param sampleFilename string sampleFilename
---@param radius float radius
---@param innerRadius float innerRadius
---@param volume float volume
---@param loops integer loops
---@return integer
function createAudioSource(audioSourceName, sampleFilename, radius, innerRadius, volume, loops) end

--- Create camera
---@param cameraName string cameraName
---@param fovy float fovy
---@param nearClip float nearClip
---@param farClip float farClip
---@return integer
function createCamera(cameraName, fovy, nearClip, farClip) end

--- Create character controller
---@param transformId integer transformId
---@param radius float radius
---@param height float height
---@param stepOffset float stepOffset
---@param slopeLimit float slopeLimit
---@param skinWidth float skinWidth
---@param collisionMask integer collisionMask
---@param mass float mass
---@return integer
function createCCT(transformId, radius, height, stepOffset, slopeLimit, skinWidth, collisionMask, mass) end

--- Create conditional animation
---@return integer
function createConditionalAnimation() end

--- Creates a fill plane shape based on shapeId
---@param shapeId integer shapeId
---@param shapeName string shapeName
---@param volume float volume
---@param deltaMax float deltaMax
---@param maxSurfaceAngle float maxSurfaceAngle
---@param maxPhysicalSurfaceAngle float maxPhysicalSurfaceAngle
---@param maxSurfaceDistanceError float maxSurfaceDistanceError
---@param maxSubDivEdgeLength float maxSubDivEdgeLength
---@param syncMaxSubDivEdgeLength float syncMaxSubDivEdgeLength
---@param createSidePlanes boolean createSidePlanes
---@param retessellateTop boolean retessellateTop
---@return integer
function createFillPlaneShape(shapeId, shapeName, volume, deltaMax, maxSurfaceAngle, maxPhysicalSurfaceAngle, maxSurfaceDistanceError, maxSubDivEdgeLength, syncMaxSubDivEdgeLength, createSidePlanes, retessellateTop) end

---@param foliageBendingSystemId integer
---@param minX float
---@param maxX float
---@param minZ float
---@param maxZ float
---@param yOffset float
---@param centerTransformid integer
---@return integer
function createFoliageBendingRectangle(foliageBendingSystemId, minX, maxX, minZ, maxZ, yOffset, centerTransformid) end

--- Create overlay object
---@param textureFilename string textureFilename
---@return integer
function createImageOverlay(textureFilename) end

---@param _ integer
---@return integer
function createImageOverlayWithTexture(_) end

---@param _ string
---@param _ string
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@return integer
function createLightSource(_, _, _, _, _, _) end

--- Create a loop synthesis sample object
---@param objectName string objectName
---@return integer
function createLoopSynthesisSample(objectName) end

--- Create a navigation mesh node.
---@param name string name
---@return integer
function createNavMesh(name) end

--- Create note node
---@param parentId integer Parent ID
---@param text string Text
---@param colorR float R component of note color
---@param colorG float G component of note color
---@param colorB float B component of note color
---@param fixedSize boolean Fixed size on screen
---@return integer
function createNoteNode(parentId, text, colorR, colorG, colorB, fixedSize) end

--- Create sample object
---@param objectName string objectName
---@return integer
function createSample(objectName) end

---@param _ string
---@param _ string
---@param _ float
---@param _ float
---@param _ boolean
---@return integer
function createSharedNetworkAttributes(_, _, _, _, _) end

--- Create streamed sample object
---@param objectName string objectName
---@param isBackgroundMusic boolean isBackgroundMusic
---@return integer
function createStreamedSample(objectName, isBackgroundMusic) end

--- Creates a tire track system
---@param systemId integer systemId
---@param width float width
---@param atlasIndex integer atlasIndex
---@return integer
function createTrack(systemId, width, atlasIndex) end

--- Create transform group
---@param transformName string transformName
---@return integer
function createTransformGroup(transformName) end

--- Create wheel shape
---@param transformId integer transformId
---@param positionX float positionX
---@param positionY float positionY
---@param positionZ float positionZ
---@param radius float radius
---@param suspensionTravel float suspensionTravel
---@param spring float spring
---@param damperCompressionLowSpeed float damperCompressionLowSpeed
---@param damperCompressionHighSpeed float damperCompressionHighSpeed
---@param damperCompressionLowSpeedThreshold float damperCompressionLowSpeedThreshold
---@param damperRelaxationLowSpeed float damperRelaxationLowSpeed
---@param damperRelaxationHighSpeed float damperRelaxationHighSpeed
---@param damperRelaxationLowSpeedThreshold float damperRelaxationLowSpeedThreshold
---@param mass float mass
---@param collisionMask integer collisionMask
---@param wheelShapeIndex integer wheelShapeIndex
---@return integer
function createWheelShape(transformId, positionX, positionY, positionZ, radius, suspensionTravel, spring, damperCompressionLowSpeed, damperCompressionHighSpeed, damperCompressionLowSpeedThreshold, damperRelaxationLowSpeed, damperRelaxationHighSpeed, damperRelaxationLowSpeedThreshold, mass, collisionMask, wheelShapeIndex) end

--- Create an empty XML file
---@param objectName string objectName
---@param filename string filename
---@param rootNodeName string rootNodeName
---@return integer
function createXMLFile(objectName, filename, rootNodeName) end

--- Relinquish Track Segments
---@param systemId integer systemId
---@param trackId integer trackId
function cutTrack(systemId, trackId) end

--- Delete Entity/Object
---@param objectId integer objectId
function delete(objectId) end

---@param foliageBendingSystemId integer
---@param objectId integer id of the bending object, such as returned by createFoliageBendingRectangle
function destroyFoliageBendingObject(foliageBendingSystemId, objectId) end

--- Destroys a tire track system
---@param systemId integer systemId
---@param trackId integer trackId
function destroyTrack(systemId, trackId) end

--- Disable animation track
---@param characterSetId integer characterSetId
---@param trackId integer trackId
function disableAnimTrack(characterSetId, trackId) end

--- Render an arrow. Only use for debug rendering
---@param x float x
---@param y float y
---@param z float z
---@param dirX float dirX
---@param dirY float dirY
---@param dirZ float dirZ
---@param tangX float tangX
---@param tangY float tangY
---@param tangZ float tangZ
---@param r float r
---@param g float g
---@param b float b
---@param solid boolean solid
function drawDebugArrow(x, y, z, dirX, dirY, dirZ, tangX, tangY, tangZ, r, g, b, solid) end

--- Render a line. Only use for debug rendering
---@param x0 float x0
---@param y0 float y0
---@param z0 float z0
---@param r0 float r0
---@param g0 float g0
---@param b0 float b0
---@param x1 float x1
---@param y1 float y1
---@param z1 float z1
---@param r1 float r1
---@param g1 float g1
---@param b1 float b1
---@param solid boolean solid
function drawDebugLine(x0, y0, z0, r0, g0, b0, x1, y1, z1, r1, g1, b1, solid) end

--- Render a point. Only use for debug rendering
---@param x float x
---@param y float y
---@param z float z
---@param r float r
---@param g float g
---@param b float b
---@param a float a
---@param solid boolean solid
function drawDebugPoint(x, y, z, r, g, b, a, solid) end

--- Enable animation track
---@param characterSetId integer characterSetId
---@param trackId integer trackId
function enableAnimTrack(characterSetId, trackId) end

--- Erase Segments Inside Parallelogram
---@param systemId integer systemId
---@param startWorldX float startWorldX
---@param startWorldZ float startWorldZ
---@param widthWorldX float widthWorldX
---@param widthWorldZ float widthWorldZ
---@param heightWorldX float heightWorldX
---@param heightWorldZ float heightWorldZ
function eraseParallelogram(systemId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Export all script created notes to file
---@param filePth string
function exportNoteNodes(filePth) end

--- Add material/volume to a fill plane
---@param fillPlaneId integer fillPlaneId
---@param dTvolume float dTvolume
---@param x float x
---@param y float y
---@param z float z
---@param dx1 float dx1
---@param dy1 float dy1
---@param dz1 float dz1
---@param dx2 float dx2
---@param dy2 float dy2
---@param dz2 float dz2
function fillPlaneAdd(fillPlaneId, dTvolume, x, y, z, dx1, dy1, dz1, dx2, dy2, dz2) end

--- find nearest polyline
---@param fillPlaneId integer fillPlaneId
---@param x float x
---@param z float z
---@return integer
function findPolyline(fillPlaneId, x, z) end

---@return object
function FoliageTransformGroupConstructor.new() end

---@param _ integer
---@return boolean, integer
function FoliageTransformGroupConstructor:allocateTypeIndex(_) end

---@param _ integer
---@param _ integer
---@param _ string
---@param _ string
---@return integer
function FoliageTransformGroupConstructor:createLayer(_, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:createLodForShape(_, _, _, _) end

---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:createMultiLayer(_) end

---@param _ integer
---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:createShapeForState(_, _, _) end

---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:createStateForLayer(_, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@return float, float
function FoliageTransformGroupConstructor:getAtlasOffsetForLod(_, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:getAtlasSizeForLod(_, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@return float
function FoliageTransformGroupConstructor:getBlocksPerUnitForState(_, _, _) end

---@return float
function FoliageTransformGroupConstructor:getCellSize() end

---@return integer
function FoliageTransformGroupConstructor:getDecalLayer() end

---@param _ integer
---@param _ integer
---@return integer, integer
function FoliageTransformGroupConstructor:getDensityChannelsForLayer(_, _) end

---@param _ integer
---@return integer, integer
function FoliageTransformGroupConstructor:getDensityMapInfo(_) end

---@param _ integer
---@param _ integer
---@param _ integer
---@return string, integer
function FoliageTransformGroupConstructor:getDistanceMapForState(_, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@return float, float
function FoliageTransformGroupConstructor:getHeightAndVarianceForState(_, _, _) end

---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:getMaxNumStatesForLayer(_, _) end

---@param _ integer
---@param _ integer
---@return string
function FoliageTransformGroupConstructor:getNameForLayer(_, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@return string
function FoliageTransformGroupConstructor:getNameForState(_, _, _) end

---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:getNumLayers(_) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:getNumLodsForShape(_, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:getNumShapesForState(_, _, _) end

---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:getNumStatesForLayer(_, _) end

---@return integer
function FoliageTransformGroupConstructor:getObjectMask() end

---@param _ integer
---@param _ integer
---@param _ integer
---@return float
function FoliageTransformGroupConstructor:getPositionVarianceForState(_, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@return string
function FoliageTransformGroupConstructor:getShapeForLod(_, _, _, _, _) end

---@param _ integer
---@param _ integer
---@return string
function FoliageTransformGroupConstructor:getShapeSourceForLayer(_, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@return float, float, float, float
function FoliageTransformGroupConstructor:getTexCoordsForLod(_, _, _, _, _) end

---@param _ integer
---@param _ integer
---@return integer
function FoliageTransformGroupConstructor:getTypeIndexForLayer(_, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@return float, float
function FoliageTransformGroupConstructor:getViewDistanceForLod(_, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@return float, float
function FoliageTransformGroupConstructor:getWidthAndVarianceForState(_, _, _) end

---@param _ integer
---@param _ string
---@param _ string
---@return boolean
function FoliageTransformGroupConstructor:loadFruitTypeFromXml(_, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
---@param _ float
function FoliageTransformGroupConstructor:setAtlasOffsetForLod(_, _, _, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
function FoliageTransformGroupConstructor:setAtlasSizeForLod(_, _, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
function FoliageTransformGroupConstructor:setBlocksPerUnitForState(_, _, _, _) end

---@param _ float
function FoliageTransformGroupConstructor:setCellSize(_) end

---@param _ integer
function FoliageTransformGroupConstructor:setDecalLayer(_) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
function FoliageTransformGroupConstructor:setDensityChannelsForLayer(_, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ string
---@param _ integer
function FoliageTransformGroupConstructor:setDistanceMapForState(_, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
---@param _ float
function FoliageTransformGroupConstructor:setHeightAndVarianceForState(_, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ string
function FoliageTransformGroupConstructor:setNameForState(_, _, _, _) end

---@param _ integer
function FoliageTransformGroupConstructor:setObjectMask(_) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
function FoliageTransformGroupConstructor:setPositionVarianceForState(_, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ string
function FoliageTransformGroupConstructor:setShapeForLod(_, _, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ string
function FoliageTransformGroupConstructor:setShapeSourceForLayer(_, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@param _ float
function FoliageTransformGroupConstructor:setTexCoordsForLod(_, _, _, _, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
---@param _ float
function FoliageTransformGroupConstructor:setViewDistanceForLod(_, _, _, _, _, _, _) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
---@param _ float
function FoliageTransformGroupConstructor:setWidthAndVarianceForState(_, _, _, _, _) end

--- Get all shared I3D file request ids
---@return intarray
function getAllSharedI3DFileRequestIds() end

--- Get all streaming I3D file request ids
---@return intarray
function getAllStreamI3DFileRequestIds() end

--- Get angular damping
---@param transformId integer transformId
---@return float
function getAngularDamping(transformId) end

--- Get angular velocity of transform object
---@param transformId integer transformId
---@return float, float, float
function getAngularVelocity(transformId) end

--- Get animation character set id
---@param objectId integer objectId
---@return integer
function getAnimCharacterSet(objectId) end

--- Get the duration of the clip at the given index
---@param characterSetId integer characterSetId
---@param index integer index
---@return float
function getAnimClipDuration(characterSetId, index) end

--- Return the index of the clip with the given name
---@param characterSetId integer characterSetId
---@param clipName string clipName
---@return integer
function getAnimClipIndex(characterSetId, clipName) end

--- Get number of clips
---@param characterSetId integer characterSetId
---@return integer
function getAnimNumOfClips(characterSetId) end

--- Get animation track assigned clip index number
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@return integer
function getAnimTrackAssignedClip(characterSetId, trackId) end

--- Get animation track blend weight
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@return float
function getAnimTrackBlendWeight(characterSetId, trackId) end

--- Get animation track loop state
---@param trackId integer trackId
---@param _ integer
---@return float
function getAnimTrackTime(trackId, _) end

---@param _ integer
---@return boolean
function getAudioSourceAutoPlay(_) end

---@param _ integer
---@return float
function getAudioSourceInnerRange(_) end

--- Get the AudioSource's max retrigger delay
---@param objectId integer objectId
---@return float
function getAudioSourceMaxRetriggerDelay(objectId) end

--- Get the AudioSource's min retrigger delay
---@param objectId integer objectId
---@return float
function getAudioSourceMinRetriggerDelay(objectId) end

--- Get the AudioSource's random playback state
---@param objectId integer objectId
---@return boolean
function getAudioSourceRandomPlayback(objectId) end

---@param _ integer
---@return float
function getAudioSourceRange(_) end

--- Gets the sample id of an audio source
---@param objectId integer objectId
---@return integer
function getAudioSourceSample(objectId) end

--- Get the AudioSource's sample element's probability
---@param objectId integer objectId
---@param index integer index
---@return float
function getAudioSourceSampleElementProbability(objectId, index) end

---@param _ integer
---@return boolean
function getAudioSourceTickInaudible(_) end

--- Get camera
---@return integer
function getCamera() end

--- Get can render unicode
---@param unicode integer unicode
---@return boolean
function getCanRenderUnicode(unicode) end

--- Get character controller collision flags
---@param characterIndex integer characterIndex
---@return boolean, boolean, boolean
function getCCTCollisionFlags(characterIndex) end

--- Get center of mass
---@param transformId integer transformId
---@return float, float, float
function getCenterOfMass(transformId) end

--- Get child id
---@param objectId integer objectId
---@param childName string childName
---@return integer
function getChild(objectId, childName) end

--- Get child id at given index
---@param objectId integer objectId
---@param index integer index
---@return integer
function getChildAt(objectId, index) end

--- Get child index
---@param objectId integer objectId
---@return integer
function getChildIndex(objectId) end

--- Get object clip distance
---@param objectId integer objectId
---@return float
function getClipDistance(objectId) end

---@param _ integer
---@return float, float
function getClipDistancesWithLOD(_) end

--- Get closest world space position and time on spline to given world space position
---@param shapeId integer
---@param worldX float
---@param worldY float
---@param worldZ float
---@param eps float acceptable world space error
---@return float, float, float, float
function getClosestSplinePosition(shapeId, worldX, worldY, worldZ, eps) end

--- Get collision mask
---@param transformId integer transformId
---@return integer
function getCollisionMask(transformId) end

--- Get boolean value
---@param conditionalAnimationId integer conditionalAnimationId
---@param parameterId integer parameterId
---@return boolean
function getConditionalAnimationBoolValue(conditionalAnimationId, parameterId) end

--- Get float value
---@param conditionalAnimationId integer conditionalAnimationId
---@param parameterId integer parameterId
---@return float
function getConditionalAnimationFloatValue(conditionalAnimationId, parameterId) end

--- Get time
---@param conditionalAnimationId integer
---@return float
function getConditionalAnimationTime(conditionalAnimationId) end

--- Get current master volume
---@return float
function getCurrentMasterVolume() end

--- Get associated transform group from a given dataplane
---@param dataPlaneId integer dataplane ID
---@return integer
function getDataPlaneAssociatedTransformGroup(dataPlaneId) end

--- Get density
---@param transformId integer transformId
---@return float
function getDensity(transformId) end

--- Get density at world position
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
---@return integer
function getDensityAtWorldPos(transformId, x, y, z) end

--- Get height of the density map at the world position
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
---@return float, float
function getDensityHeightAtWorldPos(transformId, x, y, z) end

--- Get density map file name
---@param transformId integer transformId
---@return integer
function getDensityMapSize(transformId) end

---@param densityMapSyncer integer id
---@param densityMap integer id
---@param worldX float world X coordinate
---@param worldZ float world Z coordinate
---@return integer, integer, boolean
function getDensityMapSyncerCellIndicesAtWorldPosition(densityMapSyncer, densityMap, worldX, worldZ) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@return float, float, float
function getDensityNormalAtWorldPos(_, _, _, _) end

--- Get density region
---@param transformId integer transformId
---@param x float x
---@param z float z
---@param width float width
---@param height float height
---@param firstChannel integer firstChannel
---@param numChannels integer numChannels
---@return integer
function getDensityRegion(transformId, x, z, width, height, firstChannel, numChannels) end

--- Get density region world
---@param transformId integer transformId
---@param x float x
---@param z float z
---@param width float width
---@param height float height
---@param firstChannel integer firstChannel
---@param numChannels integer numChannels
---@return integer
function getDensityRegionWorld(transformId, x, z, width, height, firstChannel, numChannels) end

---@param _ integer
---@return float, float
function getEffectiveClipDistancesWithLOD(_) end

---@param _ integer
---@return boolean
function getEffectiveVisibility(_) end

--- Get emitter starting time.
---@param particleSystemId integer particleSystemId
---@return float
function getEmitStartTime(particleSystemId) end

--- Get emitter stop time.
---@param particleSystemId integer particleSystemId
---@return float
function getEmitStopTime(particleSystemId) end

--- Returns the emitter shape of the particle system
---@param particleSystemId integer particleSystemId
---@return integer
function getEmitterShape(particleSystemId) end

--- Returns the emitter shape velocity scale of the particle system
---@param particleSystemId integer particleSystemId
---@return float
function getEmitterShapeVelocityScale(particleSystemId) end

--- Get the far clip distance
---@param cameraId integer cameraId
---@return float
function getFarClip(cameraId) end

--- Get the fill plane height at a specific position
---@param fillPlaneId integer fillPlaneId
---@param x float x
---@param z float z
---@return float
function getFillPlaneHeightAtLocalPos(fillPlaneId, x, z) end

---@param foliageBendingSystemId integer
---@param rectangleId integer
---@return float, float, float, float, float
function getFoliageBendingRectangleAttributes(foliageBendingSystemId, rectangleId) end

--- Get foliage transform group from foliage name
---@param terrainId integer terrainId
---@param detailName string detailName
---@return integer
function getFoliageTransformGroupIdByFoliageName(terrainId, detailName) end

--- Get the vertical field of view angle
---@param cameraId integer id of the camera
---@return float
function getFovY(cameraId) end

--- Get joystick/gamepad axis label
---@param axisNumber integer axisNumber
---@param gamepadIndex integer gamepadIndex
---@return string
function getGamepadAxisLabel(axisNumber, gamepadIndex) end

---@param _ integer
---@param _ integer
---@return string
function getGamepadAxisPhysicalName(_, _) end

--- Get joystick/gamepad button label
---@param buttonNumber integer buttonNumber
---@param gamepadIndex integer gamepadIndex
---@return string
function getGamepadButtonLabel(buttonNumber, gamepadIndex) end

---@param _ integer
---@param _ integer
---@return string
function getGamepadButtonPhysicalName(_, _) end

---@param _ integer
---@param _ integer
---@param _ float
---@return integer, boolean
function getGamepadMappedUnknownAxis(_, _, _) end

---@param _ integer
---@param _ integer
---@return integer
function getGamepadMappedUnknownButton(_, _) end

--- Get name of joystick/gamepad
---@param gamepadIndex integer gamepadIndex
---@return string
function getGamepadName(gamepadIndex) end

---@param _ integer
---@return integer
function getGamepadProductId(_) end

---@param _ integer
---@return integer
function getGamepadVendorId(_) end

---@param _ integer
---@return integer
function getGamepadVersionId(_) end

--- Get shape geometry id
---@param shapeId integer shapeId
---@return integer
function getGeometry(shapeId) end

--- Get has class id
---@param objectId integer objectId
---@param classId integer classId
---@return boolean
function getHasClassId(objectId, classId) end

--- Get has shader parameter
---@param shapeId integer shapeId
---@param parameterName string parameterName
---@return boolean
function getHasShaderParameter(shapeId, parameterName) end

--- Get existence of a touchpad - this is dynamic
---@return boolean
function getHasTouchpad() end

--- Get has trigger flag
---@param objectId integer objectId
---@return boolean
function getHasTrigger(objectId) end

--- Get joystick/gamepad axis value
---@param axisNumber integer axisNumber
---@param gamepadIndex integer gamepadIndex
---@return float
function getInputAxis(axisNumber, gamepadIndex) end

--- Get joystick/gamepad button value
---@param buttonNumber integer buttonNumber
---@param gamepadIndex integer gamepadIndex
---@return float
function getInputButton(buttonNumber, gamepadIndex) end

---@param _ integer
---@return boolean
function getIsCompound(_) end

---@param _ integer
---@return boolean
function getIsCompoundChild(_) end

---@param _ integer
---@return boolean
function getIsGamepadMappingReliable(_) end

--- Get transform object locked group flag
---@param transformId integer transformId
---@return boolean
function getIsLockedGroup(transformId) end

--- Get if shape is non-renderable
---@param shapeId integer shapeId
---@return boolean
function getIsNonRenderable(shapeId) end

---@param _ integer
---@return boolean
function getIsOrthographic(_) end

--- Checks if given spline has closed form
---@param shapeId integer shapeId
---@return boolean
function getIsSplineClosed(shapeId) end

--- Get levenshtein distance
---@param value1 string value1
---@param value2 string value2
---@return integer
function getLevenshteinDistance(value1, value2) end

--- Returns whether the light source casts a shadow or not.
---@param lightId integer lightId
---@return boolean
function getLightCastingShadowMap(lightId) end

--- Get range of a light
---@param lightId integer lightId
---@return float
function getLightRange(lightId) end

---@param _ integer
---@return float, float, float
function getLightScatteringDirection(_) end

--- Get light type
---@param lightId integer lightId
---@return integer
function getLightType(lightId) end

--- Get linear damping
---@param transformId integer transformId
---@return float
function getLinearDamping(transformId) end

--- Get linear velocity of transform object
---@param transformId integer transformId
---@return float, float, float
function getLinearVelocity(transformId) end

--- Get closest world space position and time on spline to given world space position
---@param shapeId integer shapeId
---@param time float
---@param timeRange float
---@param worldX float
---@param worldY float
---@param worldZ float
---@param eps float world space error
---@return float, float, float, float
function getLocalClosestSplinePosition(shapeId, time, timeRange, worldX, worldY, worldZ, eps) end

--- Get local linear velocity of transform object
---@param transformId integer transformId
---@return float, float, float
function getLocalLinearVelocity(transformId) end

--- Returns the LOD transform group that this transform group belongs to
---@param transformId integer transformId is either a shape, an audio source or a light source
---@return integer
function getLODTransformGroup(transformId) end

--- Get mass
---@param transformId integer transformId
---@return float
function getMass(transformId) end

--- Get master volume
---@return float
function getMasterVolume() end

--- Get material by index
---@param shapeId integer shapeId
---@param materialIdx integer materialIdx
---@return integer
function getMaterial(shapeId, materialIdx) end

---@param materialId integer
---@return string
function getMaterialCustomShaderFilename(materialId) end

---@param materialId integer
---@return string
function getMaterialCustomShaderVariation(materialId) end

---@param materialId integer
---@return string
function getMaterialDiffuseMapFilename(materialId) end

---@param materialId integer
---@return boolean
function getMaterialDiffuseMapHasAlpha(materialId) end

---@param materialId integer
---@return string
function getMaterialEmissiveMapFilename(materialId) end

---@param materialId integer
---@return boolean
function getMaterialEmissiveMapHasAlpha(materialId) end

---@param materialId integer
---@return string
function getMaterialGlossMapFilename(materialId) end

---@param materialId integer
---@return boolean
function getMaterialHasRefractionMap(materialId) end

---@param materialId integer
---@return boolean
function getMaterialIsAlphaBlended(materialId) end

---@param materialId integer
---@return boolean
function getMaterialIsAlphaTested(materialId) end

---@param materialId integer
---@return string
function getMaterialNormalMapFilename(materialId) end

---@param materialId integer
---@return integer
function getMaterialNormalMapFormat(materialId) end

---@param materialId integer
---@return float
function getMaterialReflectionMapScaling(materialId) end

--- Get minimum clip distance
---@param objectId integer objectId
---@return float
function getMinClipDistance(objectId) end

--- Set vehicle properties
---@param transformId integer transformId
---@return float, float, float
function getMotorRotationSpeed(transformId) end

---@param _ integer
---@return float, float, float
function getMotorTorque(_) end

--- Get object name
---@param objectId integer objectId
---@return string
function getName(objectId) end

--- Set the near clip distance
---@param cameraId integer cameraId
---@return float
function getNearClip(cameraId) end

--- Get note node text
---@param noteId integer Id of the note node
---@return string
function getNoteNodeText(noteId) end

--- Get the number of sample elements for an AudioSource
---@param objectId integer objectId
---@return integer
function getNumOfAudioSourceSampleElements(objectId) end

--- Get number of children
---@param objectId integer objectId
---@return integer
function getNumOfChildren(objectId) end

--- Get number of joysticks/gamepads
---@return integer
function getNumOfGamepads() end

--- Get number of materials
---@param shapeId integer shapeId
---@return integer
function getNumOfMaterials(shapeId) end

---@param shapeId integer shapeId
---@return integer
function getNumOfShapeBones(shapeId) end

--- Gets the number of shared I3d files
---@return integer
function getNumOfSharedI3DFiles() end

--- Get number of user attributes
---@param objectId integer objectId
---@return integer
function getNumUserAttribute(objectId) end

--- Get object mask
---@param objectId integer objectId
---@return integer
function getObjectMask(objectId) end

---@param _ integer
---@return float
function getOrthographicHeight(_) end

--- Get parent id
---@param objectId integer objectId
---@return integer
function getParent(objectId) end

--- Get particle system average speed.
---@param particleSystemId integer particleSystemId
---@return float, float
function getParticleSystemAverageSpeed(particleSystemId) end

--- Get particle system life span.
---@param particleSystemId integer particleSystemId
---@return float
function getParticleSystemLifespan(particleSystemId) end

---@param _ integer
---@return float
function getParticleSystemSpeed(_) end

---@param _ integer
---@return float, float
function getProjectionOffset(_) end

--- gets quaternion
---@param objectId integer objectId
---@return float, float, float, float
function getQuaternion(objectId) end

--- Get rigid body type
---@param transformId integer transformId
---@return integer
function getRigidBodyType(transformId) end

--- Get root node
---@return integer
function getRootNode() end

--- Get rotation of a transform object
---@param transformId integer transformId
---@return float, float, float
function getRotation(transformId) end

--- Get sample duration
---@param sampleId integer sampleId
---@return float
function getSampleDuration(sampleId) end

--- Get the loop synthesis sample load factor currently played
---@param sampleId integer sampleId
---@return float
function getSampleLoopSynthesisLoadFactor(sampleId) end

--- Get the loop synthesis sample max RPM
---@param sampleId integer sampleId
---@return float
function getSampleLoopSynthesisMaxRPM(sampleId) end

--- Get the loop synthesis sample min RPM
---@param sampleId integer sampleId
---@return float
function getSampleLoopSynthesisMinRPM(sampleId) end

--- Get the loop synthesis sample RPM currently played
---@param sampleId integer sampleId
---@param useNormalizedValue boolean If true, return normalized value between ; else return real range value.
---@return float
function getSampleLoopSynthesisRPM(sampleId, useNormalizedValue) end

--- Get the loop synthesis sample start sound duration
---@param sampleId integer sampleId
---@return float
function getSampleLoopSynthesisStartDuration(sampleId) end

--- Get the loop synthesis sample stop sound duration
---@param sampleId integer sampleId
---@return float
function getSampleLoopSynthesisStopDuration(sampleId) end

--- Get the loop synthesis sample target load factor
---@param sampleId integer sampleId
---@return float
function getSampleLoopSynthesisTargetLoadFactor(sampleId) end

--- Get the loop synthesis sample target RPM
---@param sampleId integer sampleId
---@param useNormalizedValue boolean If true, return normalized value between ; else return real range value.
---@return float
function getSampleLoopSynthesisTargetRPM(sampleId, useNormalizedValue) end

--- Set sample pitch
---@param sampleId integer sampleId
---@return float
function getSamplePitch(sampleId) end

--- Get sample play offset
---@param sampleId integer sampleId
---@return float
function getSamplePlayOffset(sampleId) end

---@param _ integer
---@return float
function getSamplePlayTimeLeft(_) end

--- Get velocity of a sample object
---@param sampleId integer sampleId
---@return float, float, float
function getSampleVelocity(sampleId) end

--- Get sample volume
---@param sampleId integer sampleId
---@return float
function getSampleVolume(sampleId) end

--- Get scale of a transform object
---@param transformId integer transformId
---@return float, float, float
function getScale(transformId) end

--- Get shader parameter
---@param shapeId integer shapeId
---@param parameterName string parameterName
---@return float, float, float, float
function getShaderParameter(shapeId, parameterName) end

---@param shapeId integer
---@param boneIndex integer
---@return integer
function getShapeBone(shapeId, boneIndex) end

--- Returns bounding sphere of shape
---@param shapeId integer shapeId
---@return float, float, float, float
function getShapeBoundingSphere(shapeId) end

--- Get if shape is marked as CPU mesh
---@param shapeId integer shapeId
---@return boolean
function getShapeIsCPUMesh(shapeId) end

--- Get if shape is skinned
---@param shapeId integer shapeId
---@return boolean, boolean
function getShapeIsSkinned(shapeId) end

--- Get shared I3D file progress information
---@param requestId integer request id from streamSharedI3DFile
---@return string, float, string, string, object, object
function getSharedI3DFileProgressInfo(requestId) end

--- Gets the number references a shared I3D file has
---@param filename string
---@return integer
function getSharedI3DFileRefCount(filename) end

--- Get spline control vertex
---@param shapeId integer shapeId
---@param index integer index
---@return float, float, float
function getSplineCV(shapeId, index) end

--- Get spline direction
---@param shapeId integer shapeId
---@param time float time
---@return float, float, float
function getSplineDirection(shapeId, time) end

--- Get spline edit point
---@param shapeId integer shapeId
---@param index integer index
---@return float, float, float
function getSplineEP(shapeId, index) end

--- Get spline length
---@param shapeId integer shapeId
---@return float
function getSplineLength(shapeId) end

--- Get number of spline control vertices
---@param shapeId integer shapeId
---@return integer
function getSplineNumOfCV(shapeId) end

--- Get spline orientation
---@param shapeId integer shapeId
---@param time float time
---@param upDirX float upDirX
---@param upDirY float upDirY
---@param upDirZ float upDirZ
---@return float, float, float
function getSplineOrientation(shapeId, time, upDirX, upDirY, upDirZ) end

--- Get spline position
---@param shapeId integer shapeId
---@param time float time
---@return float, float, float
function getSplinePosition(shapeId, time) end

--- Get world space position and time on spline that has the given world space distance to the position on the spline at the given
---@param shapeId integer shapeId
---@param time float
---@param distance float
---@param positiveTimeOffset boolean search in positive or negative direction of t
---@param eps float world space
---@return float, float, float, float
function getSplinePositionWithDistance(shapeId, time, distance, positiveTimeOffset, eps) end

--- Get split type
---@param shapeId integer shapeId
---@return integer
function getSplitType(shapeId) end

--- Get streamed sample volume
---@param sampleId integer sampleId
---@return float
function getStreamedSampleVolume(sampleId) end

--- Get streaming I3D file progress information
---@param requestId integer request id from streamI3DFile
---@return string, float, string, string, object, object
function getStreamI3DFileProgressInfo(requestId) end

--- Get terrain attributes at world pos
---@param terrainId integer terrainId
---@param x float x
---@param y float y
---@param z float z
---@param xComb boolean xComb
---@param yComb boolean yComb
---@param zComb boolean zComb
---@param wComb boolean wComb
---@param uComb boolean uComb
---@return float, float, float, float, float
function getTerrainAttributesAtWorldPos(terrainId, x, y, z, xComb, yComb, zComb, wComb, uComb) end

--- Get terrain data plane by name
---@param terrainId integer terrainId
---@param detailName string detailName
---@return integer
function getTerrainDataPlaneByName(terrainId, detailName) end

--- Get terrain detail by name
---@param terrainId integer terrainId
---@param detailName string detailName
---@return integer
function getTerrainDetailByName(terrainId, detailName) end

--- Get terrain detail name
---@param terrainId integer terrainId
---@return string
function getTerrainDetailName(terrainId) end

--- Get number of terrain detail channels
---@param terrain integer id terrain id
---@return integer
function getTerrainDetailNumChannels(terrain) end

--- Get density map type ID for terrain detail
---@param terrainId integer terrain id
---@return integer
function getTerrainDetailTypeIndex(terrainId) end

--- Get terrain height at world pos
---@param terrainId integer terrainId
---@param x float x
---@param y float y
---@param z float z
---@return float
function getTerrainHeightAtWorldPos(terrainId, x, y, z) end

--- Get terrain normal at world pos
---@param terrainId integer terrainId
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float
function getTerrainNormalAtWorldPos(terrainId, x, y, z) end

---@param _ integer
---@return string
function getTerrainOccludersCacheFilename(_) end

--- Get terrain size
---@param terrainId integer terrainId
---@return float
function getTerrainSize(terrainId) end

---@param _ float
---@param _ string
---@return float, integer
function getText3DHeight(_, _) end

---@param _ float
---@param _ string
---@param _ integer
---@return integer
function getText3DLength(_, _, _) end

---@param _ float
---@param _ string
---@param _ float
---@return integer
function getText3DLineLength(_, _, _) end

---@param _ float
---@param _ string
---@return float
function getText3DWidth(_, _) end

--- Get text height
---@param fontSize float fontSize
---@param utf8string string utf8string
---@return float, integer
function getTextHeight(fontSize, utf8string) end

--- Get text length
---@param fontSize float fontSize
---@param utf8string string utf8string
---@param maxNumLines integer maxNumLines
---@return integer
function getTextLength(fontSize, utf8string, maxNumLines) end

--- Get text length
---@param fontSize float fontSize
---@param utf8string string utf8string
---@param maxWidth float maxWidth
---@return integer
function getTextLineLength(fontSize, utf8string, maxWidth) end

--- Get text width
---@param fontSize float fontSize
---@param utf8string string utf8string
---@return float
function getTextWidth(fontSize, utf8string) end

--- Get spline time of the control vertex with the given index
---@param shapeId integer shapeId
---@param index integer index
---@return float
function getTimeAtSplineCV(shapeId, index) end

--- Get translation of a transform object
---@param transformId integer transformId
---@return float, float, float
function getTranslation(transformId) end

---@param _ integer
---@return boolean
function getUseLightScattering(_) end

--- Get user attribute value
---@param objectId integer objectId
---@param attributeName string attributeName
---@return any
function getUserAttribute(objectId, attributeName) end

--- Get user attribute value by index
---@param objectId integer objectId
---@param attributeIndex integer attributeIndex
---@return any, string
function getUserAttributeByIndex(objectId, attributeIndex) end

--- Get velocity at local position of transform object
---@param transformId integer transformId
---@param positionX float positionX
---@param positionY float positionY
---@param positionZ float positionZ
---@return float, float, float
function getVelocityAtLocalPos(transformId, positionX, positionY, positionZ) end

--- Get velocity at world position of transform object
---@param transformId integer transformId
---@param positionX float positionX
---@param positionY float positionY
---@param positionZ float positionZ
---@return float, float, float
function getVelocityAtWorldPos(transformId, positionX, positionY, positionZ) end

--- Get transform object visibility
---@param transformId integer transformId
---@return boolean
function getVisibility(transformId) end

--- Get volume, only for dynamic and kinematic shapes, 0 otherwise
---@param transformId integer transformId
---@return float
function getVolume(transformId) end

--- Get wheel shape axle speed
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@return float
function getWheelShapeAxleSpeed(transformId, wheelShapeIndex) end

--- Get wheel shape contact force
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@return float
function getWheelShapeContactForce(transformId, wheelShapeIndex) end

--- Get wheel shape contact normal
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@return float, float, float
function getWheelShapeContactNormal(transformId, wheelShapeIndex) end

--- Get wheel shape contact object
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@return integer, integer
function getWheelShapeContactObject(transformId, wheelShapeIndex) end

--- Get wheel shape contact point
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@return float, float, float, float
function getWheelShapeContactPoint(transformId, wheelShapeIndex) end

--- Get wheel shape contact point
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@return float, float, float, float, float
function getWheelShapePosition(transformId, wheelShapeIndex) end

--- Get wheel shape slip
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@return float, float
function getWheelShapeSlip(transformId, wheelShapeIndex) end

--- Gets world quaternion
---@param objectId integer objectId
---@return float, float, float, float
function getWorldQuaternion(objectId) end

--- Get world rotation of a transform object
---@param transformId integer transformId
---@return float, float, float
function getWorldRotation(transformId) end

--- Get world translation of a transform object
---@param transformId integer transformId
---@return float, float, float
function getWorldTranslation(transformId) end

--- Get XML file boolean attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@return boolean
function getXMLBool(xmlId, attributePath) end

--- Get XML filename
---@param xmlId integer xmlId
---@return string
function getXMLFilename(xmlId) end

--- Get XML file float attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@return float
function getXMLFloat(xmlId, attributePath) end

--- Get XML file integer attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@return integer
function getXMLInt(xmlId, attributePath) end

--- Get XML file string attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@return string
function getXMLString(xmlId, attributePath) end

--- Returns if an XML element at given path is present. For checking the presence of xml attributes use 'getXMLString ~= nil' instead
---@param xmlId integer xmlId
---@param xmlElementPath string Path to an xml element
---@return boolean
function hasXMLProperty(xmlId, xmlElementPath) end

--- Init animations
---@param conditionalAnimationId integer conditionalAnimationId
---@param charsetNodeId integer character set node id
---@param xmlFilePath string xmlFilePath
---@param baseNodeName string baseNodeName
function initConditionalAnimation(conditionalAnimationId, charsetNodeId, xmlFilePath, baseNodeName) end

--- Makes sure the bounding volume of the shape is up to date with the geometry bounding volume.
--- This needs to be called after changing the bounding volume of the geometry if the bounding volume of the shape is not invalidated otherwise
---@param shapeId integer
function invalidateShapeBoundingVolume(shapeId) end

--- Is clip assigned to animation track
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@return boolean
function isAnimTrackClipAssigned(characterSetId, trackId) end

--- Is animation track enabled
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@return boolean
function isAnimTrackEnabled(characterSetId, trackId) end

--- Is sample playing
---@param sampleId integer
---@return boolean
function isSamplePlaying(sampleId) end

---@return object
function JointConstructor.new() end

--- Set joint actors
---@param actor1Id integer actor1Id
---@param actor2Id integer actor2Id
function JointConstructor:setActors(actor1Id, actor2Id) end

--- Set joint transforms
---@param jointNode1 integer jointNode1
---@param jointNode2 integer jointNode2
function JointConstructor:setJointTransforms(jointNode1, jointNode2) end

--- Link node to another node
---@param parentNodeId integer parentNodeId
---@param childNodeId integer childNodeId
---@param index integer index
function link(parentNodeId, childNodeId, index) end

--- Load I3D file
---@param filename string filename
---@param addPhysics boolean addPhysics
---@param callOnCreate boolean callOnCreate
---@param verbose boolean verbose
---@return integer, integer
function loadI3DFile(filename, addPhysics, callOnCreate, verbose) end

--- Load sample object
---@param sampleId integer sampleId
---@param sampleFilename string sampleFilename
---@param b3DSound boolean b3DSound
---@return boolean
function loadSample(sampleId, sampleFilename, b3DSound) end

--- Load shared I3D file. If another shared stream request is still pending for the same i3d, the call blocks until this request is finished
---@param filename string filename
---@param addPhysics boolean addPhysics
---@param callOnCreate boolean callOnCreate
---@param verbose boolean verbose
---@return integer, integer, integer
function loadSharedI3DFile(filename, addPhysics, callOnCreate, verbose) end

--- Load streamed sample object
---@param sampleId integer sampleId
---@param bgmusicFilename string bgmusicFilename
---@return boolean
function loadStreamedSample(sampleId, bgmusicFilename) end

--- Load XML file
---@param objectName string objectName
---@param filename string filename
---@return integer
function loadXMLFile(objectName, filename) end

--- Load XML file from memory
---@param objectName string objectName
---@param content string content
---@return integer
function loadXMLFileFromMemory(objectName, content) end

--- Local space to local space transformation, only direction without translation
---@param transformId integer transformId
---@param targetTransformId integer targetTransformId
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float
function localDirectionToLocal(transformId, targetTransformId, x, y, z) end

--- Local space to world space transformation, only direction without translation
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float
function localDirectionToWorld(transformId, x, y, z) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@return float, float, float
function localRotationToWorld(_, _, _, _) end

--- Local space to local space transformation
---@param transformId integer transformId
---@param targetTransformId integer targetTransformId
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float
function localToLocal(transformId, targetTransformId, x, y, z) end

--- Local space to world space transformation
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float
function localToWorld(transformId, x, y, z) end

---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@return float, float, float
function mathEulerRotateVector(_, _, _, _, _, _) end

--- Euler angle to quaternion
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float, float
function mathEulerToQuaternion(x, y, z) end

---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@return float, float, float
function mathQuaternionRotateVector(_, _, _, _, _, _, _) end

--- Enqueue character movement
---@param characterIndex integer characterIndex
---@param x float x
---@param y float y
---@param z float z
---@param collisionMasks integer collisionMasks
function moveCCT(characterIndex, x, y, z, collisionMasks) end

--- Overlap box objects
---@param x float x
---@param y float y
---@param z float z
---@param rx float rx
---@param ry float ry
---@param rz float rz
---@param ex float ex
---@param ey float ey
---@param ez float ez
---@param overlapFunctionCallback string function )
---@param targetObject object targetObject
---@param collisionMask integer collisionMask
---@param includeDynamics boolean includeDynamics
---@param includeStatics boolean includeStatics
---@param exactTest boolean exactTest
---@param async boolean if true, callback will be called in the next frame and calculations will be done in a background thread
---@return integer
function overlapBox(x, y, z, rx, ry, rz, ex, ey, ez, overlapFunctionCallback, targetObject, collisionMask, includeDynamics, includeStatics, exactTest, async) end

--- Overlap with an arbitrary convex mesh
---@param shapeId integer
---@param overlapFunctionCallback string function )
---@param targetObject object targetObject
---@param collisionMask integer collisionMask
---@param includeDynamics boolean includeDynamics
---@param includeStatics boolean includeStatics
---@param exactTest boolean exactTest
---@param async boolean if true, callback will be called in the next frame and calculations will be done in a background thread
---@return integer
function overlapConvex(shapeId, overlapFunctionCallback, targetObject, collisionMask, includeDynamics, includeStatics, exactTest, async) end

--- Overlap sphere objects
---@param x float x
---@param y float y
---@param z float z
---@param radius float radius
---@param overlapFunctionCallback string function )
---@param targetObject object targetObject
---@param collisionMask integer collisionMask
---@param includeDynamics boolean includeDynamics
---@param includeStatics boolean includeStatics
---@param exactTest boolean exactTest
---@param async boolean if true, callback will be called in the next frame and calculations will be done in a background thread
---@return integer
function overlapSphere(x, y, z, radius, overlapFunctionCallback, targetObject, collisionMask, includeDynamics, includeStatics, exactTest, async) end

--- Pause streamed sample object
---@param sampleId integer sampleId
function pauseStreamedSample(sampleId) end

--- Pin a shared I3D file into the cache, so it's not auto-deleted
---@param filename string filename
---@param verbose boolean verbose
function pinSharedI3DFileInCache(filename, verbose) end

--- Play sample object
---@param sampleId integer sampleId
---@param loops integer loops
---@param volume float volume
---@param offset float offset to start playing
---@param delay float delay until to start playing
---@param playAfterSample integer optionally wait until playAfterSample has finished playing
function playSample(sampleId, loops, volume, offset, delay, playAfterSample) end

--- Play streamed sample object
---@param sampleId integer sampleId
---@param _repeat integer repeat
function playStreamedSample(sampleId, _repeat) end

--- Print to console
---@param arg1 any arg1
---@param arg2 any arg2
---@param arg3 any arg3
---@param arg4 any arg4
---@param arg5 any arg5
---@param arg6 any arg6
---@param arg7 any arg7
---@param arg8 any arg8
function print(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) end

--- print callstack
function printCallstack() end

--- Print error to console
---@param arg1 any arg1
---@param arg2 any arg2
---@param arg3 any arg3
---@param arg4 any arg4
---@param arg5 any arg5
---@param arg6 any arg6
---@param arg7 any arg7
---@param arg8 any arg8
function printError(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) end

--- Print warning to console
---@param arg1 any arg1
---@param arg2 any arg2
---@param arg3 any arg3
---@param arg4 any arg4
---@param arg5 any arg5
---@param arg6 any arg6
---@param arg7 any arg7
---@param arg8 any arg8
function printWarning(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) end

--- Transform vector from world space into screen space
---@param wx float wx
---@param wy float wy
---@param wz float wz
---@return float, float, float
function project(wx, wy, wz) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@return float, float, float
function projectToCamera(_, _, _, _, _) end

--- Raycast objects, see raycast callback function
---@param x float x
---@param y float y
---@param z float z
---@param nx float nx
---@param ny float ny
---@param nz float nz
---@param raycastFunctionCallback string raycastFunctionCallback
---@param maxDistance float maxDistance
---@param targetObject object targetObject
---@param collisionMask integer collisionMask
---@param generateNormal boolean generateNormal
---@param async boolean if true, callback will be called in the next frame and calculations will be done in a background thread. In Async mode, the return value has no meaning and if no hit is found, the callback is called once with 0 ids.
---@return integer
function raycastAll(x, y, z, nx, ny, nz, raycastFunctionCallback, maxDistance, targetObject, collisionMask, generateNormal, async) end

--- Raycast closest object, see raycast callback function
---@param x float x
---@param y float y
---@param z float z
---@param nx float nx
---@param ny float ny
---@param nz float nz
---@param raycastFunctionCallback string raycastFunctionCallback boolean continueReporting
---@param maxDistance float maxDistance
---@param targetObject object targetObject
---@param collisionMask integer collisionMask
---@param generateNormal boolean generateNormal
---@param async boolean if true, callback will be called in the next frame and calculations will be done in a background thread. In Async mode, the return value has no meaning and if no hit is found, the callback is called once with 0 ids.
---@return integer
function raycastClosest(x, y, z, nx, ny, nz, raycastFunctionCallback, maxDistance, targetObject, collisionMask, generateNormal, async) end

--- Write fill plane surface information to stream
---@param fillPlaneId integer fillPlaneId
---@param streamId integer streamId
---@param totalVolume float total volume of the fill plane
---@return boolean
function readFillPlaneFromStream(fillPlaneId, streamId, totalVolume) end

---@param _ integer
---@param _ integer
function readTerrainUpdateStream(_, _) end

--- Reduces the ref count of the given shared i3d. Must be called for every successfull loadSharedI3DFile and streamSharedI3DFile call to avoid memory leaks.
---@param requestId integer stream I3D request ID
---@param warnIfInvalid boolean print a warning if the request ID is invalid
function releaseSharedI3DFile(requestId, warnIfInvalid) end

--- remove all differential
---@param transformId integer transformId
function removeAllDifferentials(transformId) end

--- Remove a sample elements from an AudioSource
---@param objectId integer objectId
---@param sampleElementIndex integer sampleElementIndex
function removeAudioSourceSampleElement(objectId, sampleElementIndex) end

--- Remove character controller
---@param characterIndex integer characterIndex
function removeCCT(characterIndex) end

--- Remove from physics
---@param transformId integer transformId
function removeFromPhysics(transformId) end

---@param _ integer
---@param _ integer
function removeTerrainUpdateConnection(_, _) end

--- Remove user attribute value
---@param objectId integer objectId
---@param attributeName string name of the attribute to remove
function removeUserAttribute(objectId, attributeName) end

--- Remove XML property.
---@param xmlId integer xmlId
---@param xmlPath string Path to element or attribute
---@return boolean
function removeXMLProperty(xmlId, xmlPath) end

--- Render overlay
---@param overlayId integer overlayId
---@param x float x
---@param y float y
---@param width float width
---@param height float height
function renderOverlay(overlayId, x, y, width, height) end

--- Render text to viewport. See 'asciiToUtf8' to convert to utf8
---@param x float x
---@param y float y
---@param size float size
---@param str string str
function renderText(x, y, size, str) end

---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ string
function renderText3D(_, _, _, _, _, _, _, _) end

---@param _ string
---@return string
function replaceUnrenderableCharacters(_) end

--- Resets the start timer of emitted particles.
---@param particleSystemId integer particleSystemId
---@param time float scale time scale
function resetEmitStartTimer(particleSystemId, time) end

--- Resets the stop timer of emitted particles.
---@param particleSystemId integer particleSystemId
---@param time float scale time scale
function resetEmitStopTimer(particleSystemId, time) end

--- Resets the counter of emitted particles. This is used if the maxEmit attribute is set for the particle system.
---@param particleSystemId integer particleSystemId
function resetNumOfEmittedParticles(particleSystemId) end

--- Resume streamed sample
---@param sampleId integer sampleId
function resumeStreamedSample(sampleId) end

--- Rotate about local axis
---@param transformId integer transformId
---@param rotation float rotation
---@param x float x
---@param y float y
---@param z float z
function rotateAboutLocalAxis(transformId, rotation, x, y, z) end

---@param _ integer
---@param _ string
---@return boolean
function saveTerrainOccludersCache(_, _) end

--- Save XML file
---@param xmlId integer xmlId
---@return boolean
function saveXMLFile(xmlId) end

--- Save XML file to memory
---@param xmlId integer xmlId
---@return string
function saveXMLFileToMemory(xmlId) end

--- Set mask for 2d rendering
---@param textureId integer
---@param maskAlphaOnly boolean if true, applies the mask to the alpha channel only, otherwise to all 4 channels
---@param x float x position
---@param y float y position
---@param width float
---@param height float
function set2DMaskFromOverlay(textureId, maskAlphaOnly, x, y, width, height) end

--- Set mask for 2d rendering
---@param textureId integer
---@param maskAlphaOnly boolean if true, applies the mask to the alpha channel only, otherwise to all 4 channels
---@param x float x position
---@param y float y position
---@param width float
---@param height float
function set2DMaskFromTexture(textureId, maskAlphaOnly, x, y, width, height) end

--- Set angular damping
---@param transformId integer transformId
---@param angularDamping float angularDamping
function setAngularDamping(transformId, angularDamping) end

--- Set angular velocity of transform object
---@param transformId integer transformId
---@param velocityX float velocityX
---@param velocityY float velocityY
---@param velocityZ float velocityZ
function setAngularVelocity(transformId, velocityX, velocityY, velocityZ) end

--- Set animation track blend weight
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@param weight float weight
function setAnimTrackBlendWeight(characterSetId, trackId, weight) end

--- Set animation track loop state
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@param loopState boolean loopState
function setAnimTrackLoopState(characterSetId, trackId, loopState) end

--- Set animation track speed scale
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@param speedScale float speedScale
function setAnimTrackSpeedScale(characterSetId, trackId, speedScale) end

--- Set animation track time
---@param characterSetId integer characterSetId
---@param trackId integer trackId
---@param time float time
---@param immediateUpdate boolean immediateUpdate
function setAnimTrackTime(characterSetId, trackId, time, immediateUpdate) end

--- Set audio culling world properties
---@param gridMinX float gridMinX
---@param gridMinY float gridMinY
---@param gridMinZ float gridMinZ
---@param gridMaxX float gridMaxX
---@param gridMaxY float gridMaxY
---@param gridMaxZ float gridMaxZ
---@param gridSize integer gridSize
---@param clipDistanceThreshold1 float clipDistanceThreshold1
---@param clipDistanceThreshold2 float clipDistanceThreshold2
function setAudioCullingWorldProperties(gridMinX, gridMinY, gridMinZ, gridMaxX, gridMaxY, gridMaxZ, gridSize, clipDistanceThreshold1, clipDistanceThreshold2) end

---@param _ integer
---@param _ boolean
function setAudioSourceAutoPlay(_, _) end

---@param _ integer
---@param _ float
function setAudioSourceInnerRange(_, _) end

--- Set the AudioSource's max retrigger delay
---@param objectId integer objectId
---@param maxRetriggerDelay float maxRetriggerDelay
function setAudioSourceMaxRetriggerDelay(objectId, maxRetriggerDelay) end

--- Get the AudioSource's min retrigger delay
---@param objectId integer objectId
---@param minRetriggerDelay float minRetriggerDelay
function setAudioSourceMinRetriggerDelay(objectId, minRetriggerDelay) end

--- Set the AudioSource's random playback state
---@param objectId integer objectId
---@param randomPlayback boolean randomPlayback
function setAudioSourceRandomPlayback(objectId, randomPlayback) end

---@param _ integer
---@param _ float
function setAudioSourceRange(_, _) end

--- Set the AudioSource's sample element's probability
---@param objectId integer objectId
---@param index integer index
---@param probability float probability
function setAudioSourceSampleElementProbability(objectId, index, probability) end

---@param _ integer
---@param _ boolean
function setAudioSourceTickInaudible(_, _) end

--- Set camera
---@param cameraId integer cameraId
function setCamera(cameraId) end

--- Set center of mass
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
function setCenterOfMass(transformId, x, y, z) end

--- Set object clip distance
---@param objectId integer objectId
---@param distance float distance
function setClipDistance(objectId, distance) end

--- Set collision mask
---@param transformId integer transformId
---@param mask integer mask
function setCollisionMask(transformId, mask) end

--- Set boolean value
---@param conditionalAnimationId integer conditionalAnimationId
---@param parameterId integer parameterId
---@param value boolean value
---@return boolean
function setConditionalAnimationBoolValue(conditionalAnimationId, parameterId, value) end

--- Set float value
---@param conditionalAnimationId integer conditionalAnimationId
---@param parameterId integer parameterId
---@param value float value
---@return boolean
function setConditionalAnimationFloatValue(conditionalAnimationId, parameterId, value) end

--- Set specific parameter ids
---@param conditionalAnimationId integer conditionalAnimationId
---@param velocityParmId integer velocityParmId
---@param angularVelocityParmId integer angularVelocityParmId
function setConditionalAnimationSpecificParameterIds(conditionalAnimationId, velocityParmId, angularVelocityParmId) end

--- Set time
---@param conditionalAnimationId integer
---@param time float
function setConditionalAnimationTime(conditionalAnimationId, time) end

---@param densityMapSyncer integer id
---@param densityMap integer id
---@param callbackFunctionName string callback function
---@param target object target
function setDensityMapSyncerCellChangedCallback(densityMapSyncer, densityMap, callbackFunctionName, target) end

--- Set the direction of an object, the positive z-axis points towards the given direction. The y-axis lies in the direction-up-plane.
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
---@param upX float upX
---@param upY float upY
---@param upZ float upZ
function setDirection(transformId, x, y, z, upX, upY, upZ) end

--- Set particle system count scale
---@param particleSystemId integer particleSystemId
---@param countScale float countScale
function setEmitCountScale(particleSystemId, countScale) end

--- Set emitter starting time.
---@param particleSystemId integer particleSystemId
---@param emitStartTime float emitStartTime
function setEmitStartTime(particleSystemId, emitStartTime) end

--- Set emitter stop time.
---@param particleSystemId integer particleSystemId
---@param emitStopTime float emitStopTime
function setEmitStopTime(particleSystemId, emitStopTime) end

--- Sets the emitter shape of the particle system
---@param particleSystemId integer particleSystemId
---@param shapeId integer shapeId
function setEmitterShape(particleSystemId, shapeId) end

--- Sets the emitter shape velocity scale of the particle system
---@param particleSystemId integer particleSystemId
---@param shape float velocity scale
function setEmitterShapeVelocityScale(particleSystemId, shape) end

--- Set whether the particle system should emit new particles
---@param particleSystemId integer particleSystemId
---@param state boolean state
function setEmittingState(particleSystemId, state) end

---@param densityMapSyncer integer id
---@param densityMap integer id
---@param cellX integer cell index
---@param cellZ integer cell index
---@param enable boolean enable flag
function setEnableDensityMapSyncerCellChangedCallback(densityMapSyncer, densityMap, cellX, cellZ, enable) end

--- Set the far clip distance
---@param cameraId integer cameraId
---@param farClip float farClip
function setFarClip(cameraId, farClip) end

--- Set fast shadow update for camera
---@param cameraId integer cameraId
---@param fastUpdate boolean set true for fast shadow update or false for far shadows
function setFastShadowUpdate(cameraId, fastUpdate) end

--- Set fill plane physical surface angle
---@param fillPlaneId integer fillPlaneId
---@param physicalSurfAngle float physicalSurfAngle
function setFillPlaneMaxPhysicalSurfaceAngle(fillPlaneId, physicalSurfAngle) end

---@param foliageBendingSystemId integer
---@param rectangleId integer
---@param minX float
---@param maxX float
---@param minZ float
---@param maxZ float
---@param yOffset float
function setFoliageBendingRectangleAttributes(foliageBendingSystemId, rectangleId, minX, maxX, minZ, maxZ, yOffset) end

---@param _ integer
---@param _ integer
function setFoliageBendingSystem(_, _) end

--- Sets the vertical field of view angle
---@param cameraId integer id of the camera
---@param fovY float field of view angle
function setFovY(cameraId, fovY) end

--- Sets friction velocity to collision
---@param objectId integer objectId
---@param velocity float velocity
function setFrictionVelocity(objectId, velocity) end

---@param _ integer
---@param _ integer
---@param _ float
---@param _ float
function setGamepadAxisForceFeedback(_, _, _, _) end

---@param _ integer
---@param _ boolean
function setIsCompound(_, _) end

---@param _ integer
---@param _ boolean
function setIsCompoundChild(_, _) end

--- Set if shape is non-renderable
---@param shapeId integer shapeId
---@param isNonRenderable boolean
function setIsNonRenderable(shapeId, isNonRenderable) end

---@param _ integer
---@param _ boolean
function setIsOrthographic(_, _) end

--- Set joint angular drive
---@param jointIndex integer
---@param axis integer
---@param usePosition boolean
---@param useVelocity boolean
---@param spring float
---@param damping float
---@param forceLimit float
---@param targetRotation float
---@param targetAngularVelocity float
function setJointAngularDrive(jointIndex, axis, usePosition, useVelocity, spring, damping, forceLimit, targetRotation, targetAngularVelocity) end

--- Set joint drive. Drives orientation if position drive or angular velocity if velocity drive.
---@param jointIndex integer
---@param isLinear boolean
---@param isPosition boolean
---@param valueX float
---@param valueY float
---@param valueZ float
---@param angle float
function setJointDrive(jointIndex, isLinear, isPosition, valueX, valueY, valueZ, angle) end

--- Set joint linear drive
---@param jointIndex integer
---@param axis integer
---@param usePosition boolean
---@param useVelocity boolean
---@param spring float
---@param damping float
---@param forceLimit float
---@param targetPosition float
---@param targetVelocity float
function setJointLinearDrive(jointIndex, axis, usePosition, useVelocity, spring, damping, forceLimit, targetPosition, targetVelocity) end

--- Set range of a light
---@param lightId integer lightId
---@param range float range
function setLightRange(lightId, range) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
function setLightScatteringColor(_, _, _, _) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
function setLightScatteringDirection(_, _, _, _) end

---@param _ integer
---@param _ boolean
---@param _ integer
function setLightShadowMap(_, _, _) end

--- Set linear damping
---@param transformId integer transformId
---@param linearDamping float linearDamping
function setLinearDamping(transformId, linearDamping) end

--- Set linear velocity of transform object
---@param transformId integer transformId
---@param velocityX float velocityX
---@param velocityY float velocityY
---@param velocityZ float velocityZ
function setLinearVelocity(transformId, velocityX, velocityY, velocityZ) end

--- Set transform object locked group flag
---@param transformId integer transformId
---@param locked boolean group locked group
function setLockedGroup(transformId, locked) end

--- Set mass
---@param transformId integer transformId
---@param mass float mass
function setMass(transformId, mass) end

--- Set material by index
---@param shapeId integer shapeId
---@param materialId integer materialId
---@param material integer index material index
function setMaterial(shapeId, materialId, material) end

---@param materialId integer
---@param name string
---@param filename string
---@param textueWrap boolean
---@param isSRGB boolean
---@param sharedEdit boolean
---@return integer
function setMaterialCustomMapFromFile(materialId, name, filename, textueWrap, isSRGB, sharedEdit) end

---@param materialId integer
---@param shaderVariationName string
---@param sharedEdit boolean
---@return integer
function setMaterialCustomShaderVariation(materialId, shaderVariationName, sharedEdit) end

---@param materialId integer
---@param filename string
---@param textueWrap boolean
---@param isSRGB boolean
---@param sharedEdit boolean
---@return integer
function setMaterialDiffuseMapFromFile(materialId, filename, textueWrap, isSRGB, sharedEdit) end

---@param materialId integer
---@param filename string
---@param textueWrap boolean
---@param isSRGB boolean
---@param sharedEdit boolean
---@return integer
function setMaterialGlossMapFromFile(materialId, filename, textueWrap, isSRGB, sharedEdit) end

---@param materialId integer
---@param filename string
---@param textueWrap boolean
---@param isSRGB boolean
---@param sharedEdit boolean
---@return integer
function setMaterialNormalMapFromFile(materialId, filename, textueWrap, isSRGB, sharedEdit) end

--- Set minimum clip distance
---@param objectId integer objectId
---@param minDist float minDist
function setMinClipDistance(objectId, minDist) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ unknown
---@param _ unknown
function setMotorProperties(_, _, _, _, _, _, _, _, _) end

--- Set object name
---@param objectId integer objectId
---@param objectName string objectName
function setName(objectId, objectName) end

--- Set the near clip distance
---@param cameraId integer cameraId
---@param nearClip float nearClip
function setNearClip(cameraId, nearClip) end

--- Set note node color
---@param noteId integer Id of the note node
---@param colorR float R component of note color
---@param colorG float G component of note color
---@param colorB float B component of note color
function setNoteNodeColor(noteId, colorR, colorG, colorB) end

--- Set note node fixed size
---@param noteId integer Id of the note node
---@param fixedSize boolean
function setNoteNodeFixedSize(noteId, fixedSize) end

--- Set note node text
---@param noteId integer Id of the note node
---@param text string
function setNoteNodeText(noteId, text) end

--- Set object mask
---@param objectId integer objectId
---@param mask integer mask
function setObjectMask(objectId, mask) end

---@param _ integer
---@param _ float
function setOrthographicHeight(_, _) end

--- Set overlay color
---@param overlayId integer overlayId
---@param red float red
---@param green float green
---@param blue float blue
---@param alpha float alpha
function setOverlayColor(overlayId, red, green, blue, alpha) end

--- Set overlay color of a single corner
---@param overlayId integer overlayId
---@param cornerIndex integer corner index
---@param red float red
---@param green float green
---@param blue float blue
---@param alpha float alpha
function setOverlayCornerColor(overlayId, cornerIndex, red, green, blue, alpha) end

--- Set layer for texture array overlays
---@param overlayId integer
---@param layer integer
function setOverlayLayer(overlayId, layer) end

--- Set overlay rotation
---@param overlayId integer overlayId
---@param rotation float rotation
---@param pivotX float x position of pivot of rotation
---@param pivotY float y position of pivot of rotation
function setOverlayRotation(overlayId, rotation, pivotX, pivotY) end

--- Set overlay signed distance field width
---@param overlayId integer overlayId
---@param sdfWidth float range of the sdf in normalized color
function setOverlaySignedDistanceFieldWidth(overlayId, sdfWidth) end

--- Set overlay uv coordinates
---@param overlayId integer overlayId
---@param v0 float v0
---@param u0 float u0
---@param v1 float v1
---@param u1 float u1
---@param v2 float v2
---@param u2 float u2
---@param v3 float v3
---@param u3 float u3
function setOverlayUVs(overlayId, v0, u0, v1, u1, v2, u2, v3, u3) end

--- Set particle system life span.
---@param particleSystemId integer particleSystemId
---@param lifeSpan float lifeSpan
---@param keepBlendTimes boolean keepBlendTimes
function setParticleSystemLifespan(particleSystemId, lifeSpan, keepBlendTimes) end

--- Sets the time scale for the particle simulation.
---@param particleSystemId integer particleSystemId
---@param timeScale float timeScale
function setParticleSystemTimeScale(particleSystemId, timeScale) end

--- Translate polyline
---@param fillPlaneId integer fillPlaneId
---@param polyLineIdx integer polyLineIdx
---@param dx float dx
---@param dz float dz
function setPolylineTranslation(fillPlaneId, polyLineIdx, dx, dz) end

---@param _ integer
---@param _ float
---@param _ float
function setProjectionOffset(_, _, _) end

--- Sets quaternion
---@param objectId integer objectId
---@param x float x
---@param y float y
---@param z float z
---@param w float w
function setQuaternion(objectId, x, y, z, w) end

--- Set rigid body type
---@param transformId integer transformId
---@param type integer RIGID_BODY_TYPE
function setRigidBodyType(transformId, type) end

--- Set rootnode
---@param objectId integer objectId
function setRootNode(objectId) end

--- Set rotation
---@param objectId integer objectId
---@param x float x
---@param y float y
---@param z float z
function setRotation(objectId, x, y, z) end

--- Set sample pitch
---@param sampleId integer sampleId
---@param pitch float pitch
function setSamplePitch(sampleId, pitch) end

--- Set velocity of a sample object
---@param sampleId integer sampleId
---@param x float x
---@param y float y
---@param z float z
function setSampleVelocity(sampleId, x, y, z) end

--- Set sample volume
---@param sampleId integer sampleId
---@param volume float volume
function setSampleVolume(sampleId, volume) end

--- Set scale of a transform object
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
function setScale(transformId, x, y, z) end

--- Set shader parameter
---@param shapeId integer shapeId
---@param parameterName string parameterName
---@param x float x
---@param y float y
---@param z float z
---@param w float w
---@param shared boolean shared
function setShaderParameter(shapeId, parameterName, x, y, z, w, shared) end

---@param _ integer
function setShadowFocusBox(_) end

--- Set the bones of the shape given the new root node. The hierarchy of the new bones must be mostly the same as for the currently set bones. Additional children after the used bones are allowed. Bones are matched by node indices and not by name.
--- The new root newRootBoneId must match with oldRootBoneId or the currently assigned root if oldRootBoneId is 0.
---@param shapeId integer shapeId
---@param newRootBoneId integer The roof the new skeleton
---@param oldRootBoneId integer The root of the currently assigned skeleton. If 0, the lowest common root node of the currently assigned bones is used
---@param keepBindPoses boolean If true, the bind poses of the current bones are kept, otherwise the new bones are assumed to be in the bind pose
---@return boolean
function setShapeBones(shapeId, newRootBoneId, oldRootBoneId, keepBindPoses) end

--- Set the same bones as the other shape uses. Both shapes must use exactly the same number of bones
---@param shapeId integer shapeId
---@param sourceShapeId integer sourceShapeId
---@return boolean
function setShapeBonesFromShape(shapeId, sourceShapeId) end

--- Set the bounding sphere of this shape only
---@param shapeId integer
---@param localPosX float
---@param localPosY float
---@param localPosZ float
---@param radius float if < 0, the bounding sphere of the geometry will be used
function setShapeBoundingSphere(shapeId, localPosX, localPosY, localPosZ, radius) end

--- Set Cast Shadowmap flag
---@param shapeId integer shapeId
---@param castShadowmap boolean castShadowmap
function setShapeCastShadowmap(shapeId, castShadowmap) end

--- Set the bounding sphere of the shape's geometry.
--- Warning: This does not update the bounding volumes of other shapes using this geometry. Those are only updated if they are invalided, e.g. by moving the shape or calling invalidShapeBoundingVolume
---@param shapeId integer
---@param localPosX float
---@param localPosY float
---@param localPosZ float
---@param radius float
function setShapeGeometryBoundingSphere(shapeId, localPosX, localPosY, localPosZ, radius) end

--- Set solver iteration count
---@param transformId integer transformId
---@param count integer count
function setSolverIterationCount(transformId, count) end

--- Set the position of a spline control point.
---@param shapeId integer Spline id
---@param index integer The index of the control point to be positioned
---@param x float New spline point position x
---@param y float New spline point position y
---@param z float New spline point position z
function setSplineCV(shapeId, index, x, y, z) end

--- Set the position of a spline edit point.
---@param shapeId integer Spline id
---@param index integer The index of the edit point to be positioned
---@param x float New spline point position x
---@param y float New spline point position y
---@param z float New spline point position z
function setSplineEP(shapeId, index, x, y, z) end

--- Set streamed sample volume
---@param sampleId integer sampleId
---@param volume float volume
function setStreamedSampleVolume(sampleId, volume) end

--- Set random delay parameters for streamed I3D loading
---@param minDelay float min delay in seconds
---@param maxDelay float max delay in seconds
function setStreamI3DFileDelay(minDelay, maxDelay) end

--- Set random delay parameters for shared I3D loading
---@param minDelay float min delay in seconds for loaded shared I3D
---@param maxDelay float max delay in seconds for loaded shared I3D
---@param minDelayCached float min delay in seconds for cached shared I3D
---@param maxDelayCached float max delay in seconds for cached shared I3D
function setStreamSharedI3DFileDelay(minDelay, maxDelay, minDelayCached, maxDelayCached) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@param _ float
function setTerrainHeightAtWorldPos(_, _, _, _, _) end

--- Set the text alignment to be used for the following renderText calls
---@param alignment integer alignment
function setTextAlignment(alignment) end

--- Set the text boldness to be used for the following renderText calls
---@param isBold boolean isBold
function setTextBold(isBold) end

--- Sets clip area used for text rendering. Characters are only rendered within the clip area.
--- Set to unit area to disable.
---@param clipMinX float
---@param clipMinY float
---@param clipMaxX float
---@param clipMaxY float
function setTextClipArea(clipMinX, clipMinY, clipMaxX, clipMaxY) end

--- Set the text color to be used for the following renderText calls
---@param r float r
---@param g float g
---@param b float b
---@param a float a
function setTextColor(r, g, b, a) end

---@param _ boolean
function setTextDepthTestEnabled(_) end

--- Set text line bounds
---@param startLine integer startLine
---@param numLines integer numLines
function setTextLineBounds(startLine, numLines) end

---@param _ float
function setTextLineHeightScale(_) end

---@param _ integer
function setTextRenderOverlay(_) end

---@param _ integer
function setTextVerticalAlignment(_) end

--- Set the text scale width to be used for the following renderText calls
---@param scaleWidth float scaleWidth
function setTextWidthScale(scaleWidth) end

--- Set text wrap width
---@param wrapWidth float wrapWidth
---@param allowForcedWrap boolean allow wrapping mid word when no separator is available
function setTextWrapWidth(wrapWidth, allowForcedWrap) end

--- Set translation of a transform object
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
function setTranslation(transformId, x, y, z) end

---@param _ integer
---@param _ boolean
function setUseLightScattering(_, _) end

--- Set user attribute value
---@param objectId integer objectId
---@param attributeName string attributeName
---@param typeName string
---@param value any value
function setUserAttribute(objectId, attributeName, typeName, value) end

--- Set transform object visibility
---@param transformId integer transformId
---@param visibility boolean visibility
function setVisibility(transformId, visibility) end

--- Set the day of year condition of the visibility condition
---@param objectId integer objectId
---@param dayOfYearStart integer dayOfYearStart
---@param dayOfYearEnd integer dayOfYearEnd
function setVisibilityConditionDayOfYear(objectId, dayOfYearStart, dayOfYearEnd) end

--- Set the minute of day condition of the visibility condition
---@param objectId integer objectId
---@param minuteOfDayStart integer minuteOfDayStart
---@param minuteOfDayEnd integer minuteOfDayEnd
function setVisibilityConditionMinuteOfDay(objectId, minuteOfDayStart, minuteOfDayEnd) end

--- Set the render invisible property of the visibility condition
---@param objectId integer objectId
---@param renderInvisible boolean if true, the object will always be rendered and the custom shader is supposed to change the rendering based on the visibility parameter
function setVisibilityConditionRenderInvisible(objectId, renderInvisible) end

--- Set the viewerspaciality mask condition of the visibility condition
---@param objectId integer objectId
---@param viewerSpacialityRequiredMask integer
---@param viewerSpacialityPreventMask integer
function setVisibilityConditionViewerSpacialityMask(objectId, viewerSpacialityRequiredMask, viewerSpacialityPreventMask) end

--- Set the shader parameter of the visibility condition
---@param objectId integer objectId
---@param shaderVisibilityParam float shader parameter when condition is met
function setVisibilityConditionVisibleShaderParameter(objectId, shaderVisibilityParam) end

--- Set the weather mask condition of the visibility condition
---@param objectId integer objectId
---@param weatherRequiredMask integer
---@param weatherPreventMask integer
function setVisibilityConditionWeatherMask(objectId, weatherRequiredMask, weatherPreventMask) end

--- Set wheel shape force point
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@param positionX float positionX
---@param positionY float positionY
---@param positionZ float positionZ
function setWheelShapeForcePoint(transformId, wheelShapeIndex, positionX, positionY, positionZ) end

--- Set wheel shape properties
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@param motorTorque float motorTorque
---@param brakeTorque float brakeTorque
---@param steerAngle float steerAngle
---@param rotationDamping float rotationDamping
function setWheelShapeProps(transformId, wheelShapeIndex, motorTorque, brakeTorque, steerAngle, rotationDamping) end

--- Set wheel shape tire friction
---@param transformId integer transformId
---@param wheelShapeIndex integer wheelShapeIndex
---@param maxLongStiffness float maxLongStiffness
---@param maxLatStiffness float maxLatStiffness
---@param maxLatStiffnessTireLoad float maxLatStiffnessTireLoad
---@param frictionMultiplier float frictionMultiplier
function setWheelShapeTireFriction(transformId, wheelShapeIndex, maxLongStiffness, maxLatStiffness, maxLatStiffnessTireLoad, frictionMultiplier) end

--- Set XML file boolean attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@param value boolean value
function setXMLBool(xmlId, attributePath, value) end

--- Set XML file float attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@param value float value
function setXMLFloat(xmlId, attributePath, value) end

--- Set XML file integer attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@param value integer value
function setXMLInt(xmlId, attributePath, value) end

--- Set XML file string attribute.
---@param xmlId integer xmlId
---@param attributePath string attributePath
---@param value string value
function setXMLString(xmlId, attributePath, value) end

--- Enable/disable physics simulation
---@param state boolean state
function simulatePhysics(state) end

--- Time scale of physics simulation
---@param scale float scale
function simulatePhysicsTimeScale(scale) end

--- Source script file
---@param filename string filename
---@param environment ref environment
function source(filename, environment) end

--- Stop sample object
---@param sampleId integer sampleId
---@param delay float delay until to stop playing
---@param fadeTime float time to fade out the sample
function stopSample(sampleId, delay, fadeTime) end

--- Stop streamed sample
---@param sampleId integer sampleId
function stopStreamedSample(sampleId) end

--- Stream align read to byte boundary
---@param streamId integer streamId
function streamAlignReadToByteBoundary(streamId) end

--- Stream align write to byte boundary
---@param streamId integer streamId
function streamAlignWriteToByteBoundary(streamId) end

--- Stream get number of unread bits
---@param streamId integer streamId
---@return integer
function streamGetNumOfUnreadBits(streamId) end

--- Stream get read offset
---@param streamId integer streamId
---@return integer
function streamGetReadOffset(streamId) end

--- Return the write pointer offset in bytes
---@param streamId integer streamId
---@return integer
function streamGetWriteOffset(streamId) end

--- Stream I3D file
---@param filename string filename
---@param callbackFunctionName string callbackFunctionName
---@param target object target
---@param args object args
---@param addPhysics boolean addPhysics
---@param callOnCreate boolean callOnCreate
---@param verbose boolean verbose
---@return integer
function streamI3DFile(filename, callbackFunctionName, target, args, addPhysics, callOnCreate, verbose) end

--- Stream read boolean
---@param streamId integer streamId
---@return boolean
function streamReadBool(streamId) end

--- Stream read 32bit float
---@param streamId integer streamId
---@return float
function streamReadFloat32(streamId) end

--- Stream read 16bit signed integer
---@param streamId integer streamId
---@return integer
function streamReadInt16(streamId) end

--- Stream read 32bit signed integer
---@param streamId integer streamId
---@return integer
function streamReadInt32(streamId) end

--- Stream read 8bit signed integer
---@param streamId integer streamId
---@return integer
function streamReadInt8(streamId) end

--- Stream read 32bit signed integer
---@param streamId integer streamId
---@param numberofBits integer numberofBits
---@return integer
function streamReadIntN(streamId, numberofBits) end

--- Stream read manual timestamp
---@param streamId integer streamId
---@return integer
function streamReadManualTimestamp(streamId) end

--- Stream read 32bit float
---@param streamId integer streamId
---@return string
function streamReadString(streamId) end

--- Stream write 16-bit unsigned integer.
---@param streamId integer streamId
---@return integer
function streamReadUInt16(streamId) end

--- Stream read 8-bit unsigned integer.
---@param streamId integer streamId
---@return integer
function streamReadUInt8(streamId) end

--- Stream write N-bit unsigned integer. 0&lt;N&lt;32.
---@param streamId integer streamId
---@param numberOfBits integer numberOfBits
---@return integer
function streamReadUIntN(streamId, numberOfBits) end

--- Set the read pointer to the given offset in bytes
---@param streamId integer streamId
---@param offset integer offset
function streamSetReadOffset(streamId, offset) end

--- Set the write pointer to the given offset in bytes
---@param streamId integer streamId
---@param offset integer offset
function streamSetWriteOffset(streamId, offset) end

--- Stream shared I3D file. Can call the callback in the same callstack when the file is already loaded
---@param filename string filename
---@param callbackFunctionName string callbackFunctionName
---@param target object target
---@param args object args
---@param addPhysics boolean addPhysics
---@param callOnCreate boolean callOnCreate
---@param verbose boolean verbose
---@return integer
function streamSharedI3DFile(filename, callbackFunctionName, target, args, addPhysics, callOnCreate, verbose) end

--- Stream write boolean
---@param streamId integer streamId
---@param value boolean value
---@return boolean
function streamWriteBool(streamId, value) end

--- Stream write 32bit float
---@param streamId integer streamId
---@param value float value
function streamWriteFloat32(streamId, value) end

--- Stream write 16bit signed integer
---@param streamId integer streamId
---@param value integer value
function streamWriteInt16(streamId, value) end

--- Stream write 32bit signed integer
---@param streamId integer streamId
---@param value integer value
function streamWriteInt32(streamId, value) end

--- Stream write 8bit signed integer
---@param streamId integer streamId
---@param value integer value
function streamWriteInt8(streamId, value) end

--- Stream write N bit signed integer. 0 &lt; N &lt; 32.
---@param streamId integer streamId
---@param value integer value
---@param numberOfBits integer numberOfBits
function streamWriteIntN(streamId, value, numberOfBits) end

--- Stream write manual timestamp
---@param streamId integer streamId
---@param timestamp integer timestamp
function streamWriteManualTimestamp(streamId, timestamp) end

--- Stream write stream
---@param streamId integer streamId
---@param streamSrcId integer streamSrcId
---@param numBits integer numBits
---@param useReadStream boolean useReadStream
function streamWriteStream(streamId, streamSrcId, numBits, useReadStream) end

--- Stream write string
---@param streamId integer streamId
---@param value string value
function streamWriteString(streamId, value) end

--- Stream write timestamp
---@param streamId integer streamId
function streamWriteTimestamp(streamId) end

--- Stream write 16-bit unsigned integer.
---@param streamId integer streamId
---@param value integer value
function streamWriteUInt16(streamId, value) end

--- Stream write 8-bit unsigned integer.
---@param streamId integer streamId
---@param uint8 integer uint8
function streamWriteUInt8(streamId, uint8) end

--- Stream write N-bit unsigned integer. 0&lt;N&lt;32.
---@param streamId integer streamId
---@param value integer value
---@param numberofBits integer numberofBits
function streamWriteUIntN(streamId, value, numberofBits) end

---@return object
function TensionBeltGeometryConstructor.new() end

---@param _ float
---@param _ float
---@param _ float
function TensionBeltGeometryConstructor:addAttachment(_, _, _) end

---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
---@param _ float
function TensionBeltGeometryConstructor:addIntersectionPoint(_, _, _, _, _, _) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@param _ float
function TensionBeltGeometryConstructor:addShape(_, _, _, _, _) end

---@return integer, integer, float
function TensionBeltGeometryConstructor:finalize() end

---@param _ integer
---@param _ integer
function TensionBeltGeometryConstructor:setFixedPoints(_, _) end

---@param _ float
function TensionBeltGeometryConstructor:setGeometryBias(_) end

---@param _ integer
function TensionBeltGeometryConstructor:setLinkNode(_) end

---@param _ integer
function TensionBeltGeometryConstructor:setMaterial(_) end

---@param _ float
function TensionBeltGeometryConstructor:setMaxEdgeLength(_) end

---@param _ float
function TensionBeltGeometryConstructor:setUVscale(_) end

---@param _ float
function TensionBeltGeometryConstructor:setWidth(_) end

function traceOff() end

---@param _ unknown (optional)
function traceOn(_) end

--- Converts an unicode value to an utf8 string
---@param unicode integer unicode
---@return string
function unicodeToUtf8(unicode) end

--- Unlink node from parent
---@param objectId integer objectId
function unlink(objectId) end

--- Unpin a shared I3D file in the cache, so it can be auto-deleted again
---@param filename string filename
function unpinSharedI3DFileInCache(filename) end

--- Transform vector from screen space into world space
---@param sx float sx
---@param sy float sy
---@param sz float sz
---@return float, float, float
function unProject(sx, sy, sz) end

--- Update
---@param conditionalAnimationId integer conditionalAnimationId
---@param dt float dt
function updateConditionalAnimation(conditionalAnimationId, dt) end

--- update differential
---@param transformId integer transformId
---@param index integer index
---@param ratio float ratio
---@param bias float bias
function updateDifferential(transformId, index, ratio, bias) end

---@param _ integer
function usleep(_) end

--- Returns the length of an utf8 formated string
---@param utf8string string utf8string
---@return integer
function utf8Strlen(utf8string) end

--- Returns a sub string of an utf8 formated string
---@param utf8string string utf8string
---@param startIndex integer startIndex
---@param length integer length
---@return string
function utf8Substr(utf8string, startIndex, length) end

--- Returns a lower case string of an utf8 formated string
---@param utf8string string utf8string
---@return string
function utf8ToLower(utf8string) end

--- Converts an utf8 string to unicode
---@param utf8string string utf8string
---@return integer, integer
function utf8ToUnicode(utf8string) end

--- Return a upper case string of an utf8 formated string
---@param utf8string string utf8string
---@return string
function utf8ToUpper(utf8string) end

--- Remove voice chat connection
---@param connectionId integer connectionId
function voiceChatRemoveConnection(connectionId) end

--- World space to local space transformation, only direction without translation
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float
function worldDirectionToLocal(transformId, x, y, z) end

---@param _ integer
---@param _ float
---@param _ float
---@param _ float
---@return float, float, float
function worldRotationToLocal(_, _, _, _) end

--- World space to local space transformation
---@param transformId integer transformId
---@param x float x
---@param y float y
---@param z float z
---@return float, float, float
function worldToLocal(transformId, x, y, z) end

--- Write fill plane surface information to stream
---@param fillPlaneId integer fillPlaneId
---@param streamId integer streamId
---@return boolean
function writeFillPlaneToStream(fillPlaneId, streamId) end

---@param _ integer
---@param _ integer
---@param _ integer
---@param _ integer
---@param _ float
---@param _ float
---@param _ float
function writeTerrainUpdateStream(_, _, _, _, _, _, _) end

---@enum AgentState
AgentState.DRIVING = "DRIVING"
AgentState.BLOCKED = "BLOCKED"
AgentState.PLANNING = "PLANNING"
AgentState.NOT_REACHABLE = "NOT_REACHABLE"
AgentState.TARGET_REACHED = "TARGET_REACHED"

---@enum AnimalHusbandryFeedingType
AnimalHusbandryFeedingType.FOOD = "FOOD"
AnimalHusbandryFeedingType.WATER = "WATER"

---@enum AsyncResult
AsyncResult.NO = "NO"
AsyncResult.YES = "YES"
AsyncResult.NOT_AVAILABLE = "NOT_AVAILABLE"

---@enum BrushType
BrushType.BRUSH_TYPE_CIRCLE = "BRUSH_TYPE_CIRCLE"
BrushType.BRUSH_TYPE_SQUARE = "BRUSH_TYPE_SQUARE"

---@enum ClassIds
ClassIds.OVERLAY = "OVERLAY"
ClassIds.IMAGE_OVERLAY = "IMAGE_OVERLAY"
ClassIds.VIDEO_OVERLAY = "VIDEO_OVERLAY"
ClassIds.TERRAIN_TRANSFORM_GROUP = "TERRAIN_TRANSFORM_GROUP"
ClassIds.FOLIAGE_TRANSFORM_GROUP = "FOLIAGE_TRANSFORM_GROUP"
ClassIds.TERRAIN_DETAIL_TRANSFORM_GROUP = "TERRAIN_DETAIL_TRANSFORM_GROUP"
ClassIds.TERRAIN_LAYER_TRANSFORM_GROUP = "TERRAIN_LAYER_TRANSFORM_GROUP"
ClassIds.SHAPE = "SHAPE"
ClassIds.LIGHT_SOURCE = "LIGHT_SOURCE"
ClassIds.AUDIO_SOURCE = "AUDIO_SOURCE"
ClassIds.CAMERA = "CAMERA"
ClassIds.NAVIGATION_MESH = "NAVIGATION_MESH"
ClassIds.DESTRUCTION_SHAPE = "DESTRUCTION_SHAPE"
ClassIds.MESH_SPLIT_SHAPE = "MESH_SPLIT_SHAPE"
ClassIds.GEOMETRY = "GEOMETRY"
ClassIds.TRANSFORM_GROUP = "TRANSFORM_GROUP"
ClassIds.PARTICLE_SYSTEM = "PARTICLE_SYSTEM"
ClassIds.PRECIPITATION = "PRECIPITATION"
ClassIds.SPLINE = "SPLINE"
ClassIds.NOTE = "NOTE"

---@enum DebugRendering
DebugRendering.NONE = "NONE"
DebugRendering.ALPHA = "ALPHA"
DebugRendering.PARALLAX = "PARALLAX"
DebugRendering.ALBEDO = "ALBEDO"
DebugRendering.NORMALS = "NORMALS"
DebugRendering.TANGENT_SPACE_NORMALS = "TANGENT_SPACE_NORMALS"
DebugRendering.SMOOTHNESS = "SMOOTHNESS"
DebugRendering.METALNESS = "METALNESS"
DebugRendering.AMBIENT_OCCLUSION = "AMBIENT_OCCLUSION"
DebugRendering.BAKED_AMBIENT_OCCLUSION = "BAKED_AMBIENT_OCCLUSION"
DebugRendering.SCREEN_SPACE_AMBIENT_OCCLUSION = "SCREEN_SPACE_AMBIENT_OCCLUSION"
DebugRendering.SPECULAR_OCCLUSION = "SPECULAR_OCCLUSION"
DebugRendering.DIFFUSE_LIGHTING = "DIFFUSE_LIGHTING"
DebugRendering.SPECULAR_LIGHTING = "SPECULAR_LIGHTING"
DebugRendering.INDIRECT_LIGHTING = "INDIRECT_LIGHTING"
DebugRendering.LIGHT_GRID = "LIGHT_GRID"
DebugRendering.SHADOW_SPLITS = "SHADOW_SPLITS"
DebugRendering.DEPTH = "DEPTH"
DebugRendering.DEPTH_SCALED = "DEPTH_SCALED"
DebugRendering.MIP_LEVELS = "MIP_LEVELS"
DebugRendering.TRIANGLE_DENSITY = "TRIANGLE_DENSITY"
DebugRendering.TERRAIN_SLOPES = "TERRAIN_SLOPES"
DebugRendering.MOTION_VECTORS = "MOTION_VECTORS"
DebugRendering.SHADING_RATE = "SHADING_RATE"
DebugRendering.MESH_LOD = "MESH_LOD"
DebugRendering.CUSTOM1 = "CUSTOM1"
DebugRendering.CUSTOM2 = "CUSTOM2"

---@enum DensityCoordType
DensityCoordType.POINT_POINT_POINT = "POINT_POINT_POINT"
DensityCoordType.POINT_VECTOR_VECTOR = "POINT_VECTOR_VECTOR"

---@enum DensityIndexCompareMode
DensityIndexCompareMode.UPDATE = "UPDATE"
DensityIndexCompareMode.KEEP = "KEEP"
DensityIndexCompareMode.ZERO = "ZERO"

---@enum DensityRoundingMode
DensityRoundingMode.NEAREST = "NEAREST"
DensityRoundingMode.NEAREST_EXPAND = "NEAREST_EXPAND"
DensityRoundingMode.INCLUSIVE = "INCLUSIVE"

---@enum DensityTypeCompareType
DensityTypeCompareType.EQUAL = "EQUAL"
DensityTypeCompareType.NOTEQUAL = "NOTEQUAL"
DensityTypeCompareType.ALWAYS = "ALWAYS"

---@enum DensityValueCompareType
DensityValueCompareType.ALWAYS = "ALWAYS"
DensityValueCompareType.GREATER = "GREATER"
DensityValueCompareType.BETWEEN = "BETWEEN"
DensityValueCompareType.EQUAL = "EQUAL"
DensityValueCompareType.NOTEQUAL = "NOTEQUAL"
DensityValueCompareType.NOTBETWEEN = "NOTBETWEEN"

---@enum DLSSQuality
DLSSQuality.OFF = "OFF"
DLSSQuality.MAX_PERFORMANCE = "MAX_PERFORMANCE"
DLSSQuality.BALANCED_PERFORMANCE = "BALANCED_PERFORMANCE"
DLSSQuality.MAX_QUALITY = "MAX_QUALITY"
DLSSQuality.ULTRA_PERFORMANCE = "ULTRA_PERFORMANCE"
DLSSQuality.ULTRA_QUALITY = "ULTRA_QUALITY"
DLSSQuality.NUM = "NUM"

---@enum FidelityFxSR30Quality
FidelityFxSR30Quality.OFF = "OFF"
FidelityFxSR30Quality.ULTRA_QUALITY = "ULTRA_QUALITY"
FidelityFxSR30Quality.QUALITY = "QUALITY"
FidelityFxSR30Quality.BALANCED = "BALANCED"
FidelityFxSR30Quality.PERFORMANCE = "PERFORMANCE"
FidelityFxSR30Quality.ULTRA_PERFORMANCE = "ULTRA_PERFORMANCE"
FidelityFxSR30Quality.NUM = "NUM"

---@enum FidelityFxSRQuality
FidelityFxSRQuality.OFF = "OFF"
FidelityFxSRQuality.ULTRA_QUALITY = "ULTRA_QUALITY"
FidelityFxSRQuality.QUALITY = "QUALITY"
FidelityFxSRQuality.BALANCED = "BALANCED"
FidelityFxSRQuality.PERFORMANCE = "PERFORMANCE"
FidelityFxSRQuality.NUM = "NUM"

---@enum FileAccess
FileAccess.WRITE = "WRITE"
FileAccess.READ = "READ"

---@enum FullscreenMode
FullscreenMode.WINDOWED = "WINDOWED"
FullscreenMode.WINDOWED_FULLSCREEN = "WINDOWED_FULLSCREEN"
FullscreenMode.EXCLUSIVE_FULLSCREEN = "EXCLUSIVE_FULLSCREEN"
FullscreenMode.NUM = "NUM"

---@enum GamepadCategories
GamepadCategories.CATEGORY_UNKNOWN = "CATEGORY_UNKNOWN"
GamepadCategories.CATEGORY_WHEEL = "CATEGORY_WHEEL"
GamepadCategories.CATEGORY_JOYSTICK = "CATEGORY_JOYSTICK"
GamepadCategories.CATEGORY_GAMEPAD = "CATEGORY_GAMEPAD"
GamepadCategories.CATEGORY_FARMWHEEL = "CATEGORY_FARMWHEEL"
GamepadCategories.CATEGORY_FARMSIDEPANEL = "CATEGORY_FARMSIDEPANEL"
GamepadCategories.CATEGORY_FARMWHEEL_HORI = "CATEGORY_FARMWHEEL_HORI"
GamepadCategories.CATEGORY_FARMSIDEPANEL_HORI = "CATEGORY_FARMSIDEPANEL_HORI"
GamepadCategories.CATEGORY_FARMJOYSTICK_THRUSTMASTER = "CATEGORY_FARMJOYSTICK_THRUSTMASTER"

---@enum HusbandryAreaType
HusbandryAreaType.INDOOR = "INDOOR"

---@enum InAppPurchase
InAppPurchase.ERROR_OK = "ERROR_OK"
InAppPurchase.ERROR_NETWORK_UNAVAILABLE = "ERROR_NETWORK_UNAVAILABLE"
InAppPurchase.ERROR_PURCHASE_IN_PROGRESS = "ERROR_PURCHASE_IN_PROGRESS"
InAppPurchase.ERROR_FAILED = "ERROR_FAILED"
InAppPurchase.ERROR_CANCELLED = "ERROR_CANCELLED"
InAppPurchase.ERROR_PENDING_PAYMENT = "ERROR_PENDING_PAYMENT"

---@enum LightType
LightType.DIRECTIONAL = "DIRECTIONAL"
LightType.POINT = "POINT"
LightType.SPOT = "SPOT"

---@enum LoadI3DFailedReason
LoadI3DFailedReason.NONE = "NONE"
LoadI3DFailedReason.CANCELLED = "CANCELLED"
LoadI3DFailedReason.FILE_NOT_FOUND = "FILE_NOT_FOUND"
LoadI3DFailedReason.UNKNOWN = "UNKNOWN"

---@enum MasterServerServerDetailsFailedReason
MasterServerServerDetailsFailedReason.NOT_FOUND = "NOT_FOUND"
MasterServerServerDetailsFailedReason.NO_CROSS_PLAY = "NO_CROSS_PLAY"

---@enum MultiplayerAvailability
MultiplayerAvailability.AVAILABILITY_UNKNOWN = "AVAILABILITY_UNKNOWN"
MultiplayerAvailability.AVAILABLE = "AVAILABLE"
MultiplayerAvailability.NOT_AVAILABLE = "NOT_AVAILABLE"
MultiplayerAvailability.NO_PRIVILEGES = "NO_PRIVILEGES"

---@enum NATType
NATType.NAT_UNKNOWN = "NAT_UNKNOWN"
NATType.NAT_OPEN = "NAT_OPEN"
NATType.NAT_MODERATE = "NAT_MODERATE"
NATType.NAT_STRICT = "NAT_STRICT"

---@enum Network
Network.TYPE_APPLICATION = "TYPE_APPLICATION"
Network.TYPE_CONNECTION_REQUEST_ACCEPTED = "TYPE_CONNECTION_REQUEST_ACCEPTED"
Network.TYPE_CONNECTION_ATTEMPT_FAILED = "TYPE_CONNECTION_ATTEMPT_FAILED"
Network.TYPE_ALREADY_CONNECTED = "TYPE_ALREADY_CONNECTED"
Network.TYPE_NEW_INCOMING_CONNECTION = "TYPE_NEW_INCOMING_CONNECTION"
Network.TYPE_NO_FREE_INCOMING_CONNECTIONS = "TYPE_NO_FREE_INCOMING_CONNECTIONS"
Network.TYPE_DISCONNECTION_NOTIFICATION = "TYPE_DISCONNECTION_NOTIFICATION"
Network.TYPE_CONNECTION_LOST = "TYPE_CONNECTION_LOST"
Network.TYPE_RSA_PUBLIC_KEY_MISMATCH = "TYPE_RSA_PUBLIC_KEY_MISMATCH"
Network.TYPE_CONNECTION_BANNED = "TYPE_CONNECTION_BANNED"
Network.TYPE_INVALID_PASSWORD = "TYPE_INVALID_PASSWORD"
Network.TYPE_MODIFIED_PACKET = "TYPE_MODIFIED_PACKET"
Network.TYPE_PONG = "TYPE_PONG"
Network.TYPE_ADVERTISE_SYSTEM = "TYPE_ADVERTISE_SYSTEM"
Network.TYPE_REMOTE_DISCONNECTION_NOTIFICATION = "TYPE_REMOTE_DISCONNECTION_NOTIFICATION"
Network.TYPE_REMOTE_CONNECTION_LOST = "TYPE_REMOTE_CONNECTION_LOST"
Network.TYPE_REMOTE_NEW_INCOMING_CONNECTION = "TYPE_REMOTE_NEW_INCOMING_CONNECTION"
Network.TYPE_APPLICATION_UNCONNECTED = "TYPE_APPLICATION_UNCONNECTED"

---@enum NormalMapFormat
NormalMapFormat.NONE = "NONE"
NormalMapFormat.S2CHANNEL = "S2CHANNEL"
NormalMapFormat.U3CHANNEL = "U3CHANNEL"
NormalMapFormat.U4CHANNEL = "U4CHANNEL"

---@enum PlatformId
PlatformId.UNKNOWN = "UNKNOWN"
PlatformId.WIN = "WIN"
PlatformId.MAC = "MAC"
PlatformId.XBOX_ONE = "XBOX_ONE"
PlatformId.PS4 = "PS4"
PlatformId.ANDROID = "ANDROID"
PlatformId.IOS = "IOS"
PlatformId.SWITCH = "SWITCH"
PlatformId.GGP = "GGP"
PlatformId.XBOX_SERIES = "XBOX_SERIES"
PlatformId.PS5 = "PS5"

---@enum PostProcessAntiAliasing
PostProcessAntiAliasing.OFF = "OFF"
PostProcessAntiAliasing.TAA = "TAA"
PostProcessAntiAliasing.DLAA = "DLAA"
PostProcessAntiAliasing.FSR3 = "FSR3"
PostProcessAntiAliasing.NUM = "NUM"

---@enum PresenceModes
PresenceModes.PRESENCE_IDLE = "PRESENCE_IDLE"
PresenceModes.PRESENCE_CAREER = "PRESENCE_CAREER"
PresenceModes.PRESENCE_TUTORIAL = "PRESENCE_TUTORIAL"
PresenceModes.PRESENCE_MULTIPLAYER = "PRESENCE_MULTIPLAYER"
PresenceModes.PRESENCE_MULTIPLAYER_ALONE = "PRESENCE_MULTIPLAYER_ALONE"
PresenceModes.PRESENCE_MULTIPLAYER_CROSSPLAY = "PRESENCE_MULTIPLAYER_CROSSPLAY"

---@enum RenderText
RenderText.ALIGN_LEFT = "ALIGN_LEFT"
RenderText.ALIGN_CENTER = "ALIGN_CENTER"
RenderText.ALIGN_RIGHT = "ALIGN_RIGHT"
RenderText.VERTICAL_ALIGN_BASELINE = "VERTICAL_ALIGN_BASELINE"
RenderText.VERTICAL_ALIGN_TOP = "VERTICAL_ALIGN_TOP"
RenderText.VERTICAL_ALIGN_MIDDLE = "VERTICAL_ALIGN_MIDDLE"
RenderText.VERTICAL_ALIGN_BOTTOM = "VERTICAL_ALIGN_BOTTOM"
RenderText.DEFAULT_LINE_HEIGHT_SCALE = "DEFAULT_LINE_HEIGHT_SCALE"

---@enum ReportUserReason
ReportUserReason.PLAYER_NAME = "PLAYER_NAME"
ReportUserReason.VOICE_CHAT = "VOICE_CHAT"
ReportUserReason.TEXT_CHAT = "TEXT_CHAT"
ReportUserReason.BEHAVIOR = "BEHAVIOR"
ReportUserReason.CHEATING = "CHEATING"

---@enum Reverb
Reverb.GS_CITY = "GS_CITY"
Reverb.GS_FOREST = "GS_FOREST"
Reverb.GS_INDOOR_HALL = "GS_INDOOR_HALL"
Reverb.GS_OPEN_FIELD = "GS_OPEN_FIELD"
Reverb.GS_TUNNEL = "GS_TUNNEL"

---@enum RigidBodyType
RigidBodyType.NONE = "NONE"
RigidBodyType.STATIC = "STATIC"
RigidBodyType.DYNAMIC = "DYNAMIC"
RigidBodyType.KINEMATIC = "KINEMATIC"

---@enum Savegame
Savegame.ERROR_OK = "ERROR_OK"
Savegame.ERROR_CANCELLED = "ERROR_CANCELLED"
Savegame.ERROR_DEVICE_UNAVAILABLE = "ERROR_DEVICE_UNAVAILABLE"
Savegame.ERROR_DATA_CORRUPT = "ERROR_DATA_CORRUPT"
Savegame.ERROR_BAD_INDEX = "ERROR_BAD_INDEX"
Savegame.ERROR_SCAN_FAILED = "ERROR_SCAN_FAILED"
Savegame.ERROR_SCAN_IN_PROGRESS = "ERROR_SCAN_IN_PROGRESS"
Savegame.ERROR_SAVE_FAILED = "ERROR_SAVE_FAILED"
Savegame.ERROR_SAVE_NO_SPACE = "ERROR_SAVE_NO_SPACE"
Savegame.ERROR_LOAD_FAILED = "ERROR_LOAD_FAILED"
Savegame.ERROR_LOAD_INVALID_USER = "ERROR_LOAD_INVALID_USER"
Savegame.ERROR_OPERATION_IN_PROGRESS = "ERROR_OPERATION_IN_PROGRESS"
Savegame.ERROR_CLOUD_CONFLICT = "ERROR_CLOUD_CONFLICT"
Savegame.ERROR_RESOLVE_FAILED = "ERROR_RESOLVE_FAILED"
Savegame.ERROR_QUOTA_EXCEEDED = "ERROR_QUOTA_EXCEEDED"

---@enum SaveGameResolvePolicy
SaveGameResolvePolicy.KEEP_LOCAL = "KEEP_LOCAL"
SaveGameResolvePolicy.KEEP_REMOTE = "KEEP_REMOTE"
SaveGameResolvePolicy.KEEP_BOTH = "KEEP_BOTH"

---@enum Store
Store.STORE_NONE = "STORE_NONE"
Store.STORE_CLOSED = "STORE_CLOSED"
Store.STORE_ACTIVE = "STORE_ACTIVE"
Store.STORE_COMPLETE = "STORE_COMPLETE"
Store.STORE_ABORT = "STORE_ABORT"
Store.STORE_ERROR = "STORE_ERROR"
Store.STORE_OFFLINE = "STORE_OFFLINE"
Store.STORE_GOING_ONLINE = "STORE_GOING_ONLINE"
Store.STORE_ONLINE = "STORE_ONLINE"
Store.STORE_NETFAIL = "STORE_NETFAIL"
Store.STORE_AGE_RESTRICTED = "STORE_AGE_RESTRICTED"

---@enum TerrainLoadFlags
TerrainLoadFlags.TEXTURE_CACHE = "TEXTURE_CACHE"
TerrainLoadFlags.LOD_TEXTURE_CACHE = "LOD_TEXTURE_CACHE"
TerrainLoadFlags.NORMAL_MAP_CACHE = "NORMAL_MAP_CACHE"
TerrainLoadFlags.OCCLUDER_CACHE = "OCCLUDER_CACHE"
TerrainLoadFlags.DENSITY_MAPS_USE_LOAD_DIR = "DENSITY_MAPS_USE_LOAD_DIR"
TerrainLoadFlags.TEXTURE_CACHE_USE_LOAD_DIR = "TEXTURE_CACHE_USE_LOAD_DIR"
TerrainLoadFlags.HEIGHT_MAP_USE_LOAD_DIR = "HEIGHT_MAP_USE_LOAD_DIR"
TerrainLoadFlags.NORMAL_MAP_CACHE_USE_LOAD_DIR = "NORMAL_MAP_CACHE_USE_LOAD_DIR"
TerrainLoadFlags.OCCLUDER_CACHE_USE_LOAD_DIR = "OCCLUDER_CACHE_USE_LOAD_DIR"
TerrainLoadFlags.GAME_DEFAULT = "GAME_DEFAULT"

---@enum UploadState
UploadState.UPLOADED = "UPLOADED"
UploadState.NOT_UPLOADED = "NOT_UPLOADED"
UploadState.UPLOADING = "UPLOADING"

---@enum Upnp
Upnp.ADD_PORT_SUCCESS = "ADD_PORT_SUCCESS"
Upnp.ADD_PORT_FAILED = "ADD_PORT_FAILED"
Upnp.ADD_PORT_CONFLICT = "ADD_PORT_CONFLICT"

---@enum ValarQuality
ValarQuality.OFF = "OFF"
ValarQuality.QUALITY = "QUALITY"
ValarQuality.BALANCED = "BALANCED"
ValarQuality.PERFORMANCE = "PERFORMANCE"
ValarQuality.DYNAMIC = "DYNAMIC"
ValarQuality.NUM = "NUM"

---@enum VoiceChatConnectionStatus
VoiceChatConnectionStatus.SILENT = "SILENT"
VoiceChatConnectionStatus.ACTIVE = "ACTIVE"
VoiceChatConnectionStatus.UNAVAILABLE = "UNAVAILABLE"

---@enum VoiceChatRecordingMode
VoiceChatRecordingMode.DISABLED = "DISABLED"
VoiceChatRecordingMode.MUTED = "MUTED"
VoiceChatRecordingMode.ALWAYS = "ALWAYS"
VoiceChatRecordingMode.AUTOMATIC = "AUTOMATIC"
VoiceChatRecordingMode.TEST = "TEST"

---@enum XeSSQuality
XeSSQuality.OFF = "OFF"
XeSSQuality.ULTRA_QUALITY = "ULTRA_QUALITY"
XeSSQuality.QUALITY = "QUALITY"
XeSSQuality.BALANCED = "BALANCED"
XeSSQuality.PERFORMANCE = "PERFORMANCE"
XeSSQuality.NUM = "NUM"
