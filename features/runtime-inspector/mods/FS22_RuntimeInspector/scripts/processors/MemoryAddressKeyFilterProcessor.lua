-- processors/MemoryAddressKeyFilterProcessor.lua
-- Filters out table fields with memory address keys (reverse hash maps)
-- These are internal Lua mappings like: ["table: 0x01383b6270"] = 3
-- Completely useless for stub generation as keys are runtime memory addresses

MemoryAddressKeyFilterProcessor = {}
MemoryAddressKeyFilterProcessor.priority = 45  -- Run before FullTableProcessor (50)
MemoryAddressKeyFilterProcessor.name = "MemoryAddressKeyFilter"

function MemoryAddressKeyFilterProcessor:supports(value, context)
    -- Only process tables
    return type(value) == "table"
end

function MemoryAddressKeyFilterProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath

    -- Check if this table contains ONLY memory address keys
    local hasMemoryKeys = false
    local hasNormalKeys = false
    local memoryKeyCount = 0
    local totalKeys = 0

    for key, _ in pairs(value) do
        totalKeys = totalKeys + 1
        local keyType = type(key)

        -- Check if key is a table (object reference as key)
        -- OR a string representation of table address
        if keyType == "table" then
            hasMemoryKeys = true
            memoryKeyCount = memoryKeyCount + 1
        elseif keyType == "string" and key:match("^table: 0x%x+$") then
            hasMemoryKeys = true
            memoryKeyCount = memoryKeyCount + 1
        else
            hasNormalKeys = true
        end
    end

    -- If ALL keys are memory addresses, mark as reverse hash map and skip children
    if hasMemoryKeys and not hasNormalKeys and totalKeys > 0 then
        setXMLString(xmlId, path .. "#type", "reverse-hash-map")
        setXMLInt(xmlId, path .. "#entries", memoryKeyCount)

        -- Track this for statistics
        context.statsCollector:track("reverseHashMap", item.readablePath, memoryKeyCount, context)

        return {}  -- Skip children (no point exporting memory addresses)
    end

    -- If mixed or no memory keys, pass to next processor
    return nil
end
