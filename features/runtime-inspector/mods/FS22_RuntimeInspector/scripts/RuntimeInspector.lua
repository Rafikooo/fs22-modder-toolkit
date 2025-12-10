-- RuntimeInspector.lua (MAIN)
-- Entry point - registers console commands and initializes processors
-- NOTE: RuntimeInspector namespace is initialized in Init.lua (loaded first)

-- Delegate command handlers to CommandRegistry
function RuntimeInspector:outDir()
    return CommandRegistry.outDir(self)
end

function RuntimeInspector:help()
    return CommandRegistry.help(self)
end

function RuntimeInspector:exportByName(name, depthStr)
    return CommandRegistry.exportByName(self, name, depthStr)
end

function RuntimeInspector:exportAll(depthStr)
    return CommandRegistry.exportAll(self, depthStr)
end

function RuntimeInspector:probeFunction(funcPath, ...)
    return CommandRegistry.probeFunction(self, funcPath, ...)
end

function RuntimeInspector:evalCode(code, ...)
    return CommandRegistry.evalCode(self, code, ...)
end

function RuntimeInspector:initializeProcessors()
    if not self.Export then
        self.logi("Export module not loaded, skipping processor initialization")
        return
    end

    local Export = self.Export

    Export:registerProcessor(CycleProcessor)
    Export:registerProcessor(LimitProcessor)
    Export:registerProcessor(NilProcessor)
    Export:registerProcessor(PrimitiveProcessor)
    Export:registerProcessor(UserdataProcessor)
    Export:registerProcessor(GlobalReferenceProcessor)
    Export:registerProcessor(EventListenerProcessor)
    Export:registerProcessor(FunctionDeduplicationProcessor)
    Export:registerProcessor(FunctionProcessor)
    Export:registerProcessor(MemoryAddressKeyFilterProcessor)
    Export:registerProcessor(ArrayProcessor)
    Export:registerProcessor(MapProcessor)
    Export:registerProcessor(ObjectProcessor)
    Export:registerProcessor(MetatableProcessor)
    Export:registerProcessor(MethodExportProcessor)  -- DISABLED: Creates large dumps from listeners
    Export:registerProcessor(TableProcessor)

    Export:sortProcessors()

    self.logi("Initialized " .. #Export.processors .. " processors (sorted by priority)")
end

function RuntimeInspector:register()
    DebugCapabilities.reportCapabilities()

    self:initializeProcessors()

    CommandRegistry:registerAll(self)

    addModEventListener(self)
    self.logi("RuntimeInspector registered with " .. self:countCommands() .. " commands")
end

function RuntimeInspector:countCommands()
    local count = 0
    for cmd in pairs({
        riInspect=1, riShow=1, riWatch=1, riUnwatch=1, riEval=1, riProbe=1,
        riExport=1, riExportAll=1,
        riDumpXML=1, riDumpAll=1, riDumpSignature=1,
        riDiscoverGlobals=1, riTestAccess=1,
        riOutDir=1, riHelp=1
    }) do
        count = count + 1
    end
    return count
end


g_runtimeInspector = RuntimeInspector
g_runtimeInspector:register()
