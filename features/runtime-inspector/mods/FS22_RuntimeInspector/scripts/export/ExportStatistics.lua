-- export/ExportStatistics.lua
-- Responsible for: Formatting and writing export statistics reports
-- SRP: Single place for stats file generation

ExportStatistics = {}

--- Format timing report section
-- @param context table Export context with levelTimings
-- @return table Array of report lines
local function formatTimingReport(context)
    local lines = {
        "",
        "=== TIMING (per level) ===",
        ""
    }

    -- Calculate total time
    local totalTime = 0
    for _, timing in pairs(context.levelTimings) do
        totalTime = totalTime + timing.duration
    end

    -- Sort levels for consistent output
    local levels = {}
    for level in pairs(context.levelTimings) do
        table.insert(levels, level)
    end
    table.sort(levels)

    -- Format per-level timings
    for _, level in ipairs(levels) do
        local timing = context.levelTimings[level]
        local nodesPerSec = timing.nodes / timing.duration
        table.insert(lines, string.format("  Level %d: %.3fs (%d nodes, %.0f nodes/sec)",
            level, timing.duration, timing.nodes, nodesPerSec))
    end

    table.insert(lines, "")
    table.insert(lines, string.format("Total time: %.3fs", totalTime))

    return lines
end

--- Write statistics report to file
-- @param outputDir string Directory to write stats file
-- @param name string Global variable name
-- @param context table Export context with stats
function ExportStatistics.writeReport(outputDir, name, context)
    local fileName = string.format("%s_%d_stats.txt", name, context.maxDepth)
    local statsPath = outputDir .. "/" .. fileName

    local content = {
        "=== EXPORT STATISTICS ===",
        "",
        "Object: " .. name,
        "Depth requested: " .. context.maxDepth,
    }

    -- Depth completion status
    if context.lastCompleteDepth then
        table.insert(content, "Depth complete: " .. context.lastCompleteDepth .. " (limit exceeded)")
    else
        table.insert(content, "Depth complete: " .. context.maxDepth .. " (all levels complete)")
    end

    table.insert(content, "Total nodes processed: " .. context.nodesProcessed)
    table.insert(content, "Algorithm: BFS (Breadth-First Search, iterative)")

    -- Add timing information
    for _, line in ipairs(formatTimingReport(context)) do
        table.insert(content, line)
    end

    -- Generate tracker reports
    local report = context.statsCollector:generateReport()
    for _, line in ipairs(report) do
        table.insert(content, line)
    end

    FileSystem.writeFile(statsPath, table.concat(content, "\n"))
end

return ExportStatistics
