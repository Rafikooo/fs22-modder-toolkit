-- stats/trackers/EventListenerTracker.lua
-- Tracks event listener arrays that were collapsed

EventListenerTracker = EventListenerTracker or {}

function EventListenerTracker.new()
    local instance = {
        name = "EventListenerTracker",
        paths = {},
        count = 0,
        totalElementsCollapsed = 0
    }
    setmetatable(instance, { __index = EventListenerTracker })
    instance:reset()
    return instance
end

function EventListenerTracker:reset()
    self.paths = {}
    self.count = 0
    self.totalElementsCollapsed = 0
end

function EventListenerTracker:track(eventType, path, value, context)
    if eventType == "eventListener" then
        -- Count elements in the array
        local elementCount = 0
        for k, v in pairs(value) do
            if type(k) == "number" then
                elementCount = elementCount + 1
            end
        end

        -- We keep 1 element, so collapsed count is elementCount - 1
        local collapsedCount = elementCount - 1

        table.insert(self.paths, {
            path = path,
            totalCount = elementCount,
            collapsedCount = collapsedCount
        })
        self.count = self.count + 1
        self.totalElementsCollapsed = self.totalElementsCollapsed + collapsedCount
    end
end

function EventListenerTracker:getStats()
    return {
        eventListenerArrays = self.count,
        totalElementsCollapsed = self.totalElementsCollapsed,
        eventListenerPaths = self.paths
    }
end

function EventListenerTracker:generateReport()
    local report = {
        "",
        "=== EVENT LISTENER ARRAYS ===",
        "",
        string.format("Total arrays collapsed: %d", self.count),
        string.format("Total elements removed: %d", self.totalElementsCollapsed),
        ""
    }

    if self.count > 0 then
        -- Show first 20 examples
        local limit = math.min(20, #self.paths)
        table.insert(report, string.format("Examples (showing %d of %d):", limit, #self.paths))
        for i = 1, limit do
            local entry = self.paths[i]
            table.insert(report, string.format("  [%d elements] %s", entry.totalCount, entry.path))
        end

        if #self.paths > limit then
            table.insert(report, string.format("  ... and %d more", #self.paths - limit))
        end
    end

    return report
end
