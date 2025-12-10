---
title: Engine Functions - Render
description: Render functions from FS22 engine
---

# Render Functions

2 functions starting with `render`.

### `renderOverlay()`

Render overlay

**Parameters:**

- `overlayId` (`integer`) - overlayId
- `x` (`float`) - x
- `y` (`float`) - y
- `width` (`float`) - width
- `height` (`float`) - height

```lua
renderOverlay(overlayId, x, y, width, height)
```

### `renderText()`

Render text to viewport. See 'asciiToUtf8' to convert to utf8

**Parameters:**

- `x` (`float`) - x
- `y` (`float`) - y
- `size` (`float`) - size
- `str` (`string`) - str
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`float`)
- `_` (`string`)
- `_` (`string`)

**Returns:** `string`

```lua
local result = renderText(x, y, size, str, _, _, _, _, _, _, _, _, _)
```

