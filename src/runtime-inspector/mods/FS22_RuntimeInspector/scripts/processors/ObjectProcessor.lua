-- processors/ObjectProcessor.lua
-- Handles regular objects/tables with string keys only
-- Example: {foo = "bar", baz = 123, method = function() end}
-- This is the most common case - normal Lua tables/objects

ObjectProcessor = {}
ObjectProcessor.priority = 70
ObjectProcessor.name = "Object"

function ObjectProcessor:supports(value, context)
    if type(value) ~= "table" then return false end

    -- Check if ALL keys are strings
    for key, _ in pairs(value) do
        if type(key) ~= "string" then
            return false
        end
    end

    return true
end

function ObjectProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath
    local currentDepth = item.depth

    setXMLString(xmlId, path .. "#type", "table")

    -- Mark as visited
    local objKey = tostring(value)
    context.visited[objKey] = true

    -- Check if we should explore children
    local nextDepth = currentDepth + 1

    -- If next depth exceeds limit, don't explore children
    if nextDepth > context.maxDepth then
        return {}  -- No children
    end

    -- Get sorted keys
    local keys = TableHelpers.sortedKeys(value)

    -- Build children array for BFS
    local children = {}
    local fieldIndex = 0

    for _, key in ipairs(keys) do
        local fieldValue = value[key]
        if fieldValue ~= nil then
            -- Use indexed field elements (FS22 XML API requires explicit indices for siblings)
            local childPath = path .. ".field(" .. fieldIndex .. ")"
            fieldIndex = fieldIndex + 1

            -- Write key attribute (creates self-closing element automatically)
            setXMLString(xmlId, childPath .. "#key", tostring(key))

            -- Create child item for queue
            local childItem = {
                value = fieldValue,
                xmlPath = childPath,
                depth = nextDepth,
                fieldName = key,
                readablePath = item.readablePath .. "." .. tostring(key)
            }

            table.insert(children, childItem)
        end
    end

    return children  -- Normal BFS expansion
end
