---
title: g_gameSettings
description: Global g_gameSettings - Runtime introspected API
fieldTypes:
  array: 5
  function: 75
  global-ref: 1
  object: 21
  other: 2
  primitive: 97
---

# g_gameSettings

Runtime-introspected API for `g_gameSettings`.

**Source**: schemas (depth 2)  
**Fields**: 92 top-level fields

## Field Statistics

Total fields: **92**

- **Function**: 14
- **Object**: 5
- **Array**: 1
- **Global-ref**: 1
- **Primitive**: 71

## Fields by Type

<details>
<summary><strong>Functions (14)</strong></summary>

- **`setTableValueFromXML()`**
- **`new()`**
- **`setLastPlayerStyle()`**
- **`setTableValue()`**
- **`setXMLValue()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`getTableValue()`**
- **`setValue()`**
- **`saveToXMLFile()`**
- **`getValue()`**
- **`loadFromXML()`**
- **`superClass()`**

</details>

<details open>
<summary><strong>Objects/Tables (5)</strong></summary>

- **`createGame`** : `table`
- **`joinGame`** : `table`
- **`lastPlayerStyle`** : `table`
  - **Methods**: 61 available
    - `getPossibleGloves()`
    - `defaultStyle()`
    - `setFacegear()`
    - `apply()`
    - `isValid()`
    - `writeStream()`
    - `readStream()`
    - `getIsPresetUsed()`
    - `getIsMale()`
    - `convertSkinColorToScreenColor()`
    - `updateDisabledOptions()`
    - `buildPreset()`
    - `getDisabledOptionsForPreset()`
    - `getPresetByName()`
    - `getPresets()`
    - `loadConfigurationIfRequired()`
    - `getPossibleBeards()`
    - `loadFromXMLFile()`
    - `parseIndex()`
    - `setGloves()`
    - `getPossibleFootwear()`
    - `copyMinimalFrom()`
    - `getPossibleTops()`
    - `class()`
    - `copy()`
    - `saveToXMLFile()`
    - `setTop()`
    - `readStreamColor()`
    - `writeStreamColor()`
    - `print()`
    - `setHairItemColor()`
    - `setPreset()`
    - `new()`
    - `superClass()`
    - `getSlotUVs()`
    - `setBottom()`
    - `isa()`
    - `loadClothing()`
    - `getPossibleGlasses()`
    - `setGlasses()`
    - `loadColors()`
    - `setFootwear()`
    - `getPossibleFaces()`
    - `setFace()`
    - `setItemColor()`
    - `getPossibleBottoms()`
    - `getRequiredNodeFiles()`
    - `newHelper()`
    - `newRandomHelper()`
    - `setBeard()`
    - `delete()`
    - `loadConfigurationXML()`
    - `copyFrom()`
    - `getPossibleOnepieces()`
    - `setOnepiece()`
    - `getPossibleMustaches()`
    - `setMustache()`
    - `getPossibleHeadgear()`
    - `setHeadgear()`
    - `getPossibleHairStyles()`
    - `setHairStyle()`
  - **`mustacheConfig`** : `table`
  - **`beardConfig`** : `table`
  - **`atlasFilename`** : `string`
  - **`hairStyleConfig`** : `table`
  - **`presets`** : `table[]` (length: 29)
  - **`hairColors`** : `map`
  - **`filename`** : `string`
  - **`defaultClothingColors`** : `map`
  - **`bodyPartIndexByName`** : `table`
  - **`headgearConfig`** : `table`
  - **`faceNeutralDiffuseColor`** : `number[]` (length: 3)
  - **`facesByName`** : `table`
  - **`skeletonRootIndex`** : `number`
  - **`isConfigurationLoaded`** : `boolean`
  - **`disabledOptionsForSelection`** : `table`
  - **`glassesConfig`** : `table`
  - **`facegearConfig`** : `table`
  - **`hatHairstyleIndex`** : `number`
  - **`glovesConfig`** : `table`
  - **`bodyParts`** : `table[]` (length: 6)
  - **`bottomConfig`** : `table`
  - **`attachPoints`** : `table`
  - **`topConfig`** : `table`
  - **`faceConfig`** : `table`
  - **`footwearConfig`** : `table`
  - **`onepieceConfig`** : `table`
  - **`xmlFilename`** : `string`
- **`lastCreatedLicensePlate`** : `table`
  - **`characters`** : `string[]` (length: 9)
  - **`colorIndex`** : `number`
  - **`placementIndex`** : `number`
  - **`variation`** : `number`
  - **`xmlFilename`** : `string`
- **`printedSettingsChanges`** : `table`
  - **`easyArmControl`** : `string`
  - **`environmentVolume`** : `string`
  - **`invertYLook`** : `string`
  - **`isTrainTabbable`** : `string`
  - **`masterVolume`** : `string`
  - **`musicVolume`** : `string`
  - **`radioIsActive`** : `string`
  - **`radioVehicleOnly`** : `string`
  - **`radioVolume`** : `string`
  - **`showFieldInfo`** : `string`
  - **`showHelpIcons`** : `string`
  - **`showHelpTrigger`** : `string`
  - **`showTriggerMarker`** : `string`
  - **`useColorblindMode`** : `string`
  - **`vehicleVolume`** : `string`
  - **`volumeGUI`** : `string`

</details>

<details>
<summary><strong>Arrays (1)</strong></summary>

- **`frameLimitValues`** : `number[]` (length: 6)

</details>

<details>
<summary><strong>Global References (1)</strong></summary>

- **`messageCenter`** : `global-ref` → [`g_messageCenter`](./g_messageCenter.md)

</details>

<details>
<summary><strong>Primitives (71)</strong></summary>

- **`useAcre`** : `boolean`
- **`radioVolume`** : `number`
- **`useFahrenheit`** : `boolean`
- **`showHelpTrigger`** : `boolean`
- **`notifyOnChange`** : `boolean`
- **`useColorblindMode`** : `boolean`
- **`showTriggerMarker`** : `boolean`
- **`shownFreemodeWarning`** : `boolean`
- **`radioVehicleOnly`** : `boolean`
- **`lastPlayerStyleMale`** : `boolean`
- **`uiScale`** : `number`
- **`horseAbandonTimerDuration`** : `number`
- **`motorStopTimerDuration`** : `number`
- **`isSoundPlayerStreamAccessAllowed`** : `boolean`
- **`forceFeedback`** : `number`
- **`isHeadTrackingEnabled`** : `boolean`
- **`headTrackingEnabledSetByUser`** : `boolean`
- **`gamepadEnabledSetByUser`** : `boolean`
- **`cameraBobbing`** : `boolean`
- **`defaultServerPort`** : `number`
- **`onlinePresenceName`** : `string`
- **`ingameMapFruitFilter`** : `string`
- **`ingameMapSoilFilter`** : `number`
- **`ingameMapGrowthFilter`** : `number`
- **`inputHelpMode`** : `number`
- **`showMultiplayerNames`** : `boolean`
- **`showHelpIcons`** : `boolean`
- **`joystickVibrationEnabled`** : `boolean`
- **`showAllMods`** : `boolean`
- **`voiceMode`** : `number`
- **`hints`** : `boolean`
- **`volumeVoiceInput`** : `number`
- **`cameraTilting`** : `boolean`
- **`volumeVoice`** : `number`
- **`gyroscopeSteering`** : `boolean`
- **`musicVolume`** : `number`
- **`moneyUnit`** : `number`
- **`ingameMapFilter`** : `number`
- **`ingameMapState`** : `number`
- **`steeringSensitivity`** : `number`
- **`steeringBackSpeed`** : `number`
- **`vehicleArmSensitivity`** : `number`
- **`cameraSensitivity`** : `number`
- **`voiceInputThreshold`** : `number`
- **`masterVolume`** : `number`
- **`mpLanguage`** : `number`
- **`showHelpMenu`** : `boolean`
- **`woodHarvesterAutoCut`** : `boolean`
- **`hudSpeedGauge`** : `number`
- **`gearShiftMode`** : `number`
- **`directionChangeMode`** : `number`
- **`invertYLook`** : `boolean`
- **`cameraCheckCollision`** : `boolean`
- **`activeSuspensionCamera`** : `boolean`
- **`useWorldCamera`** : `boolean`
- **`resetCamera`** : `boolean`
- **`maxNumMirrors`** : `number`
- **`lightsProfile`** : `number`
- **`isTrainTabbable`** : `boolean`
- **`fovY`** : `number`
- **`frameLimit`** : `number`
- **`showFieldInfo`** : `boolean`
- **`useMiles`** : `boolean`
- **`easyArmControl`** : `boolean`
- **`realBeaconLights`** : `boolean`
- **`realBeaconLightBrightness`** : `number`
- **`volumeGUI`** : `number`
- **`radioIsActive`** : `boolean`
- **`environmentVolume`** : `number`
- **`isGamepadEnabled`** : `boolean`
- **`vehicleVolume`** : `number`

</details>


## Usage Example

```lua
-- Access g_gameSettings fields
```
