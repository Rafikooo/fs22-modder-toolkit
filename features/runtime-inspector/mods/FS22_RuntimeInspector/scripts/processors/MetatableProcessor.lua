-- processors/MetatableProcessor.lua
-- Detects object class via metatable and deduplicates objects of same class
-- Instead of exporting full structure for every instance, exports:
--   1. First instance: full structure + metatable info
--   2. Subsequent instances: reference to class only

MetatableProcessor = {}
MetatableProcessor.priority = 68  -- BEFORE ObjectProcessor (70) to intercept class instances
MetatableProcessor.name = "Metatable"

-- NOTE: seenMetatables is stored in context, NOT as module-level variable
-- This ensures each export has its own registry (depth1, depth2, etc. are separate exports)

function MetatableProcessor:supports(value, context)
    -- Only process tables (objects)
    if type(value) ~= "table" then
        return false
    end

    -- Must have metatable
    local mt = getmetatable(value)
    return mt ~= nil
end

function MetatableProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath
    local mt = getmetatable(value)

    if not mt then
        return nil  -- Should not happen (supports checks this)
    end

    -- Initialize metatable registry in context if not exists
    if not context.seenMetatables then
        context.seenMetatables = {}
    end
    local seenMetatables = context.seenMetatables

    -- Get metatable address as unique identifier
    local mtAddress = tostring(mt)

    -- Try to find class name (with caching)
    local className = self:findClassName(mt, context)

    -- Check if we've seen this metatable before IN THIS EXPORT
    if seenMetatables[mtAddress] then
        -- This is a duplicate instance of known class
        local classInfo = seenMetatables[mtAddress]
        classInfo.instanceCount = classInfo.instanceCount + 1

        -- Export as instance reference (only if we have proper class name)
        if classInfo.className then
            setXMLString(xmlId, path .. "#type", "class-instance")
            setXMLString(xmlId, path .. "#class", classInfo.className)
            setXMLString(xmlId, path .. "#firstExportedAt", classInfo.firstExportPath)
            setXMLInt(xmlId, path .. "#instanceNumber", classInfo.instanceCount)

            -- Track statistics
            context.statsCollector:track("classInstance", item.readablePath, {
                className = classInfo.className,
                instanceNumber = classInfo.instanceCount
            }, context)

            return {}  -- Skip children (already exported in first instance)
        else
            -- No proper class name - skip deduplication, let ObjectProcessor handle it
            return nil
        end
    else
        -- First instance of this metatable/class
        seenMetatables[mtAddress] = {
            className = className,
            firstExportPath = item.readablePath,
            instanceCount = 1,
            metatable = mtAddress
        }

        -- ALWAYS export metatable attribute (for method extraction later)
        setXMLString(xmlId, path .. "#metatable", mtAddress)

        -- Export with class info (only if we have proper class name)
        if className then
            setXMLString(xmlId, path .. "#type", "class-first-instance")
            setXMLString(xmlId, path .. "#class", className)

            -- Track statistics
            context.statsCollector:track("classFirstInstance", item.readablePath, {
                className = className,
                metatable = mtAddress
            }, context)
        end

        -- Export children normally (ObjectProcessor will handle)
        return nil  -- Pass to next processor
    end
end

function MetatableProcessor:findClassName(mt, context)
    -- Check cache first (avoid expensive _G searches)
    local mtAddress = tostring(mt)
    if context.metatableNameCache and context.metatableNameCache[mtAddress] then
        return context.metatableNameCache[mtAddress]
    end

    -- Initialize cache
    if not context.metatableNameCache then
        context.metatableNameCache = {}
    end

    local className = nil

    -- Strategy 1: Check if metatable has className field
    if type(mt) == "table" and mt.className then
        className = mt.className
    end

    -- Strategy 2: Check __index table for className
    if not className and type(mt) == "table" and type(mt.__index) == "table" then
        if mt.__index.className then
            className = mt.__index.className
        end
    end

    -- Strategy 3: Check typeManager (FS22-specific registry)
    if not className and g_currentMission and g_currentMission.typeManager then
        -- typeManager maps class tables to type names
        local typeManager = g_currentMission.typeManager
        if typeManager.nameToType then
            for typeName, typeTable in pairs(typeManager.nameToType) do
                if typeTable == mt.__index or typeTable == mt then
                    className = typeName
                    break
                end
            end
        end
    end

    -- Strategy 4: Search globals for matching class table (expensive!)
    -- Only if not found yet - limit to avoid performance hit
    if not className and type(mt) == "table" and type(mt.__index) == "table" then
        -- Search for mt.__index in globals
        for globalName, globalValue in pairs(_G) do
            if type(globalValue) == "table" and mt.__index == globalValue then
                -- Found matching global - likely class name
                -- Skip generic names like "g_i18n", "g_server", etc.
                if not globalName:match("^g_") then
                    className = globalName
                    break
                end
            end
        end
    end

    -- Strategy 5: Check if metatable itself is in globals (rare)
    if not className then
        for globalName, globalValue in pairs(_G) do
            if globalValue == mt then
                if not globalName:match("^g_") and globalName:match("_mt$") then
                    -- Found metatable in globals (e.g., "Vehicle_mt")
                    -- Remove "_mt" suffix for class name
                    className = globalName:gsub("_mt$", "")
                    break
                end
            end
        end
    end

    -- Fallback: Return nil if no proper class name found
    -- Don't generate "Class_XXXX" - it's useless noise
    -- Better to omit class/metatable attributes entirely
    if not className then
        className = nil
    end

    -- Cache the result (even if nil)
    context.metatableNameCache[mtAddress] = className

    return className
end
