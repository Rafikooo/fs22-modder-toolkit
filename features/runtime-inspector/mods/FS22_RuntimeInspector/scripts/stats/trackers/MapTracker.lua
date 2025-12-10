-- stats/trackers/MapTracker.lua
-- Tracks maps (non-sequential/mixed key tables) processed by MapProcessor

MapTracker = MapTracker or {}

function MapTracker.new()
    local instance = {
        name = "MapTracker",
        count = 0,
        totalEntries = 0,
        samples = {}
    }
    setmetatable(instance, { __index = MapTracker })
    instance:reset()
    return instance
end

function MapTracker:reset()
    self.count = 0
    self.totalEntries = 0
    self.samples = {}
end

function MapTracker:track(eventType, path, value, context)
    if eventType == "map" then
        local entryCount = value
        self.count = self.count + 1
        self.totalEntries = self.totalEntries + entryCount

        -- Store sample (first 10)
        if #self.samples < 10 then
            table.insert(self.samples, {path = path, entries = entryCount})
        end
    end
end

function MapTracker:generateReport()
    local report = {
        "",
        "=== MAPS (NON-SEQUENTIAL/MIXED KEYS) ===",
        "",
        string.format("Total maps found: %d", self.count),
        string.format("Total entries: %d", self.totalEntries),
        ""
    }

    if self.count > 0 then
        local avgEntries = math.floor(self.totalEntries / self.count)
        table.insert(report, string.format("Average entries per map: %d", avgEntries))
        table.insert(report, "")
        table.insert(report, "Sample maps (first 10):")
        for _, sample in ipairs(self.samples) do
            table.insert(report, string.format("  %s (%d entries)", sample.path, sample.entries))
        end
    end

    return report
end
