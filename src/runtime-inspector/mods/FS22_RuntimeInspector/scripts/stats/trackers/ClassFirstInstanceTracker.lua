-- stats/trackers/ClassFirstInstanceTracker.lua
-- Tracks first instances of each class (where full structure is exported)

ClassFirstInstanceTracker = {}
ClassFirstInstanceTracker.event = "classFirstInstance"

function ClassFirstInstanceTracker.new()
    local instance = {}
    setmetatable(instance, {__index = ClassFirstInstanceTracker})
    instance:initialize()
    return instance
end

function ClassFirstInstanceTracker:initialize()
    self.firstInstances = {}  -- className -> {path, metatable}
end

function ClassFirstInstanceTracker:track(path, data, context)
    local className = data.className or "unknown"

    if not self.firstInstances[className] then
        self.firstInstances[className] = {
            path = path,
            metatable = data.metatable
        }
    end
end

function ClassFirstInstanceTracker:getReport()
    if next(self.firstInstances) == nil then
        return nil
    end

    local classList = {}
    for className, info in pairs(self.firstInstances) do
        table.insert(classList, {
            className = className,
            firstPath = info.path,
            metatable = info.metatable
        })
    end

    -- Sort alphabetically
    table.sort(classList, function(a, b)
        return a.className < b.className
    end)

    return {
        totalClasses = #classList,
        classes = classList
    }
end
