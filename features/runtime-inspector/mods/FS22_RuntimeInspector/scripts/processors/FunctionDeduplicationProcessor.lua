-- processors/FunctionDeduplicationProcessor.lua
-- Deduplicates functions based on source location (file:line) (BFS version)

FunctionDeduplicationProcessor = {}
FunctionDeduplicationProcessor.priority = 55
FunctionDeduplicationProcessor.name = "FunctionDeduplication"

function FunctionDeduplicationProcessor:supports(value, context)
    return type(value) == "function"
end

function FunctionDeduplicationProcessor:process(xmlId, item, context)
    local value = item.value
    local path = item.xmlPath

    -- Use function address as deduplication key
    -- (tostring returns "function: 0xADDRESS")
    local source = tostring(value)

    -- Check if this source was already exported
    if context.functionRegistry[source] then
        -- This is a duplicate - export reference
        local firstPath = context.functionRegistry[source]

        setXMLString(xmlId, path .. "#type", "function-ref")
        setXMLString(xmlId, path .. "#firstExportedAt", firstPath)

        -- Track deduplication
        context.statsCollector:track("functionDeduplication", item.readablePath, source, context)

        return {}  -- No children
    else
        -- First occurrence - register and export full info
        context.functionRegistry[source] = item.readablePath

        setXMLString(xmlId, path .. "#type", "function")

        -- Extract signature with debug info
        local signature = FunctionIntrospection.extractSignature(value)

        -- Export function metadata (skip memory addresses)
        if signature.nparams then
            setXMLInt(xmlId, path .. "#nparams", signature.nparams)
        end

        if signature.isvararg ~= nil then
            setXMLBool(xmlId, path .. "#isvararg", signature.isvararg)
        end

        if signature.what then
            setXMLString(xmlId, path .. "#what", signature.what)
        end

        -- Export parameter names (for Lua functions)
        if signature.params and #signature.params > 0 then
            setXMLString(xmlId, path .. "#params", table.concat(signature.params, ", "))
        end

        -- Export source location (useful for debugging)
        if signature.source then
            setXMLString(xmlId, path .. "#definedIn", signature.source)
        end

        if signature.linedefined and signature.linedefined > 0 then
            setXMLInt(xmlId, path .. "#definedAt", signature.linedefined)
        end

        -- Add category if we have field name
        if item.fieldName then
            local category = FunctionIntrospection.inferFunctionType(item.fieldName)
            setXMLString(xmlId, path .. "#category", category)
        end

        setXMLString(xmlId, path .. "#firstOccurrence", "true")

        return {}  -- No children
    end
end
