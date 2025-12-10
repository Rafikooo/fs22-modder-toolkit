-- processors/TableProcessor.lua
-- Fallback processor for tables that don't match specialized patterns
-- If this processor runs, it means we have an edge case not covered by:
--   - ArrayProcessor (sequential numeric keys)
--   - MapProcessor (non-sequential/mixed keys)
--   - ObjectProcessor (string keys only)
-- This should be rare - log it to catch unhandled patterns

TableProcessor = {}
TableProcessor.priority = 999  -- Always last (fallback)
TableProcessor.name = "Table"

function TableProcessor:supports(value, context)
    return type(value) == "table"
end

-- BFS version: returns array of children to enqueue
function TableProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath
    local currentDepth = item.depth

    -- WARNING: This fallback processor should rarely run
    -- Log to identify unhandled table patterns
    print(string.format("[TableProcessor] UNHANDLED TABLE PATTERN at %s", item.readablePath))

    setXMLString(xmlId, path .. "#type", "table")
    setXMLString(xmlId, path .. "#warning", "Unhandled pattern - fell back to generic table processor")

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
            -- NOTE: functionSource is no longer used - function metadata is extracted
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

    return children
end
