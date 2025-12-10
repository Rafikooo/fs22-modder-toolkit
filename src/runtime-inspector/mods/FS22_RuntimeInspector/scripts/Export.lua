RuntimeInspector.Export = RuntimeInspector.Export or {}
local Export = RuntimeInspector.Export

-- Configuration
Export.DEFAULT_DEPTH = 1
Export.MAX_DEPTH = 12
Export.MAX_NODES = 1000000

-- Debug mode - adds 'processedBy' attribute to XML nodes
Export.DEBUG_PROCESSOR_ATTRIBUTION = true  -- Set to false to disable

-- Processor chain (will be sorted by priority)
Export.processors = {}

--- Register a processor in the chain
-- @param processor table Processor object with supports() and process() methods
function Export:registerProcessor(processor)
    table.insert(self.processors, processor)
end

--- Sort processors by priority (lower = earlier)
function Export:sortProcessors()
    table.sort(self.processors, function(a, b)
        return (a.priority or 500) < (b.priority or 500)
    end)
end

--- Get export configuration object
-- @return table Configuration for ExportSingle and ExportBatch
function Export:getConfig()
    return {
        maxNodes = self.MAX_NODES,
        debugMode = self.DEBUG_PROCESSOR_ATTRIBUTION,
        processors = self.processors
    }
end

--- Export a single object (delegates to ExportSingle)
-- @param name string Global variable name
-- @param obj any Lua object to export
-- @param depth number Maximum traversal depth (optional)
-- @return boolean Success status
function Export:exportObject(name, obj, depth)
    depth = depth or self.DEFAULT_DEPTH
    return ExportSingle.export(name, obj, depth, self:getConfig())
end

--- Export all globals (delegates to ExportBatch)
-- @param depth number Maximum traversal depth (optional)
-- @return table Results {successful, failed, total, errors}
function Export:exportAll(depth)
    depth = depth or self.DEFAULT_DEPTH
    return ExportBatch.exportAll(depth, self:getConfig())
end
