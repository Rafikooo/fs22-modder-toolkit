-- stats/StatsCollector.lua
-- Orchestrates all statistics trackers

StatsCollector = StatsCollector or {}

-- Create a new stats collector instance
function StatsCollector.new()
    local instance = {
        trackers = {},
        lastCompleteDepth = nil  -- Set after export if limit exceeded
    }
    setmetatable(instance, { __index = StatsCollector })
    return instance
end

-- Register a tracker
function StatsCollector:registerTracker(tracker)
    table.insert(self.trackers, tracker)
end

-- Initialize all trackers
function StatsCollector:reset()
    for _, tracker in ipairs(self.trackers) do
        if tracker.reset then
            tracker:reset()
        end
    end
end

-- Track an event (called by processors)
function StatsCollector:track(eventType, path, value, context)
    for _, tracker in ipairs(self.trackers) do
        if tracker.track then
            tracker:track(eventType, path, value, context)
        end
    end
end

-- Get aggregated statistics from all trackers
function StatsCollector:getStats()
    local stats = {}
    for _, tracker in ipairs(self.trackers) do
        if tracker.getStats then
            local trackerStats = tracker:getStats()
            for key, value in pairs(trackerStats) do
                stats[key] = value
            end
        end
    end
    return stats
end

-- Generate summary report
function StatsCollector:generateReport()
    -- Propagate lastCompleteDepth to trackers that need it
    for _, tracker in ipairs(self.trackers) do
        if tracker.setLastCompleteDepth then
            tracker:setLastCompleteDepth(self.lastCompleteDepth)
        end
    end

    local report = {}
    for _, tracker in ipairs(self.trackers) do
        if tracker.generateReport then
            local trackerReport = tracker:generateReport()
            for _, line in ipairs(trackerReport) do
                table.insert(report, line)
            end
        end
    end
    return report
end
