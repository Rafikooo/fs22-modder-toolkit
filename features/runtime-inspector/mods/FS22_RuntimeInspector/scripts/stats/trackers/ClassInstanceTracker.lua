-- stats/trackers/ClassInstanceTracker.lua
-- Tracks class instances detected via metatable

ClassInstanceTracker = {}
ClassInstanceTracker.event = "classInstance"

function ClassInstanceTracker.new()
    local instance = {}
    setmetatable(instance, {__index = ClassInstanceTracker})
    instance:initialize()
    return instance
end

function ClassInstanceTracker:initialize()
    self.classes = {}  -- className -> {instanceCount, samplePaths[]}
    self.firstInstances = {}  -- className -> firstPath
    self.totalInstances = 0
end

function ClassInstanceTracker:track(path, data, context)
    local className = data.className or "unknown"
    local instanceNum = data.instanceNumber or 1

    if not self.classes[className] then
        self.classes[className] = {
            instanceCount = 0,
            samplePaths = {}
        }
    end

    local classInfo = self.classes[className]
    classInfo.instanceCount = instanceNum  -- Use highest instance number seen

    -- Track sample paths (first 10)
    if #classInfo.samplePaths < 10 then
        table.insert(classInfo.samplePaths, path)
    end

    self.totalInstances = self.totalInstances + 1
end

function ClassInstanceTracker:getReport()
    if self.totalInstances == 0 then
        return nil
    end

    -- Convert to sorted list
    local classList = {}
    for className, info in pairs(self.classes) do
        table.insert(classList, {
            className = className,
            instanceCount = info.instanceCount,
            samplePaths = info.samplePaths
        })
    end

    -- Sort by instance count (highest first)
    table.sort(classList, function(a, b)
        return a.instanceCount > b.instanceCount
    end)

    return {
        totalInstances = self.totalInstances,
        totalClasses = #classList,
        classes = classList
    }
end
