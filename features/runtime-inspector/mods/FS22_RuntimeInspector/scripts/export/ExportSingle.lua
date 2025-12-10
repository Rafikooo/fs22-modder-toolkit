-- export/ExportSingle.lua
-- Responsible for: Single object export orchestration
-- SRP: Coordinates export of one Lua object to XML with stats

ExportSingle = {}

--- Export a single Lua object to XML
-- @param name string Global variable name
-- @param obj any Lua object to export
-- @param depth number Maximum traversal depth
-- @param config table Export configuration {maxNodes, debugMode, processors}
-- @return boolean Success status
function ExportSingle.export(name, obj, depth, config)
    if depth == -1 then
        depth = 999  -- Unlimited depth
        print(string.format("[Export] Starting FULL export of %s (unlimited depth, BFS)", name))
    else
        print(string.format("[Export] Starting export of %s (depth: %d, BFS)", name, depth))
    end

    -- Create output directory for this global
    local globalDir, sessionId = FileSystem.createGlobalExportDir(name)

    -- Create XML file (depth stored as XML attribute, not in filename)
    local fileName = string.format("%s.xml", name)
    local xmlPath = globalDir .. "/" .. fileName
    local xmlId = createXMLFile("schema", xmlPath, "schema")

    if not xmlId then
        print(string.format("[Export] ERROR: Failed to create XML file: %s", xmlPath))
        return false
    end

    -- Initialize context using module
    local context = ExportContext.create(depth, config.maxNodes)

    -- Write metadata using module
    ExportMetadata.writeSchemaAttributes(xmlId, name, obj, depth, config.debugMode)
    setXMLString(xmlId, "schema#timestamp", sessionId)

    -- Run BFS traversal using orchestrator module
    ExportOrchestrator.orchestrate(
        name,
        obj,
        depth,
        xmlId,
        context,
        config.processors,
        config.debugMode
    )

    -- Save and close
    saveXMLFile(xmlId)
    delete(xmlId)

    -- Write statistics using module
    ExportStatistics.writeReport(globalDir, name, context)

    -- Print summary
    local stats = context.statsCollector:getStats()
    print(string.format("[Export] Completed: %s", xmlPath))
    print(string.format("[Export]   Nodes processed: %d", context.nodesProcessed))
    print(string.format("[Export]   Global refs: %d", stats.globalRefs or 0))
    print(string.format("[Export]   Cycles: %d", stats.cycles or 0))

    return true
end

return ExportSingle
