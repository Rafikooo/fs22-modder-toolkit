-- CommandRegistry.lua
-- Console command registration and handlers
-- Separated from main RuntimeInspector.lua for clarity

CommandRegistry = CommandRegistry or {}

-- Register all console commands
function CommandRegistry:registerAll(runtimeInspector)
    local RI = runtimeInspector

    -- Core inspection
    addConsoleCommand("riInspect",          "Inspect a g_* (table/value)",            "inspect",          RI)
    addConsoleCommand("riShow",             "Show value by path",                      "showValue",        RI)
    addConsoleCommand("riWatch",            "Watch path on HUD",                       "addWatch",         RI)
    addConsoleCommand("riUnwatch",          "Stop watching path",                      "removeWatch",      RI)
    addConsoleCommand("riEval",             "Evaluate Lua code",                       "evalCode",         RI)
    addConsoleCommand("riProbe",            "Analyze function signature",              "probeFunction",    RI)

    -- NEW Export commands
    addConsoleCommand("riExport",           "Export single global (optimized)",        "exportByName",     RI)
    addConsoleCommand("riExportAll",        "Export all globals (optimized)",          "exportAll",        RI)

    -- Legacy export commands
    addConsoleCommand("riDumpXML",          "Dump nested path to XML (values)",        "dumpXML",          RI)
    addConsoleCommand("riDumpAll",          "Dump all ^g_ roots into files (values)", "dumpAll",          RI)
    addConsoleCommand("riDumpSignature",    "Dump runtime schema (array-aware)",       "dumpSignature",    RI)

    -- Discovery commands (from GlobalDiscovery.lua)
    if RI.discoverAllGlobals then
        addConsoleCommand("riDiscoverGlobals", "Discover all g_ globals at runtime", "discoverAllGlobals", RI)
    end
    if RI.testDirectAccess then
        addConsoleCommand("riTestAccess",       "Test direct access vs _G iteration",      "testDirectAccess", RI)
    end

    -- Info
    addConsoleCommand("riVersion",          "Show Lua version",                        "showVersion",      RI)
    addConsoleCommand("riOutDir",           "Show output dir",                         "outDir",           RI)
    addConsoleCommand("riHelp",             "Show help",                               "help",             RI)
end

-- Command handlers

function CommandRegistry.exportByName(RI, name, depthStr)
    if not name or name == "" then
        return "Usage: riExport <name> [depth]"
    end

    local Export = RI.Export
    local depth = tonumber(depthStr) or Export.DEFAULT_DEPTH

    -- Get the global
    local obj, source = GlobalDiscovery.get(name)
    if not obj then
        return string.format("Global '%s' not found", name)
    end

    Export:exportObject(name, obj, depth)
    return string.format("Exported %s with depth %d", name, depth)
end

function CommandRegistry.exportAll(RI, depthStr)
    local Export = RI.Export
    local depth = tonumber(depthStr) or Export.DEFAULT_DEPTH
    Export:exportAll(depth)
    return string.format("Exported all globals with depth %d", depth)
end

function CommandRegistry.probeFunction(RI, funcPath, ...)
    if not funcPath or funcPath == "" then
        return "Usage: riProbe <function_path>\nExample: riProbe g_currentMission.removeMapHotspot"
    end

    -- Join all arguments if path has spaces
    local args = {...}
    if #args > 0 then
        funcPath = funcPath .. " " .. table.concat(args, " ")
    end

    -- Resolve function
    local func, err = FunctionProber.resolveFunctionPath(funcPath)
    if not func then
        RI.loge("Error: " .. err)
        return "Error resolving function"
    end

    -- Analyze function
    RI.logi("Analyzing function: " .. funcPath)
    RI.logi("This may generate errors - that's expected!")
    RI.logi("")

    local results = FunctionProber.analyzeFunction(func, funcPath)
    local formatted = FunctionProber.formatResults(results)

    -- Print results
    for line in formatted:gmatch("[^\n]+") do
        RI.logi(line)
    end

    return "Analysis complete"
end

function CommandRegistry.evalCode(RI, code, ...)
    if not code or code == "" then
        return "Usage: riEval <lua_code>"
    end

    -- Join all arguments (console splits on spaces)
    local args = {...}
    if #args > 0 then
        code = code .. " " .. table.concat(args, " ")
    end

    -- Convert colon notation to dot notation with self
    -- Example: "g_currentMission:method(args)" -> "g_currentMission.method(g_currentMission, args)"
    code = code:gsub("([%w_%.%[%]]+):(%w+)%(", function(obj, method)
        return string.format("%s.%s(%s, ", obj, method, obj)
    end)

    -- Try to evaluate the code
    local func, err = loadstring("return " .. code)
    if not func then
        -- Maybe it's a statement, not an expression
        func, err = loadstring(code)
    end

    if not func then
        RI.loge("Syntax error: " .. tostring(err))
        return "Syntax error"
    end

    -- Execute with pcall for safety
    local success, result = pcall(func)

    if not success then
        RI.loge("Runtime error: " .. tostring(result))
        return "Runtime error"
    end

    -- Format result
    local resultType = type(result)
    local resultStr = tostring(result)

    if resultType == "table" then
        -- Count table entries
        local count = 0
        for _ in pairs(result) do count = count + 1 end
        RI.logi(string.format("Result: table (%d entries) = %s", count, resultStr))

        -- Show first few entries
        local shown = 0
        for k, v in pairs(result) do
            if shown >= 5 then
                RI.logi("  ...")
                break
            end
            RI.logi(string.format("  [%s] = %s (%s)", tostring(k), tostring(v), type(v)))
            shown = shown + 1
        end
    elseif resultType == "function" then
        RI.logi(string.format("Result: function = %s", resultStr))
    elseif resultType == "nil" then
        RI.logi("Result: nil")
    else
        RI.logi(string.format("Result: %s = %s", resultType, resultStr))
    end

    return resultStr
end

function CommandRegistry.showVersion(RI)
    RI.logi("Lua version: " .. _VERSION)
    return _VERSION
end

function CommandRegistry.outDir(RI)
    if not RI.getOutDir then return RI.loge("getOutDir not available (check modDesc order)") end
    RI.logi("Output dir: " .. RI:getOutDir())
end

function CommandRegistry.help(RI)
    RI.logi("== INSPECTION ==")
    RI.logi("riInspect <g_name> [depth]                         - inspect a table/value")
    RI.logi("riShow <path>                                      - show value (e.g. g_fieldManager.fields[1].fruitType)")
    RI.logi("riWatch <path> / riUnwatch <path>                  - on-screen watch")
    RI.logi("riEval <lua_code>                                  - evaluate Lua code and print result")
    RI.logi("riProbe <function_path>                            - analyze function signature via error probing")
    RI.logi("")
    RI.logi("== EXPORT (NEW) ==")
    RI.logi("riExport <name> [depth]                            - export single global by name (optimized)")
    RI.logi("riExportAll [depth]                                - export all globals (optimized)")
    RI.logi("  depth: 1-12 or -1 for unlimited (default: 1)")
    RI.logi("  Optimizations: inline, summary, constant, boolean lookup, homogeneous arrays")
    RI.logi("")
    RI.logi("== EXPORT (LEGACY) ==")
    RI.logi("riDumpXML <globalPath> [depth] [tag] [file]        - export subtree values to XML")
    RI.logi("riDumpAll [depth] [folder] [tag]                   - export all ^g_ roots (values)")
    RI.logi("riDumpSignature <globalPath> [depth] [file]        - export runtime schema (array-aware)")
    RI.logi("")
    RI.logi("== DISCOVERY ==")
    RI.logi("riDiscoverGlobals                                  - discover all g_* globals at runtime")
    RI.logi("riTestAccess                                       - test metatable __index vs _G iteration")
    RI.logi("")
    RI.logi("== INFO ==")
    RI.logi("riVersion                                          - show Lua version")
    RI.logi("riOutDir                                           - show output dir")
    RI.logi("riHelp                                             - show this help")
end
