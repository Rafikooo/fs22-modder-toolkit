---
title: Engine Functions - Remove
description: Remove functions from FS22 engine
---

# Remove Functions

6 functions starting with `remove`.

### `removeAllDifferentials()`

remove all differential

**Parameters:**

- `transformId` (`integer`) - transformId

```lua
removeAllDifferentials(transformId)
```

### `removeAudioSourceSampleElement()`

Remove a sample elements from an AudioSource

**Parameters:**

- `objectId` (`integer`) - objectId
- `sampleElementIndex` (`integer`) - sampleElementIndex

```lua
removeAudioSourceSampleElement(objectId, sampleElementIndex)
```

### `removeCCT()`

Remove character controller

**Parameters:**

- `characterIndex` (`integer`) - characterIndex

```lua
removeCCT(characterIndex)
```

### `removeFromPhysics()`

Remove from physics

**Parameters:**

- `transformId` (`integer`) - transformId
- `_` (`integer`)
- `_` (`integer`)

```lua
removeFromPhysics(transformId, _, _)
```

### `removeUserAttribute()`

Remove user attribute value

**Parameters:**

- `objectId` (`integer`) - objectId
- `attributeName` (`string`) - name of the attribute to remove

```lua
removeUserAttribute(objectId, attributeName)
```

### `removeXMLProperty()`

Remove XML property.

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `xmlPath` (`string`) - Path to element or attribute

**Returns:** `boolean`

```lua
local result = removeXMLProperty(xmlId, xmlPath)
```

