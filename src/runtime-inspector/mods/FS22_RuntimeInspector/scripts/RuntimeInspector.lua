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
    Export:registerProcessor(PrimitiveProcessor)
    Export:registerProcessor(UserdataProcessor)
    Export:registerProcessor(GlobalReferenceProcessor)
    Export:registerProcessor(FunctionDeduplicationProcessor)
    Export:registerProcessor(MemoryAddressKeyFilterProcessor)
    Export:registerProcessor(ArrayProcessor)
    Export:registerProcessor(MapProcessor)
    Export:registerProcessor(ObjectProcessor)
    Export:registerProcessor(MetatableProcessor)
    Export:registerProcessor(MethodExportProcessor)
    Export:registerProcessor(TableProcessor)

    Export:sortProcessors()

    self.logi("Initialized " .. #Export.processors .. " processors (sorted by priority)")
end

function RuntimeInspector:register()
    DebugCapabilities.reportCapabilities()

    self:initializeProcessors()

    CommandRegistry:registerAll(self)

    addModEventListener(self)
    self.logi("RuntimeInspector registered")
end

g_runtimeInspector = RuntimeInspector
g_runtimeInspector:register()
