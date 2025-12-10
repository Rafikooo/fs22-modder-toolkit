-- stats/trackers/FunctionDeduplicationTracker.lua
-- Tracks function deduplication statistics

FunctionDeduplicationTracker = FunctionDeduplicationTracker or {}

function FunctionDeduplicationTracker.new()
    local instance = {
        name = "FunctionDeduplicationTracker",
        deduplicationCount = 0,  -- How many duplicate functions were found
        sourceStats = {}  -- sourceStats[source] = count
    }
    setmetatable(instance, { __index = FunctionDeduplicationTracker })
    instance:reset()
    return instance
end

function FunctionDeduplicationTracker:reset()
    self.deduplicationCount = 0
    self.sourceStats = {}
end

function FunctionDeduplicationTracker:track(eventType, path, value, context)
    if eventType == "functionDeduplication" then
        local source = value  -- source string passed as value

        self.deduplicationCount = self.deduplicationCount + 1

        -- Track how many times each source appeared as duplicate
        self.sourceStats[source] = (self.sourceStats[source] or 0) + 1
    end
end

function FunctionDeduplicationTracker:getStats()
    return {
        functionDuplications = self.deduplicationCount,
        functionDeduplicationSources = self.sourceStats
    }
end

function FunctionDeduplicationTracker:generateReport()
    local report = {
        "",
        "=== FUNCTION DEDUPLICATION ===",
        "",
        string.format("Total duplicate functions removed: %d", self.deduplicationCount),
        ""
    }

    if self.deduplicationCount > 0 then
        -- Sort sources by duplication count
        local sortedSources = {}
        for source, count in pairs(self.sourceStats) do
            table.insert(sortedSources, {source = source, count = count})
        end
        table.sort(sortedSources, function(a, b) return a.count > b.count end)

        -- Show top 20 most duplicated functions
        local limit = math.min(20, #sortedSources)
        table.insert(report, string.format("Top %d most duplicated functions:", limit))
        for i = 1, limit do
            local entry = sortedSources[i]
            table.insert(report, string.format("  %4d× %s", entry.count, entry.source))
        end

        if #sortedSources > limit then
            table.insert(report, string.format("  ... and %d more unique sources", #sortedSources - limit))
        end
    end

    return report
end
