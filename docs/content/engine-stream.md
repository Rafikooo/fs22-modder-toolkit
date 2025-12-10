---
title: Engine Functions - Stream
description: Stream functions from FS22 engine
---

# Stream Functions

33 functions starting with `stream`.

### `streamAlignReadToByteBoundary()`

Stream align read to byte boundary

**Parameters:**

- `streamId` (`integer`) - streamId

```lua
streamAlignReadToByteBoundary(streamId)
```

### `streamAlignWriteToByteBoundary()`

Stream align write to byte boundary

**Parameters:**

- `streamId` (`integer`) - streamId

```lua
streamAlignWriteToByteBoundary(streamId)
```

### `streamGetNumOfUnreadBits()`

Stream get number of unread bits

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamGetNumOfUnreadBits(streamId)
```

### `streamGetReadOffset()`

Stream get read offset

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamGetReadOffset(streamId)
```

### `streamGetWriteOffset()`

Return the write pointer offset in bytes

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamGetWriteOffset(streamId)
```

### `streamI3DFile()`

Stream I3D file

**Parameters:**

- `filename` (`string`) - filename
- `callbackFunctionName` (`string`) - callbackFunctionName
- `target` (`object`) - target
- `args` (`object`) - args
- `addPhysics` (`boolean`) - addPhysics
- `callOnCreate` (`boolean`) - callOnCreate
- `verbose` (`boolean`) - verbose

**Returns:** `integer`

```lua
local result = streamI3DFile(filename, callbackFunctionName, target, args, addPhysics, callOnCreate, verbose)
```

### `streamReadBool()`

Stream read boolean

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `boolean`

```lua
local result = streamReadBool(streamId)
```

### `streamReadFloat32()`

Stream read 32bit float

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `float`

```lua
local result = streamReadFloat32(streamId)
```

### `streamReadInt16()`

Stream read 16bit signed integer

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamReadInt16(streamId)
```

### `streamReadInt32()`

Stream read 32bit signed integer

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamReadInt32(streamId)
```

### `streamReadInt8()`

Stream read 8bit signed integer

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamReadInt8(streamId)
```

### `streamReadIntN()`

Stream read 32bit signed integer

**Parameters:**

- `streamId` (`integer`) - streamId
- `numberofBits` (`integer`) - numberofBits

**Returns:** `integer`

```lua
local result = streamReadIntN(streamId, numberofBits)
```

### `streamReadManualTimestamp()`

Stream read manual timestamp

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamReadManualTimestamp(streamId)
```

### `streamReadString()`

Stream read 32bit float

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `string`

```lua
local result = streamReadString(streamId)
```

### `streamReadUInt16()`

Stream write 16-bit unsigned integer.

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamReadUInt16(streamId)
```

### `streamReadUInt8()`

Stream read 8-bit unsigned integer.

**Parameters:**

- `streamId` (`integer`) - streamId

**Returns:** `integer`

```lua
local result = streamReadUInt8(streamId)
```

### `streamReadUIntN()`

Stream write N-bit unsigned integer. 0&lt;N&lt;32.

**Parameters:**

- `streamId` (`integer`) - streamId
- `numberOfBits` (`integer`) - numberOfBits

**Returns:** `integer`

```lua
local result = streamReadUIntN(streamId, numberOfBits)
```

### `streamSetReadOffset()`

Set the read pointer to the given offset in bytes

**Parameters:**

- `streamId` (`integer`) - streamId
- `offset` (`integer`) - offset

```lua
streamSetReadOffset(streamId, offset)
```

### `streamSetWriteOffset()`

Set the write pointer to the given offset in bytes

**Parameters:**

- `streamId` (`integer`) - streamId
- `offset` (`integer`) - offset

```lua
streamSetWriteOffset(streamId, offset)
```

### `streamSharedI3DFile()`

Stream shared I3D file. Can call the callback in the same callstack when the file is already loaded

**Parameters:**

- `filename` (`string`) - filename
- `callbackFunctionName` (`string`) - callbackFunctionName
- `target` (`object`) - target
- `args` (`object`) - args
- `addPhysics` (`boolean`) - addPhysics
- `callOnCreate` (`boolean`) - callOnCreate
- `verbose` (`boolean`) - verbose

**Returns:** `integer`

```lua
local result = streamSharedI3DFile(filename, callbackFunctionName, target, args, addPhysics, callOnCreate, verbose)
```

### `streamWriteBool()`

Stream write boolean

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`boolean`) - value

**Returns:** `boolean`

```lua
local result = streamWriteBool(streamId, value)
```

### `streamWriteFloat32()`

Stream write 32bit float

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`float`) - value

```lua
streamWriteFloat32(streamId, value)
```

### `streamWriteInt16()`

Stream write 16bit signed integer

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`integer`) - value

```lua
streamWriteInt16(streamId, value)
```

### `streamWriteInt32()`

Stream write 32bit signed integer

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`integer`) - value

```lua
streamWriteInt32(streamId, value)
```

### `streamWriteInt8()`

Stream write 8bit signed integer

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`integer`) - value

```lua
streamWriteInt8(streamId, value)
```

### `streamWriteIntN()`

Stream write N bit signed integer. 0 &lt; N &lt; 32.

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`integer`) - value
- `numberOfBits` (`integer`) - numberOfBits

```lua
streamWriteIntN(streamId, value, numberOfBits)
```

### `streamWriteManualTimestamp()`

Stream write manual timestamp

**Parameters:**

- `streamId` (`integer`) - streamId
- `timestamp` (`integer`) - timestamp

```lua
streamWriteManualTimestamp(streamId, timestamp)
```

### `streamWriteStream()`

Stream write stream

**Parameters:**

- `streamId` (`integer`) - streamId
- `streamSrcId` (`integer`) - streamSrcId
- `numBits` (`integer`) - numBits
- `useReadStream` (`boolean`) - useReadStream

```lua
streamWriteStream(streamId, streamSrcId, numBits, useReadStream)
```

### `streamWriteString()`

Stream write string

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`string`) - value

```lua
streamWriteString(streamId, value)
```

### `streamWriteTimestamp()`

Stream write timestamp

**Parameters:**

- `streamId` (`integer`) - streamId

```lua
streamWriteTimestamp(streamId)
```

### `streamWriteUInt16()`

Stream write 16-bit unsigned integer.

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`integer`) - value

```lua
streamWriteUInt16(streamId, value)
```

### `streamWriteUInt8()`

Stream write 8-bit unsigned integer.

**Parameters:**

- `streamId` (`integer`) - streamId
- `uint8` (`integer`) - uint8

```lua
streamWriteUInt8(streamId, uint8)
```

### `streamWriteUIntN()`

Stream write N-bit unsigned integer. 0&lt;N&lt;32.

**Parameters:**

- `streamId` (`integer`) - streamId
- `value` (`integer`) - value
- `numberofBits` (`integer`) - numberofBits
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`integer`)
- `_` (`integer`)
- `_` (`float`)
- `_` (`integer`)
- `_` (`integer`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`unknown`) - (optional)

**Returns:** `integer`

```lua
local result = streamWriteUIntN(streamId, value, numberofBits, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
```

