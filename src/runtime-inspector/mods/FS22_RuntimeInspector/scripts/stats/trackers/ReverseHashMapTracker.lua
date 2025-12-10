-- stats/trackers/ReverseHashMapTracker.lua
-- Tracks reverse hash maps (tables with memory address keys)

ReverseHashMapTracker = ReverseHashMapTracker or {}

function ReverseHashMapTracker.new()
    local instance = {
        name = "ReverseHashMapTracker",
        count = 0,           -- Number of reverse hash maps found
        totalEntries = 0,    -- Total number of entries skipped
        paths = {}           -- List of paths where reverse maps were found
    }
    setmetatable(instance, { __index = ReverseHashMapTracker })
    instance:reset()
    return instance
end

function ReverseHashMapTracker:reset()
    self.count = 0
    self.totalEntries = 0
    self.paths = {}
end

function ReverseHashMapTracker:track(eventType, path, value, context)
    if eventType == "reverseHashMap" then
        local entryCount = value  -- Number of entries passed as value

        self.count = self.count + 1
        self.totalEntries = self.totalEntries + entryCount

        table.insert(self.paths, {
            path = path,
            entries = entryCount
        })
    end
end

function ReverseHashMapTracker:getStats()
    return {
        reverseHashMapCount = self.count,
        reverseHashMapTotalEntries = self.totalEntries,
        reverseHashMapPaths = self.paths
    }
end

function ReverseHashMapTracker:generateReport()
    local report = {
        "",
        "=== REVERSE HASH MAPS (FILTERED) ===",
        "",
        string.format("Total reverse hash maps found: %d", self.count),
        string.format("Total entries skipped: %d", self.totalEntries),
        ""
    }

    if self.count > 0 then
        -- Show all reverse hash maps
        table.insert(report, "Locations:")
        for _, entry in ipairs(self.paths) do
            table.insert(report, string.format("  %s (%d entries)", entry.path, entry.entries))
        end
    end

    return report
end
