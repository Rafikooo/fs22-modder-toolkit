---
title: g_sleepManager
description: Global g_sleepManager - Runtime introspected API
fieldTypes:
  array: 3
  function: 48
  object: 2
  other: 3
  primitive: 60
---

# g_sleepManager

Runtime-introspected API for `g_sleepManager`.

**Source**: schemas (depth 2)  
**Fields**: 42 top-level fields

## Field Statistics

Total fields: **42**

- **Function**: 27
- **Object**: 2
- **Array**: 1
- **Primitive**: 12

## Fields by Type

<details>
<summary><strong>Functions (27)</strong></summary>

- **`onSleepRequestTimeout()`**
- **`new()`**
- **`onSleepNotAllowed()`**
- **`isa()`**
- **`copy()`**
- **`class()`**
- **`resetRequest()`**
- **`startSleep()`**
- **`onSleepRequestDenied()`**
- **`stopSleep()`**
- **`unloadMapData()`**
- **`loadMapData()`**
- **`getCamera()`**
- **`startSleepRequest()`**
- **`sleepDialogYesNo()`**
- **`getIsSleeping()`**
- **`superClass()`**
- **`onSleepRequestYesNo()`**
- **`onSleepRequest()`**
- **`update()`**
- **`draw()`**
- **`getCanSleep()`**
- **`getFallbackCamera()`**
- **`onUserRemoved()`**
- **`showDialog()`**
- **`onSleepResponse()`**
- **`onSleepRequestPending()`**

</details>

<details open>
<summary><strong>Objects/Tables (2)</strong></summary>

- **`animationBackgroundOverlay`** : `table`
  - **Methods**: 21 available
    - `new()`
    - `draw()`
    - `setVisible()`
    - `getVisible()`
    - `isa()`
    - `copy()`
    - `class()`
    - `setImage()`
    - `setColor()`
    - `setPosition()`
    - `resetDimensions()`
    - `getPosition()`
    - `setUVs()`
    - `delete()`
    - `setAlignment()`
    - `getScale()`
    - `setScale()`
    - `setRotation()`
    - `setInvertX()`
    - `setDimension()`
    - `superClass()`
  - **`getIsVisible`** : `function-ref`
  - **`render`** : `function-ref`
  - **`setIsVisible`** : `function-ref`
  - **`scaleWidth`** : `number`
  - **`defaultHeight`** : `number`
  - **`defaultWidth`** : `number`
  - **`offsetY`** : `number`
  - **`offsetX`** : `number`
  - **`uvs`** : `number[]` (length: 8)
  - **`g`** : `number`
  - **`visible`** : `boolean`
  - **`a`** : `number`
  - **`rotation`** : `number`
  - **`b`** : `number`
  - **`r`** : `number`
  - **`height`** : `number`
  - **`width`** : `number`
  - **`rotationCenterY`** : `number`
  - **`debugEnabled`** : `boolean`
  - **`overlayId`** : `number`
  - **`rotationCenterX`** : `number`
  - **`y`** : `number`
  - **`x`** : `number`
  - **`alignmentHorizontal`** : `number`
  - **`invertX`** : `boolean`
  - **`filename`** : `string`
  - **`alignmentVertical`** : `number`
  - **`scaleHeight`** : `number`
- **`animationOverlay`** : `table`
  - **`a`** : `number`
  - **`alignmentHorizontal`** : `number`
  - **`alignmentVertical`** : `number`
  - **`b`** : `number`
  - **`debugEnabled`** : `boolean`
  - **`defaultHeight`** : `number`
  - **`defaultWidth`** : `number`
  - **`filename`** : `string`
  - **`g`** : `number`
  - **`height`** : `number`
  - **`invertX`** : `boolean`
  - **`offsetX`** : `number`
  - **`offsetY`** : `number`
  - **`overlayId`** : `number`
  - **`r`** : `number`
  - **`rotation`** : `number`
  - **`rotationCenterX`** : `number`
  - **`rotationCenterY`** : `number`
  - **`scaleHeight`** : `number`
  - **`scaleWidth`** : `number`
  - **`uvs`** : `number[]` (length: 8)
  - **`visible`** : `boolean`
  - **`width`** : `number`
  - **`x`** : `number`
  - **`y`** : `number`

</details>

<details>
<summary><strong>Arrays (1)</strong></summary>

- **`animationRefSize`** : `number[]` (length: 2)

</details>

<details>
<summary><strong>Primitives (12)</strong></summary>

- **`isSleeping`** : `boolean`
- **`animationTimer`** : `number`
- **`animationNumFrames`** : `number`
- **`requestedTargetTime`** : `number`
- **`requestedTime`** : `number`
- **`requestAnswer`** : `boolean`
- **`isRequestPending`** : `boolean`
- **`loadedMapData`** : `boolean`
- **`animationOffset`** : `number`
- **`animationSpeed`** : `number`
- **`wakeUpTime`** : `number`
- **`animationFrameSize`** : `number`

</details>


## Usage Example

```lua
-- Access g_sleepManager fields
```
