-- processors/GlobalReferenceProcessor.lua
-- Detects references to global g_* objects using naming convention

GlobalReferenceProcessor = {}
GlobalReferenceProcessor.priority = 50
GlobalReferenceProcessor.name = "GlobalRef"

-- Convert field name to potential global name
-- "achievementManager" -> "g_achievementManager"
-- "currentMission" -> "g_currentMission"
function GlobalReferenceProcessor:fieldNameToGlobal(fieldName)
    if type(fieldName) ~= "string" then
        return nil
    end

    -- Only convert if starts with lowercase (camelCase)
    if not fieldName:match("^[a-z]") then
        return nil
    end

    return "g_" .. fieldName
end

function GlobalReferenceProcessor:supports(value, context)
    if type(value) ~= "table" then
        return false
    end

    -- Skip if no current field name (need item from context, but supports() only has value)
    -- This will be checked again in process()
    return true
end

function GlobalReferenceProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath

    -- Skip if no field name
    if not item.fieldName then
        return nil  -- Let another processor handle it
    end

    -- Try to convert field name to global name
    local potentialGlobal = self:fieldNameToGlobal(item.fieldName)
    if not potentialGlobal then
        return nil  -- Let another processor handle it
    end

    -- Check if global exists
    local globalObj, source = GlobalDiscovery.get(potentialGlobal)
    if not globalObj then
        return nil  -- Let another processor handle it
    end

    -- Verify it's the same object (compare memory addresses)
    if tostring(globalObj) ~= tostring(value) then
        return nil  -- Let another processor handle it
    end

    -- It's a global reference
    setXMLString(xmlId, path .. "#type", "global-ref")
    setXMLString(xmlId, path .. "#ref", potentialGlobal)
    -- setXMLString(xmlId, path .. "#address", tostring(value))  -- Disabled: memory addresses not useful for documentation

    -- Track global reference detection (use readable path for stats)
    context.statsCollector:track("globalRef", item.readablePath, potentialGlobal, context)

    return {}  -- No children
end
