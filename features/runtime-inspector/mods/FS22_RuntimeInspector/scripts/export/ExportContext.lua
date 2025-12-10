-- export/ExportContext.lua
-- Responsible for: Export context initialization with stat trackers
-- SRP: Single place for context structure and tracker registration

ExportContext = {}

--- Create export context with all registered trackers
-- @param depth number Maximum traversal depth
-- @param maxNodes number Maximum nodes to process
-- @return table Context object with stats collectors and tracking state
function ExportContext.create(depth, maxNodes)
    -- Initialize stats collector with all trackers
    local statsCollector = StatsCollector.new()

    -- Register all trackers (order doesn't matter, they're independent)
    statsCollector:registerTracker(TypeTracker.new())
    statsCollector:registerTracker(DepthTracker.new())
    statsCollector:registerTracker(GlobalRefTracker.new())
    statsCollector:registerTracker(CycleTracker.new())
    statsCollector:registerTracker(EventListenerTracker.new())
    statsCollector:registerTracker(FunctionDeduplicationTracker.new())
    statsCollector:registerTracker(ReverseHashMapTracker.new())
    statsCollector:registerTracker(ArrayTracker.new())
    statsCollector:registerTracker(MapTracker.new())
    statsCollector:registerTracker(ClassInstanceTracker.new())
    statsCollector:registerTracker(ClassFirstInstanceTracker.new())
    statsCollector:registerTracker(MethodsExportedTracker.new())
    statsCollector:registerTracker(ProcessorTracker.new())

    return {
        -- Stats collection
        statsCollector = statsCollector,

        -- Traversal limits
        maxDepth = depth,
        maxNodes = maxNodes,
        nodesProcessed = 0,

        -- Cycle detection
        visited = {},  -- visited[address] = true

        -- Level tracking (for BFS)
        nodesAtDepth = {},  -- nodesAtDepth[level] = count
        lastCompleteDepth = nil,

        -- Function deduplication
        functionRegistry = {},  -- functionRegistry[address] = firstPath

        -- Timing (for performance stats)
        levelTimings = {},  -- levelTimings[level] = {duration, nodes}
        levelStartTime = nil
    }
end

return ExportContext
