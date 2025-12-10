-- stats/trackers/CycleTracker.lua
-- Tracks paths where circular references were detected

CycleTracker = CycleTracker or {}

function CycleTracker.new()
    local instance = {
        name = "CycleTracker",
        paths = {},
        count = 0
    }
    setmetatable(instance, { __index = CycleTracker })
    instance:reset()
    return instance
end

function CycleTracker:reset()
    self.paths = {}
    self.count = 0
end

function CycleTracker:track(eventType, path, value, context)
    if eventType == "cycle" then
        table.insert(self.paths, {
            path = path,
            depth = context.currentDepth or 0
        })
        self.count = self.count + 1
    end
end

function CycleTracker:getStats()
    return {
        cycles = self.count,
        cyclePaths = self.paths
    }
end

function CycleTracker:generateReport()
    local report = {
        "",
        "=== CIRCULAR REFERENCES ===",
        "",
        string.format("Total: %d", self.count),
        ""
    }

    if self.count > 0 then
        table.insert(report, "Paths:")
        -- Limit to first 20 for readability
        local limit = math.min(#self.paths, 20)
        for i = 1, limit do
            local cycle = self.paths[i]
            table.insert(report, string.format("  [depth %d] %s", cycle.depth, cycle.path))
        end

        if #self.paths > 20 then
            table.insert(report, string.format("  ... and %d more", #self.paths - 20))
        end
    end

    return report
end
