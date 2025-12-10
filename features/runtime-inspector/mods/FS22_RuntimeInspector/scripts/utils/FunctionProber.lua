-- utils/FunctionProber.lua
-- Function signature analysis through error message parsing
-- Since debug library is disabled in FS22, we extract info from runtime errors

FunctionProber = FunctionProber or {}

-- Probe function signature by calling with different argument patterns
function FunctionProber.analyzeFunction(func, funcName)
    local results = {
        name = funcName,
        errors = {},
        inferred = {
            minParams = 0,
            maxParams = nil,
            paramTypes = {},
            isSelfMethod = false
        }
    }

    -- Test 1: Call with no arguments
    local ok, err = pcall(func)
    if not ok then
        table.insert(results.errors, {test = "no args", error = tostring(err)})

        -- Parse error for parameter info
        -- Example: "bad argument #1 to 'removeMapHotspot' (Hotspot expected, got nil)"
        local paramNum = err:match("bad argument #(%d+)")
        local expectedType = err:match("%(([%w_]+) expected")

        if paramNum and expectedType then
            results.inferred.minParams = tonumber(paramNum)
            results.inferred.paramTypes[tonumber(paramNum)] = expectedType
        end
    else
        -- Function accepted no args - might be valid
        results.inferred.maxParams = 0
    end

    -- Test 2: Call with nil arguments (1-5)
    for i = 1, 5 do
        local args = {}
        for j = 1, i do
            table.insert(args, nil)
        end

        local ok, err = pcall(func, unpack(args))
        if not ok then
            local testName = string.format("%d nil args", i)
            table.insert(results.errors, {test = testName, error = tostring(err)})

            -- Try to extract more info
            local paramNum = err:match("bad argument #(%d+)")
            local expectedType = err:match("%(([%w_]+) expected")

            if paramNum and expectedType then
                local pNum = tonumber(paramNum)
                if pNum > results.inferred.minParams then
                    results.inferred.minParams = pNum
                end
                results.inferred.paramTypes[pNum] = expectedType
            end

            -- Check for "attempt to index" errors (missing self)
            if err:match("attempt to index local 'self'") or err:match("attempt to index upvalue 'self'") then
                results.inferred.isSelfMethod = true
            end
        else
            -- Function accepted these args
            if not results.inferred.maxParams or i < results.inferred.maxParams then
                results.inferred.maxParams = i
            end
        end
    end

    -- Test 3: Call with wrong types to trigger type errors
    local testTypes = {
        ["string"] = "test",
        ["number"] = 123,
        ["boolean"] = true,
        ["table"] = {}
    }

    for typeName, value in pairs(testTypes) do
        local ok, err = pcall(func, value)
        if not ok then
            table.insert(results.errors, {
                test = string.format("arg1=%s", typeName),
                error = tostring(err)
            })

            -- Parse for expected type
            local expectedType = err:match("%(([%w_]+) expected")
            if expectedType and not results.inferred.paramTypes[1] then
                results.inferred.paramTypes[1] = expectedType
            end
        end
    end

    return results
end

-- Format analysis results as human-readable string
function FunctionProber.formatResults(results)
    local lines = {}

    table.insert(lines, string.format("=== Function Analysis: %s ===", results.name))
    table.insert(lines, "")

    -- Inferred signature
    table.insert(lines, "Inferred Signature:")
    local params = {}

    if results.inferred.isSelfMethod then
        table.insert(params, "self")
    end

    for i = 1, results.inferred.minParams do
        local paramType = results.inferred.paramTypes[i] or "any"
        table.insert(params, string.format("param%d: %s", i, paramType))
    end

    if results.inferred.maxParams and results.inferred.maxParams > results.inferred.minParams then
        for i = results.inferred.minParams + 1, results.inferred.maxParams do
            local paramType = results.inferred.paramTypes[i] or "any"
            table.insert(params, string.format("[param%d: %s]", i, paramType))
        end
    end

    local signature = string.format("%s(%s)", results.name, table.concat(params, ", "))
    if results.inferred.isSelfMethod then
        signature = ":" .. results.name:match("[^.]*$") .. "(" .. table.concat(params, ", ", 2) .. ")"
    end

    table.insert(lines, "  " .. signature)
    table.insert(lines, "")

    -- Summary
    table.insert(lines, "Summary:")
    table.insert(lines, string.format("  Min params: %d", results.inferred.minParams))
    if results.inferred.maxParams then
        table.insert(lines, string.format("  Max params: %d", results.inferred.maxParams))
    else
        table.insert(lines, "  Max params: unknown (possibly variadic)")
    end
    if results.inferred.isSelfMethod then
        table.insert(lines, "  Method: YES (requires self)")
    end
    table.insert(lines, "")

    -- Error details
    if #results.errors > 0 then
        table.insert(lines, "Error Analysis:")
        for i, errInfo in ipairs(results.errors) do
            if i <= 10 then  -- Show first 10
                table.insert(lines, string.format("  [%s] %s", errInfo.test, errInfo.error))
            end
        end
        if #results.errors > 10 then
            table.insert(lines, string.format("  ... and %d more errors", #results.errors - 10))
        end
    end

    return table.concat(lines, "\n")
end

-- Resolve function from path string
-- Example: "g_currentMission.removeMapHotspot" -> function
function FunctionProber.resolveFunctionPath(path)
    -- Split path by dots
    local parts = {}
    for part in path:gmatch("[^.]+") do
        table.insert(parts, part)
    end

    if #parts == 0 then
        return nil, "Invalid path"
    end

    -- Start with global
    local obj = _G[parts[1]]
    if not obj then
        return nil, string.format("Global '%s' not found", parts[1])
    end

    -- Navigate through path
    for i = 2, #parts do
        if type(obj) ~= "table" then
            return nil, string.format("Cannot index '%s' (not a table)", parts[i-1])
        end

        obj = obj[parts[i]]
        if not obj then
            return nil, string.format("Field '%s' not found", parts[i])
        end
    end

    if type(obj) ~= "function" then
        return nil, string.format("'%s' is not a function (type: %s)", path, type(obj))
    end

    return obj, nil
end
