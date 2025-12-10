---
title: Engine Functions - Other
description: Other functions from FS22 engine
---

# Other Functions

16 functions starting with `other`.

### `base64Decode()`

base64 decode

**Parameters:**

- `input` (`string`) - input

**Returns:** `bytearray`

```lua
local result = base64Decode(input)
```

### `base64Encode()`

base64 encode

**Parameters:**

- `input` (`bytearray`) - input

**Returns:** `string`

```lua
local result = base64Encode(input)
```

### `clone()`

Clone scenegraph object

**Parameters:**

- `objectId` (`integer`) - objectId
- `groupUnderParent` (`boolean`) - groupUnderParent
- `callOnCreate` (`boolean`) - callOnCreate
- `addPhysics` (`boolean`) - addPhysics

**Returns:** `integer`

```lua
local result = clone(objectId, groupUnderParent, callOnCreate, addPhysics)
```

### `delete()`

Delete Entity/Object

**Parameters:**

- `objectId` (`integer`) - objectId
- `foliageBendingSystemId` (`integer`)
- `objectId` (`integer`) - id of the bending object, such as returned by createFoliageBendingRectangle

```lua
delete(objectId, foliageBendingSystemId, objectId)
```

### `link()`

Link node to another node

**Parameters:**

- `parentNodeId` (`integer`) - parentNodeId
- `childNodeId` (`integer`) - childNodeId
- `index` (`integer`) - index

```lua
link(parentNodeId, childNodeId, index)
```

### `print()`

Print to console

**Parameters:**

- `arg1` (`any`) - arg1
- `arg2` (`any`) - arg2
- `arg3` (`any`) - arg3
- `arg4` (`any`) - arg4
- `arg5` (`any`) - arg5
- `arg6` (`any`) - arg6
- `arg7` (`any`) - arg7
- `arg8` (`any`) - arg8

```lua
print(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
```

### `project()`

Transform vector from world space into screen space

**Parameters:**

- `wx` (`float`) - wx
- `wy` (`float`) - wy
- `wz` (`float`) - wz
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)

**Returns:** `float`

```lua
local result = project(wx, wy, wz, _, _, _, _, _)
```

### `set2DMaskFromOverlay()`

Set mask for 2d rendering

**Parameters:**

- `textureId` (`integer`)
- `maskAlphaOnly` (`boolean`) - if true, applies the mask to the alpha channel only, otherwise to all 4 channels
- `x` (`float`) - x position
- `y` (`float`) - y position
- `width` (`float`)
- `height` (`float`)

```lua
set2DMaskFromOverlay(textureId, maskAlphaOnly, x, y, width, height)
```

### `set2DMaskFromTexture()`

Set mask for 2d rendering

**Parameters:**

- `textureId` (`integer`)
- `maskAlphaOnly` (`boolean`) - if true, applies the mask to the alpha channel only, otherwise to all 4 channels
- `x` (`float`) - x position
- `y` (`float`) - y position
- `width` (`float`)
- `height` (`float`)

```lua
set2DMaskFromTexture(textureId, maskAlphaOnly, x, y, width, height)
```

### `source()`

Source script file

**Parameters:**

- `filename` (`string`) - filename
- `environment` (`ref`) - environment

```lua
source(filename, environment)
```

### `unlink()`

Unlink node from parent

**Parameters:**

- `objectId` (`integer`) - objectId

```lua
unlink(objectId)
```

### `utf8Strlen()`

Returns the length of an utf8 formated string

**Parameters:**

- `utf8string` (`string`) - utf8string

**Returns:** `integer`

```lua
local result = utf8Strlen(utf8string)
```

### `utf8Substr()`

Returns a sub string of an utf8 formated string

**Parameters:**

- `utf8string` (`string`) - utf8string
- `startIndex` (`integer`) - startIndex
- `length` (`integer`) - length

**Returns:** `string`

```lua
local result = utf8Substr(utf8string, startIndex, length)
```

### `utf8ToLower()`

Returns a lower case string of an utf8 formated string

**Parameters:**

- `utf8string` (`string`) - utf8string

**Returns:** `string`

```lua
local result = utf8ToLower(utf8string)
```

### `utf8ToUnicode()`

Converts an utf8 string to unicode

**Parameters:**

- `utf8string` (`string`) - utf8string

**Returns:** `integer`

```lua
local result = utf8ToUnicode(utf8string)
```

### `utf8ToUpper()`

Return a upper case string of an utf8 formated string

**Parameters:**

- `utf8string` (`string`) - utf8string

**Returns:** `string`

```lua
local result = utf8ToUpper(utf8string)
```

