-- processors/UserdataProcessor.lua
-- Handles userdata values (BFS version)

UserdataProcessor = {}
UserdataProcessor.priority = 35
UserdataProcessor.name = "Userdata"

function UserdataProcessor:supports(value, context)
    return type(value) == "userdata"
end

function UserdataProcessor:process(xmlId, item, context)
    local path = item.xmlPath
    local value = item.value

    setXMLString(xmlId, path .. "#type", "userdata")
    setXMLString(xmlId, path .. "#value", "userdata:" .. tostring(value))
    return {}  -- No children
end
