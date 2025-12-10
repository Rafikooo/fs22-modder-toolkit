ExportMetadata = {}

--- Write schema root element metadata
-- @param xmlId number XML file handle
-- @param name string Global variable name (e.g., "g_currentMission")
-- @param obj any Lua object being exported
-- @param depth number Export depth level
-- @param debugMode boolean Whether to include processor attribution
function ExportMetadata.writeSchemaAttributes(xmlId, name, obj, depth, debugMode)
    setXMLString(xmlId, "schema#name", name)
    setXMLString(xmlId, "schema#type", type(obj))
    setXMLInt(xmlId, "schema#depth", depth)

    -- Debug mode indicator (adds 'processedBy' to each node)
    if debugMode then
        setXMLString(xmlId, "schema#debugMode", "processor-attribution")
    end
end

--- Write processor attribution debug info to node
-- @param xmlId number XML file handle
-- @param nodePath string XML path to node
-- @param processorName string Name of processor that handled this node
function ExportMetadata.writeProcessorAttribution(xmlId, nodePath, processorName)
    setXMLString(xmlId, nodePath .. "#processedBy", processorName)
end

return ExportMetadata
