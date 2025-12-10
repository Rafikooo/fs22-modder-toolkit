-- processors/ArrayProcessor.lua
-- Handles sequential arrays with numeric keys starting from 1
-- Example: {[1] = "foo", [2] = "bar", [3] = "baz"}

ArrayProcessor = {}
ArrayProcessor.priority = 60
ArrayProcessor.name = "Array"

function ArrayProcessor:supports(value, context)
    if type(value) ~= "table" then return false end

    -- Check if ALL keys are sequential integers starting from 1
    local hasAnyKey = false
    local expectedIndex = 1

    for key, _ in pairs(value) do
        hasAnyKey = true

        -- Key must be a number
        if type(key) ~= "number" then
            return false
        end

        -- Key must be an integer
        if math.floor(key) ~= key then
            return false
        end

        -- Track max index for sequential check
        if key > expectedIndex then
            expectedIndex = key
        end
    end

    if not hasAnyKey then
        return false  -- Empty table
    end

    -- Verify sequential: must have all keys from 1 to max
    for i = 1, expectedIndex do
        if value[i] == nil then
            return false  -- Gap in sequence
        end
    end

    return true
end

function ArrayProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath

    -- Count elements
    local count = 0
    for _ in pairs(value) do
        count = count + 1
    end

    -- Sample first element for valuetype
    local firstValue = value[1]
    local valuetype = type(firstValue)

    -- Check if all values have same type (homogeneous array)
    local isHomogeneous = true
    for _, v in pairs(value) do
        if type(v) ~= valuetype then
            isHomogeneous = false
            break
        end
    end

    setXMLString(xmlId, path .. "#type", "array")
    setXMLInt(xmlId, path .. "#length", count)
    setXMLString(xmlId, path .. "#valuetype", valuetype)

    if not isHomogeneous then
        setXMLString(xmlId, path .. "#homogeneous", "false")
    end

    -- Mark as visited
    local objKey = tostring(value)
    context.visited[objKey] = true

    -- Track statistics
    context.statsCollector:track("array", item.readablePath, count, context)

    return {}  -- Skip children (array elements)
end
