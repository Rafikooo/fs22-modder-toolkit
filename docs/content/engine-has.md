---
title: Engine Functions - Has
description: Has functions from FS22 engine
---

# Has Functions

1 functions starting with `has`.

### `hasXMLProperty()`

Returns if an XML element at given path is present. For checking the presence of xml attributes use 'getXMLString ~= nil' instead

**Parameters:**

- `xmlId` (`integer`) - xmlId
- `xmlElementPath` (`string`) - Path to an xml element

**Returns:** `boolean`

```lua
local result = hasXMLProperty(xmlId, xmlElementPath)
```

