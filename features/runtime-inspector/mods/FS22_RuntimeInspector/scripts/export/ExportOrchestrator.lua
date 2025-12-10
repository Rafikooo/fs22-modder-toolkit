-- export/ExportOrchestrator.lua
-- Responsible for: BFS traversal and node processing coordination
-- SRP: Single place for tree traversal algorithm and processor chain dispatch

ExportOrchestrator = {}

--- Main BFS export orchestration
-- @param name string Global variable name
-- @param obj any Lua object to export
-- @param depth number Maximum depth to traverse
-- @param xmlId number XML file handle
-- @param context table Export context
-- @param processors table Array of registered processors (sorted by priority)
-- @param debugMode boolean Whether to add processor attribution
-- @return boolean Success status
function ExportOrchestrator.orchestrate(name, obj, depth, xmlId, context, processors, debugMode)
    -- BFS: Initialize queue with root object
    local queue = {{
        value = obj,
        xmlPath = "schema",
        depth = 0,
        fieldName = nil,
        readablePath = name,
        functionSource = nil
    }}

    local currentDepth = 0
    local nodesInCurrentLevel = 0

    -- Start timer for level 0
    context.levelStartTime = RuntimeInspector:getClock()

    -- BFS main loop: process level by level
    while #queue > 0 do
        local item = table.remove(queue, 1)  -- FIFO

        -- Detect when we move to next level
        if item.depth > currentDepth then
            ExportOrchestrator.recordLevelTiming(context, currentDepth, nodesInCurrentLevel)
            currentDepth = item.depth
            nodesInCurrentLevel = 0
            context.levelStartTime = RuntimeInspector:getClock()
        end

        -- Check node limit BEFORE processing
        if context.nodesProcessed >= context.maxNodes then
            context.lastCompleteDepth = currentDepth - 1
            print(string.format("[Export] Node limit reached (%d). Last complete depth: %d",
                context.maxNodes, context.lastCompleteDepth))
            break
        end

        -- Track nodes at this depth
        if not context.nodesAtDepth[item.depth] then
            context.nodesAtDepth[item.depth] = 0
        end
        context.nodesAtDepth[item.depth] = context.nodesAtDepth[item.depth] + 1

        -- Process this node and get children
        local children = ExportOrchestrator.processNode(xmlId, item, context, processors, debugMode)

        -- Add children to END of queue (BFS), but only if within depth limit
        for _, child in ipairs(children) do
            if child.depth <= context.maxDepth then
                table.insert(queue, child)
            end
        end

        nodesInCurrentLevel = nodesInCurrentLevel + 1
    end

    -- Record timing for final level
    if nodesInCurrentLevel > 0 then
        ExportOrchestrator.recordLevelTiming(context, currentDepth, nodesInCurrentLevel)

        if #queue == 0 and not context.lastCompleteDepth then
            print(string.format("[Export]   Level %d complete (%d nodes, %.3fs)",
                currentDepth, nodesInCurrentLevel, context.levelTimings[currentDepth].duration))
        end
    end

    return true
end

--- Record timing for a completed level
-- @param context table Export context
-- @param level number Depth level
-- @param nodeCount number Number of nodes processed
local function recordLevelTiming(context, level, nodeCount)
    local levelDuration = RuntimeInspector:getClock() - context.levelStartTime
    context.levelTimings[level] = {
        duration = levelDuration,
        nodes = nodeCount
    }
    print(string.format("[Export]   Level %d complete (%d nodes, %.3fs)",
        level, nodeCount, levelDuration))
end
ExportOrchestrator.recordLevelTiming = recordLevelTiming

--- Process a single node from the queue using processor chain
-- @param xmlId number XML file handle
-- @param item table Queue item {value, xmlPath, depth, fieldName, readablePath, functionSource}
-- @param context table Export context
-- @param processors table Array of processors (sorted by priority)
-- @param debugMode boolean Whether to add processor attribution
-- @return table Array of child items to enqueue
function ExportOrchestrator.processNode(xmlId, item, context, processors, debugMode)
    -- Track node count
    context.nodesProcessed = context.nodesProcessed + 1

    -- Update context depth for stats tracking
    context.currentDepth = item.depth

    -- Track value type and depth
    context.statsCollector:track("value", item.xmlPath, item.value, context)

    -- Try each processor in chain (sorted by priority)
    for _, processor in ipairs(processors) do
        if processor:supports(item.value, context) then
            -- Processor returns children to enqueue (or nil to skip)
            local children = processor:process(xmlId, item, context)

            -- nil means "skip to next processor"
            if children ~= nil then
                -- Track which processor handled it
                local name = processor.name or "unknown"
                context.statsCollector:track("processor", item.xmlPath, name, context)

                -- Debug: Add processor attribution to XML
                if debugMode then
                    ExportMetadata.writeProcessorAttribution(xmlId, item.xmlPath, name)
                end

                return children
            end
        end
    end

    -- If no processor handled it, something went wrong
    print(string.format("[Export] WARNING: No processor handled value at %s (type: %s)",
        item.xmlPath, type(item.value)))
    return {}
end

return ExportOrchestrator
