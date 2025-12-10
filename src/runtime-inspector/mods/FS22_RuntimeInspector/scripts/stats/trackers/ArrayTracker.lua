-- stats/trackers/ArrayTracker.lua
-- Tracks sequential arrays processed by ArrayProcessor

ArrayTracker = ArrayTracker or {}

function ArrayTracker.new()
    local instance = {
        name = "ArrayTracker",
        count = 0,
        totalElements = 0,
        samples = {}
    }
    setmetatable(instance, { __index = ArrayTracker })
    instance:reset()
    return instance
end

function ArrayTracker:reset()
    self.count = 0
    self.totalElements = 0
    self.samples = {}
end

function ArrayTracker:track(eventType, path, value, context)
    if eventType == "array" then
        local elementCount = value
        self.count = self.count + 1
        self.totalElements = self.totalElements + elementCount

        -- Store sample (first 10)
        if #self.samples < 10 then
            table.insert(self.samples, {path = path, elements = elementCount})
        end
    end
end

function ArrayTracker:generateReport()
    local report = {
        "",
        "=== ARRAYS (SEQUENTIAL) ===",
        "",
        string.format("Total arrays found: %d", self.count),
        string.format("Total elements: %d", self.totalElements),
        ""
    }

    if self.count > 0 then
        local avgElements = math.floor(self.totalElements / self.count)
        table.insert(report, string.format("Average elements per array: %d", avgElements))
        table.insert(report, "")
        table.insert(report, "Sample arrays (first 10):")
        for _, sample in ipairs(self.samples) do
            table.insert(report, string.format("  %s (%d elements)", sample.path, sample.elements))
        end
    end

    return report
end
