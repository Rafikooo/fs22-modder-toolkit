-- stats/trackers/DepthTracker.lua
-- Tracks nodes processed at each depth level

DepthTracker = DepthTracker or {}

function DepthTracker.new()
    local instance = {
        name = "DepthTracker",
        depthCounts = {},
        lastCompleteDepth = nil
    }
    setmetatable(instance, { __index = DepthTracker })
    instance:reset()
    return instance
end

function DepthTracker:reset()
    self.depthCounts = {}
    self.lastCompleteDepth = nil
end

function DepthTracker:setLastCompleteDepth(depth)
    self.lastCompleteDepth = depth
end

function DepthTracker:track(eventType, path, value, context)
    if eventType == "value" then
        local depth = context.currentDepth or 0
        self.depthCounts[depth] = (self.depthCounts[depth] or 0) + 1
    end
end

function DepthTracker:getStats()
    return {
        depthDistribution = self.depthCounts
    }
end

function DepthTracker:generateReport()
    local report = {
        "",
        "=== DEPTH DISTRIBUTION ===",
        ""
    }

    -- Sort by depth
    local sorted = {}
    for depth, count in pairs(self.depthCounts) do
        table.insert(sorted, {depth = depth, count = count})
    end
    table.sort(sorted, function(a, b) return a.depth < b.depth end)

    for _, item in ipairs(sorted) do
        local status = ""
        if self.lastCompleteDepth then
            if item.depth <= self.lastCompleteDepth then
                status = " (complete)"
            else
                status = " (incomplete - limit exceeded)"
            end
        end
        table.insert(report, string.format("  Level %d: %d nodes%s", item.depth, item.count, status))
    end

    return report
end
