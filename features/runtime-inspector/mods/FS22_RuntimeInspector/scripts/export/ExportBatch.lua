ExportBatch = {}

--- Export all discovered globals to XML
-- @param depth number Maximum traversal depth
-- @param config table Export configuration {maxNodes, debugMode, processors}
-- @return table Results {successful, failed, total}
function ExportBatch.exportAll(depth, config)
    print("[Export] Starting batch export of all globals (BFS)...")

    local globals, discoveryStats = GlobalDiscovery.discoverAll()
    print(string.format("[Export] Found %d globals (%d direct, %d metatable)",
        discoveryStats.total, discoveryStats.direct, discoveryStats.metatable))

    local successful = 0
    local failed = 0
    local errors = {}

    for name, obj in pairs(globals) do
        print(string.format("[Export] [%d/%d] Exporting %s...",
            successful + failed + 1, discoveryStats.total, name))

        local ok, err = pcall(function()
            ExportSingle.export(name, obj, depth, config)
        end)

        if ok then
            successful = successful + 1
        else
            failed = failed + 1
            table.insert(errors, {name = name, error = tostring(err)})
            print(string.format("[Export]   ERROR exporting %s: %s", name, tostring(err)))
        end
    end

    print(string.format("[Export] Batch export complete: %d successful, %d failed (total: %d)",
        successful, failed, discoveryStats.total))

    if failed > 0 then
        print(string.format("[Export] Failed exports:"))
        for _, errorInfo in ipairs(errors) do
            print(string.format("[Export]   - %s: %s", errorInfo.name, errorInfo.error))
        end
    end

    return {
        successful = successful,
        failed = failed,
        total = discoveryStats.total,
        errors = errors
    }
end

return ExportBatch
