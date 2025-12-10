-- stats/trackers/MethodsExportedTracker.lua
-- Tracks method export statistics from MethodExportProcessor

MethodsExportedTracker = {}
MethodsExportedTracker.eventType = "methodsExported"

function MethodsExportedTracker.new()
    local instance = {
        totalMethodsExported = 0,
        classesWithMethods = {}
    }
    setmetatable(instance, { __index = MethodsExportedTracker })
    return instance
end

function MethodsExportedTracker:track(eventType, readablePath, data, context)
    if eventType ~= self.eventType then
        return
    end
    local methodCount = data.methodCount or 0
    local className = data.className or "Unknown"

    self.totalMethodsExported = self.totalMethodsExported + methodCount

    if not self.classesWithMethods[className] then
        self.classesWithMethods[className] = {
            className = className,
            path = readablePath,
            methodCount = methodCount
        }
    end
end

function MethodsExportedTracker:getReport()
    if self.totalMethodsExported == 0 then
        return nil
    end

    -- Convert to sorted list
    local classList = {}
    for className, data in pairs(self.classesWithMethods) do
        table.insert(classList, {
            className = data.className,
            path = data.path,
            methodCount = data.methodCount
        })
    end

    -- Sort by method count (highest first)
    table.sort(classList, function(a, b)
        return a.methodCount > b.methodCount
    end)

    return {
        totalMethods = self.totalMethodsExported,
        totalClasses = #classList,
        classes = classList
    }
end
