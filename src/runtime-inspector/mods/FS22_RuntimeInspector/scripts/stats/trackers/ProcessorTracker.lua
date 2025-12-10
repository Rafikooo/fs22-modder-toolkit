-- stats/trackers/ProcessorTracker.lua
-- Tracks which processors handled values

ProcessorTracker = ProcessorTracker or {}

function ProcessorTracker.new()
    local instance = {
        name = "ProcessorTracker",
        counts = {}
    }
    setmetatable(instance, { __index = ProcessorTracker })
    instance:reset()
    return instance
end

function ProcessorTracker:reset()
    self.counts = {}
end

function ProcessorTracker:track(eventType, path, value, context)
    if eventType == "processor" then
        -- value contains processor name
        self.counts[value] = (self.counts[value] or 0) + 1
    end
end

function ProcessorTracker:getStats()
    return {
        processors = self.counts
    }
end

function ProcessorTracker:generateReport()
    local report = {
        "",
        "=== PROCESSORS APPLIED ===",
        ""
    }

    -- Sort by count descending
    local sorted = {}
    for processorName, count in pairs(self.counts) do
        table.insert(sorted, {name = processorName, count = count})
    end
    table.sort(sorted, function(a, b) return a.count > b.count end)

    for _, item in ipairs(sorted) do
        if item.count > 0 then
            table.insert(report, string.format("  %s: %d", item.name, item.count))
        end
    end

    return report
end
