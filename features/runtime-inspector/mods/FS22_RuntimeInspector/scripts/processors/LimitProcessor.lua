-- processors/LimitProcessor.lua
-- Handles depth limit (BFS version - node limit handled in main loop)

LimitProcessor = {}
LimitProcessor.priority = 10
LimitProcessor.name = "Limit"

function LimitProcessor:supports(value, context)
    -- Not used in BFS version - limit checked in main loop
    return false
end

function LimitProcessor:process(xmlId, item, context)
    -- Not used in BFS version - limit checked in main loop
    return {}
end
