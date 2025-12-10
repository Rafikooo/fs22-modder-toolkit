-- utils/DebugCapabilities.lua
-- Responsible for: Testing and reporting Lua debug library capabilities
-- SRP: Single place for runtime environment introspection

DebugCapabilities = {}

--- Test debug library availability and functionality
-- @return table Report with test results
function DebugCapabilities.test()
    local report = {
        debugAvailable = debug ~= nil,
        getinfo = false,
        getlocal = false,
        traceback = false,
        getinfoWorks = false,
        stringDump = false,
        stringDumpWorks = false,
        bytecodeHasNames = false
    }

    -- Test debug library
    if debug then
        report.getinfo = debug.getinfo ~= nil
        report.getlocal = debug.getlocal ~= nil
        report.traceback = debug.traceback ~= nil

        -- Test if debug.getinfo actually works
        if debug.getinfo then
            local testFunc = function(a, b) return a + b end
            local ok, info = pcall(function() return debug.getinfo(testFunc, "nuS") end)
            if ok and info then
                report.getinfoWorks = true
                report.getinfoNparams = info.nparams
            end
        end
    end

    -- Test string.dump
    if string.dump then
        report.stringDump = true
        local testFunc = function(self, hotspot, force) return 1 end
        local ok, bytecode = pcall(string.dump, testFunc)
        if ok then
            report.stringDumpWorks = true
            -- Check if parameter names are in bytecode
            report.bytecodeHasNames = bytecode:find("hotspot") ~= nil
        end
    end

    return report
end

--- Format and log capabilities report
-- @param report table Report from test()
function DebugCapabilities.logReport(report)
    RuntimeInspector.logi("=== Runtime Environment Capabilities ===")

    -- Debug library
    if report.debugAvailable then
        RuntimeInspector.logi("debug library: AVAILABLE")
        RuntimeInspector.logi("  debug.getinfo: " .. tostring(report.getinfo))
        RuntimeInspector.logi("  debug.getlocal: " .. tostring(report.getlocal))
        RuntimeInspector.logi("  debug.traceback: " .. tostring(report.traceback))

        if report.getinfoWorks then
            RuntimeInspector.logi("  debug.getinfo() works! nparams=" .. tostring(report.getinfoNparams))
        elseif report.getinfo then
            RuntimeInspector.logi("  debug.getinfo() EXISTS but FAILS")
        end
    else
        RuntimeInspector.logi("debug library: NOT AVAILABLE")
    end

    -- Alternative introspection
    RuntimeInspector.logi("Alternative introspection methods:")
    RuntimeInspector.logi("  string.dump: " .. tostring(report.stringDump))

    if report.stringDumpWorks then
        RuntimeInspector.logi("  string.dump() WORKS! Can extract bytecode")
        RuntimeInspector.logi("  Bytecode contains param names: " .. tostring(report.bytecodeHasNames))
    elseif report.stringDump then
        RuntimeInspector.logi("  string.dump() BLOCKED")
    end
end

--- Test and report capabilities (convenience function)
function DebugCapabilities.reportCapabilities()
    local report = DebugCapabilities.test()
    DebugCapabilities.logReport(report)
    return report
end

return DebugCapabilities
