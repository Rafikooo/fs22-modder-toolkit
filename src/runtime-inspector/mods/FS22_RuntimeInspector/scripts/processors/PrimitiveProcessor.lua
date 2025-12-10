-- processors/PrimitiveProcessor.lua
-- Handles primitive types: string, number, boolean (BFS version)

PrimitiveProcessor = {}
PrimitiveProcessor.priority = 30
PrimitiveProcessor.name = "Primitive"

function PrimitiveProcessor:supports(value, context)
    local t = type(value)
    return t == "string" or t == "number" or t == "boolean"
end

function PrimitiveProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath
    local valueType = type(value)

    setXMLString(xmlId, path .. "#type", valueType)

    -- NOTE: Value export removed for stub generation
    -- We only need type information, not runtime values
    -- (Runtime values are session-specific and not useful for IDE autocomplete)

    return {}  -- No children
end
