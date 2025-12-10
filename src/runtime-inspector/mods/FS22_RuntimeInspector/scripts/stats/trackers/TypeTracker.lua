-- stats/trackers/TypeTracker.lua
-- Tracks value types encountered during export

TypeTracker = TypeTracker or {}

function TypeTracker.new()
    local instance = {
        name = "TypeTracker",
        counts = {},
        countsByDepth = {},  -- countsByDepth[depth][type] = count
        lastCompleteDepth = nil
    }
    setmetatable(instance, { __index = TypeTracker })
    instance:reset()
    return instance
end

function TypeTracker:reset()
    self.counts = {
        ["nil"] = 0,
        string = 0,
        number = 0,
        boolean = 0,
        table = 0,
        ["function"] = 0,
        userdata = 0,
        thread = 0
    }
    self.countsByDepth = {}
    self.lastCompleteDepth = nil
end

function TypeTracker:setLastCompleteDepth(depth)
    self.lastCompleteDepth = depth
end

function TypeTracker:track(eventType, path, value, context)
    if eventType == "value" then
        local valueType = type(value)
        local depth = context.currentDepth or 0

        -- Overall count
        self.counts[valueType] = (self.counts[valueType] or 0) + 1

        -- Per-depth count
        if not self.countsByDepth[depth] then
            self.countsByDepth[depth] = {}
        end
        self.countsByDepth[depth][valueType] = (self.countsByDepth[depth][valueType] or 0) + 1
    end
end

function TypeTracker:getStats()
    return {
        types = self.counts
    }
end

-- Helper function to pad string to width
local function padRight(str, width)
    local len = string.len(str)
    if len >= width then
        return str
    end
    return str .. string.rep(" ", width - len)
end

local function padLeft(str, width)
    local len = string.len(str)
    if len >= width then
        return str
    end
    return string.rep(" ", width - len) .. str
end

function TypeTracker:generateReport()
    local report = {
        "",
        "=== TYPE DISTRIBUTION ===",
        ""
    }

    -- Collect all type names that have non-zero counts
    local allTypes = {}
    local typeSet = {}

    if self.lastCompleteDepth then
        -- Collect from complete levels
        for depth, levelCounts in pairs(self.countsByDepth) do
            if depth <= self.lastCompleteDepth then
                for typeName, count in pairs(levelCounts) do
                    if count > 0 and not typeSet[typeName] then
                        typeSet[typeName] = true
                        table.insert(allTypes, typeName)
                    end
                end
            end
        end
    else
        -- Collect from overall counts
        for typeName, count in pairs(self.counts) do
            if count > 0 and not typeSet[typeName] then
                typeSet[typeName] = true
                table.insert(allTypes, typeName)
            end
        end
    end

    -- Sort types by priority: table, number, boolean, string, function, userdata, thread, others
    local typePriority = {
        table = 1,
        number = 2,
        boolean = 3,
        string = 4,
        ["function"] = 5,
        userdata = 6,
        thread = 7
    }
    table.sort(allTypes, function(a, b)
        local pa = typePriority[a] or 99
        local pb = typePriority[b] or 99
        if pa == pb then
            return a < b
        end
        return pa < pb
    end)

    -- Calculate column widths
    local colWidths = {}
    colWidths["Level"] = 5
    for _, typeName in ipairs(allTypes) do
        colWidths[typeName] = math.max(string.len(typeName), 4)  -- min width 4
    end

    -- Build header
    local header = padRight("Level", colWidths["Level"])
    for _, typeName in ipairs(allTypes) do
        header = header .. "  " .. padLeft(typeName, colWidths[typeName])
    end
    table.insert(report, header)

    -- Build separator
    local separator = string.rep("-", colWidths["Level"])
    for _, typeName in ipairs(allTypes) do
        separator = separator .. "  " .. string.rep("-", colWidths[typeName])
    end
    table.insert(report, separator)

    -- Sort depths
    local depths = {}
    for depth, _ in pairs(self.countsByDepth) do
        -- If limit exceeded, show only complete levels
        if self.lastCompleteDepth then
            if depth <= self.lastCompleteDepth then
                table.insert(depths, depth)
            end
        else
            -- Show all levels
            table.insert(depths, depth)
        end
    end
    table.sort(depths)

    -- Per-level breakdown
    for _, depth in ipairs(depths) do
        local levelCounts = self.countsByDepth[depth]
        local row = padLeft(tostring(depth), colWidths["Level"])

        for _, typeName in ipairs(allTypes) do
            local count = levelCounts[typeName] or 0
            row = row .. "  " .. padLeft(tostring(count), colWidths[typeName])
        end

        table.insert(report, row)
    end

    -- Separator before summary
    table.insert(report, separator)

    -- Summary row
    local summary = {}
    for depth, levelCounts in pairs(self.countsByDepth) do
        -- If limit exceeded, sum only complete levels
        if self.lastCompleteDepth then
            if depth <= self.lastCompleteDepth then
                for typeName, count in pairs(levelCounts) do
                    summary[typeName] = (summary[typeName] or 0) + count
                end
            end
        else
            -- Sum all levels
            for typeName, count in pairs(levelCounts) do
                summary[typeName] = (summary[typeName] or 0) + count
            end
        end
    end

    local summaryRow = padLeft("Total", colWidths["Level"])
    for _, typeName in ipairs(allTypes) do
        local count = summary[typeName] or 0
        summaryRow = summaryRow .. "  " .. padLeft(tostring(count), colWidths[typeName])
    end
    table.insert(report, summaryRow)

    return report
end
