-- stats/trackers/GlobalRefTracker.lua
-- Tracks paths where global references were detected

GlobalRefTracker = GlobalRefTracker or {}

function GlobalRefTracker.new()
    local instance = {
        name = "GlobalRefTracker",
        paths = {},
        count = 0
    }
    setmetatable(instance, { __index = GlobalRefTracker })
    instance:reset()
    return instance
end

function GlobalRefTracker:reset()
    self.paths = {}
    self.count = 0
end

function GlobalRefTracker:track(eventType, path, value, context)
    if eventType == "globalRef" then
        table.insert(self.paths, {
            path = path,
            globalName = value  -- The detected global name (e.g., "g_currentMission")
        })
        self.count = self.count + 1
    end
end

function GlobalRefTracker:getStats()
    return {
        globalRefs = self.count,
        globalRefPaths = self.paths
    }
end

function GlobalRefTracker:generateReport()
    local report = {
        "",
        "=== GLOBAL REFERENCES ===",
        "",
        string.format("Total: %d", self.count),
        ""
    }

    if self.count > 0 then
        table.insert(report, "All paths:")
        for i = 1, #self.paths do
            local ref = self.paths[i]
            table.insert(report, string.format("  %s -> %s", ref.path, ref.globalName))
        end
    end

    return report
end
