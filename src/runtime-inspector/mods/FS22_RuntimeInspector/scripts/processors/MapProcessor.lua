-- processors/MapProcessor.lua
-- Handles maps with numeric keys (non-sequential) or mixed keys
-- Example: {[100906] = obj1, [100907] = obj2} (node IDs)
-- Example: {[1] = obj, foo = "bar"} (mixed)

MapProcessor = {}
MapProcessor.priority = 65
MapProcessor.name = "Map"

function MapProcessor:supports(value, context)
    if type(value) ~= "table" then return false end

    local hasNumericKey = false
    local hasStringKey = false
    local numericKeys = {}

    for key, _ in pairs(value) do
        local keyType = type(key)

        if keyType == "number" then
            hasNumericKey = true
            table.insert(numericKeys, key)
        elseif keyType == "string" then
            hasStringKey = true
        else
            -- table/function/userdata keys - treat as map
            return true
        end
    end

    -- Mixed keys → map
    if hasNumericKey and hasStringKey then
        return true
    end

    -- Only numeric keys → check if sequential
    if hasNumericKey and not hasStringKey then
        -- Sort to check sequence
        table.sort(numericKeys)

        -- Check if sequential starting from 1
        local isSequential = true
        for i, key in ipairs(numericKeys) do
            if key ~= i then
                isSequential = false
                break
            end
        end

        -- Non-sequential numeric → map
        -- Sequential → let ArrayProcessor handle it
        return not isSequential
    end

    return false  -- Only string keys → ObjectProcessor handles it
end

function MapProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath

    -- Analyze key types
    local numericCount = 0
    local stringCount = 0
    local otherCount = 0
    local firstKey = nil
    local firstValue = nil

    for key, val in pairs(value) do
        if firstKey == nil then
            firstKey = key
            firstValue = val
        end

        local keyType = type(key)
        if keyType == "number" then
            numericCount = numericCount + 1
        elseif keyType == "string" then
            stringCount = stringCount + 1
        else
            otherCount = otherCount + 1
        end
    end

    local totalCount = numericCount + stringCount + otherCount

    -- Determine keytype
    local keytype = "mixed"
    if otherCount > 0 then
        keytype = "mixed"
    elseif numericCount > 0 and stringCount == 0 then
        keytype = "number"
    elseif stringCount > 0 and numericCount == 0 then
        keytype = "string"
    end

    -- Determine valuetype from first element
    local valuetype = type(firstValue)

    setXMLString(xmlId, path .. "#type", "map")
    setXMLString(xmlId, path .. "#keytype", keytype)
    setXMLString(xmlId, path .. "#valuetype", valuetype)
    setXMLInt(xmlId, path .. "#entries", totalCount)

    -- Mark as visited
    local objKey = tostring(value)
    context.visited[objKey] = true

    -- Track statistics
    context.statsCollector:track("map", item.readablePath, totalCount, context)

    return {}  -- Skip children (map entries)
end
