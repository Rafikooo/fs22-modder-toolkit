-- processors/CycleProcessor.lua
-- Detects circular references (BFS version)

CycleProcessor = {}
CycleProcessor.priority = 40
CycleProcessor.name = "Cycle"

function CycleProcessor:supports(value, context)
    if type(value) ~= "table" then
        return false
    end

    local objKey = tostring(value)
    return context.visited[objKey] == true
end

function CycleProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath
    local objKey = tostring(value)

    setXMLString(xmlId, path .. "#type", "table")
    setXMLString(xmlId, path .. "#ref", objKey)

    -- Track cycle detection (use readable path for stats)
    context.statsCollector:track("cycle", item.readablePath, value, context)

    return {}  -- No children (it's a cycle)
end
