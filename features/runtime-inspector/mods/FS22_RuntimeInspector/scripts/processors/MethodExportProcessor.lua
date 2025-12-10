-- processors/MethodExportProcessor.lua
-- Exports methods from metatable.__index for class instances
-- This allows IDE autocomplete to see available methods like :getGroundAngleMaxValue()

MethodExportProcessor = {}
MethodExportProcessor.priority = 69  -- AFTER MetatableProcessor (68), BEFORE ObjectProcessor (70)
MethodExportProcessor.name = "MethodExport"

function MethodExportProcessor:supports(value, context)
    -- Only process tables with metatables
    if type(value) ~= "table" then
        return false
    end

    local mt = getmetatable(value)
    if not mt then
        return false
    end

    -- Metatable must be a table (not string, function, etc.)
    if type(mt) ~= "table" then
        return false
    end

    -- Check if metatable contains any functions (methods)
    -- In FS22, methods are stored DIRECTLY in metatable, not in mt.__index
    local hasMethod = false
    for key, value in pairs(mt) do
        if type(value) == "function" and type(key) == "string" then
            -- Skip metamethods (starting with __)
            if not key:match("^__") then
                hasMethod = true
                break
            end
        end
    end

    return hasMethod
end

function MethodExportProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath
    local mt = getmetatable(value)

    if not mt or type(mt) ~= "table" then
        return nil  -- Should not happen (supports checks this)
    end

    -- Mark this node as a table (standard for all object-like processors)
    setXMLString(xmlId, path .. "#type", "table")

    -- Get the method table (in FS22, methods are directly in metatable)
    local methodTable = mt

    -- Initialize method export registry in context if not exists
    if not context.exportedMethods then
        context.exportedMethods = {}
    end

    -- Get metatable address as unique identifier
    local mtAddress = tostring(mt)

    -- Check if we've already exported methods for this metatable IN THIS EXPORT
    if context.exportedMethods[mtAddress] then
        -- Already exported methods for this class - skip to avoid duplication
        return nil
    end

    -- Mark this metatable as having methods exported
    context.exportedMethods[mtAddress] = true

    -- Skip if this is a class-instance (methods already exported for first instance)
    local itemType = getXMLString(xmlId, path .. "#type")
    if itemType == "class-instance" then
        return nil  -- Methods already exported for first instance
    end

    -- Count methods to export
    local methodCount = 0
    for key, value in pairs(methodTable) do
        if type(value) == "function" and type(key) == "string" then
            -- Skip metamethods (starting with __)
            if not key:match("^__") then
                methodCount = methodCount + 1
            end
        end
    end

    if methodCount == 0 then
        return nil  -- No public methods to export
    end

    -- Create children array with proper XML paths
    -- Methods first, then instance fields
    local children = {}
    local fieldIndex = 0

    -- Add methods from metatable
    for key, value in pairs(methodTable) do
        if type(value) == "function" and type(key) == "string" then
            -- Skip metamethods (starting with __)
            if not key:match("^__") then
                -- Use indexed field elements (FS22 XML API requires explicit indices for siblings)
                local childPath = path .. ".field(" .. fieldIndex .. ")"
                fieldIndex = fieldIndex + 1

                -- Write key attribute (creates self-closing element automatically)
                setXMLString(xmlId, childPath .. "#key", tostring(key))

                -- Add to processing queue
                table.insert(children, {
                    value = value,
                    xmlPath = childPath,
                    depth = item.depth + 1,
                    fieldName = key,
                    readablePath = item.readablePath .. ":" .. key .. "()",  -- Use : for methods
                    functionSource = nil  -- Will be filled by FunctionProcessor
                })
            end
        end
    end

    -- Track statistics
    context.statsCollector:track("methodsExported", item.readablePath, {
        methodCount = methodCount,
        className = getXMLString(xmlId, path .. "#class")
    }, context)

    -- Add normal object fields to children
    -- We need to process both methods AND instance fields
    for key, val in pairs(value) do
        -- Use indexed field elements (FS22 XML API requires explicit indices for siblings)
        local childPath = path .. ".field(" .. fieldIndex .. ")"
        fieldIndex = fieldIndex + 1

        -- Write key attribute (creates self-closing element automatically)
        setXMLString(xmlId, childPath .. "#key", tostring(key))

        -- Add to processing queue
        table.insert(children, {
            value = val,
            xmlPath = childPath,
            depth = item.depth + 1,
            fieldName = key,
            readablePath = item.readablePath .. "." .. key,
            functionSource = nil
        })
    end

    -- Return children for processing (methods + instance fields)
    -- FunctionProcessor will handle the actual function export
    return children
end
