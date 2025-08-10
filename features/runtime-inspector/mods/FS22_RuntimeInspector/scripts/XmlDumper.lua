-- ri_xml.lua
-- XML dumping utilities (cycles, limits, array lens).

-- Pull small util bundle from main
local U = RuntimeInspector._util
local logi, logw, loge = U.logi, U.logw, U.loge
local safeToString     = U.safeToString
local split            = U.split
local sortedPairs      = U.sortedPairs

-- Tunables for XML output
RuntimeInspector.ARRAY_LENS_THRESHOLD   = RuntimeInspector.ARRAY_LENS_THRESHOLD   or 120
RuntimeInspector.ARRAY_LENS_SAMPLES     = RuntimeInspector.ARRAY_LENS_SAMPLES     or 5
RuntimeInspector.SCHEMA_SCAN_LIMIT      = RuntimeInspector.SCHEMA_SCAN_LIMIT      or 40
RuntimeInspector.MAX_CHILDREN_PER_TABLE = RuntimeInspector.MAX_CHILDREN_PER_TABLE or 5000
RuntimeInspector.EMIT_TABLE_ADDRESS     = (RuntimeInspector.EMIT_TABLE_ADDRESS ~= false)

local function isArrayLike(t)
    if type(t) ~= "table" then return false end
    local nNumeric, nOther = 0, 0
    for k, _ in pairs(t) do
        if type(k) == "number" then nNumeric = nNumeric + 1 else nOther = nOther + 1 end
        if nOther > 0 then return false end
    end
    return nNumeric > 0
end

local function arrayLength(t)
    local n = 0
    for k, _ in pairs(t) do
        if type(k) == "number" and k > n then n = k end
    end
    return n
end

local function shallowTableSample(tbl, maxFields)
    local out, c = {}, 0
    for k, v in pairs(tbl) do
        local tv = type(v)
        if tv == "boolean" or tv == "number" or tv == "string" then
            out[tostring(k)] = v
            c = c + 1
            if c >= (maxFields or 12) then break end
        end
    end
    return out
end

local function inferSchema(samples)
    local types = {}
    for _, smp in ipairs(samples) do
        for k, v in pairs(smp) do
            local tn = type(v)
            types[k] = (types[k] and types[k] ~= tn) and "mixed" or tn
        end
    end
    return types
end

local function writeArraySummary(self, xmlId, xmlPath, arr)
    local len = arrayLength(arr)
    setXMLBool(xmlId,  xmlPath .. "#array",   true)
    setXMLInt (xmlId,  xmlPath .. "#length",  len)
    setXMLBool(xmlId,  xmlPath .. "#summary", true)

    -- samples
    local added = 0
    for i = 1, len do
        local v = arr[i]
        if v ~= nil then
            local base = xmlPath .. ".sample(" .. tostring(added) .. ")"
            setXMLInt(xmlId, base .. "#index", i)
            if type(v) == "table" then
                local c = 0
                for k2, vv in pairs(shallowTableSample(v, 12)) do
                    local f = base .. ".field(" .. tostring(c) .. ")"
                    setXMLString(xmlId, f .. "#key", tostring(k2))
                    local tv = type(vv)
                    setXMLString(xmlId, f .. "#type", tv)
                    if tv == "boolean" then setXMLBool (xmlId, f .. "#value", vv)
                    elseif tv == "number" then setXMLFloat(xmlId, f .. "#value", vv)
                    else setXMLString(xmlId, f .. "#value", tostring(vv)) end
                    c = c + 1
                end
            else
                local f = base .. ".field(0)"
                local tv = type(v)
                setXMLString(xmlId, f .. "#key", "value")
                setXMLString(xmlId, f .. "#type", tv)
                if tv == "boolean" then setXMLBool (xmlId, f .. "#value", v)
                elseif tv == "number" then setXMLFloat(xmlId, f .. "#value", v)
                else setXMLString(xmlId, f .. "#value", tostring(v)) end
            end
            added = added + 1
            if added >= RuntimeInspector.ARRAY_LENS_SAMPLES then break end
        end
    end

    -- schema (first N table items)
    local schemaSamples, count = {}, 0
    for i = 1, math.min(len, RuntimeInspector.SCHEMA_SCAN_LIMIT) do
        local v = arr[i]
        if type(v) == "table" then
            table.insert(schemaSamples, shallowTableSample(v, 24))
            count = count + 1
        end
        if count >= RuntimeInspector.SCHEMA_SCAN_LIMIT then break end
    end
    local schema = inferSchema(schemaSamples)
    local sIdx = 0
    for k, tn in pairs(schema) do
        local p = xmlPath .. ".schemaField(" .. tostring(sIdx) .. ")"
        setXMLString(xmlId, p .. "#name", tostring(k))
        setXMLString(xmlId, p .. "#type", tostring(tn))
        sIdx = sIdx + 1
    end
end

function RuntimeInspector:writeTable(xmlId, xmlPath, depth, visited, tbl, counters, state)
    if depth <= 0 then
        setXMLBool(xmlId, xmlPath .. "#maxDepthReached", true)
        return
    end
    if state.nodes >= RuntimeInspector.MAX_NODES then
        setXMLBool(xmlId, xmlPath .. "#maxNodesReached", true)
        return
    end

    local addr = tostring(tbl)
    if visited[addr] then
        local basePath = xmlPath .. ".table"
        counters[basePath] = (counters[basePath] or 0) + 1
        local idx = counters[basePath] - 1
        local childPath = basePath .. "(" .. idx .. ")"
        setXMLString(xmlId, childPath .. "#key", tostring(visited.keys[addr]))
        setXMLString(xmlId, childPath .. "#type", "table")
        setXMLString(xmlId, childPath .. "#refAddress", addr)
        setXMLBool  (xmlId, childPath .. "#alreadyRendered", true)
        state.nodes = state.nodes + 1
        return
    end

    visited[addr] = true
    if RuntimeInspector.EMIT_TABLE_ADDRESS then
        setXMLString(xmlId, xmlPath .. "#address", addr)
    end

    if isArrayLike(tbl) then
        local len = arrayLength(tbl)
        if len > RuntimeInspector.ARRAY_LENS_THRESHOLD then
            writeArraySummary(self, xmlId, xmlPath, tbl)
            return
        else
            setXMLBool(xmlId, xmlPath .. "#array", true)
            setXMLInt (xmlId, xmlPath .. "#length", len)
        end
    end

    local writtenHere = 0
    for k, v in sortedPairs(tbl) do
        if state.nodes >= RuntimeInspector.MAX_NODES then break end
        if RuntimeInspector.MAX_CHILDREN_PER_TABLE and writtenHere >= RuntimeInspector.MAX_CHILDREN_PER_TABLE then
            setXMLBool(xmlId, xmlPath .. "#childrenTruncated", true)
            break
        end

        local t = type(v)
        local nodeName = (t == "table") and "table" or "field"
        local basePath = xmlPath .. "." .. nodeName
        counters[basePath] = (counters[basePath] or 0) + 1
        local idx = counters[basePath] - 1
        local childPath = basePath .. "(" .. idx .. ")"

        setXMLString(xmlId, childPath .. "#key", tostring(k))
        setXMLString(xmlId, childPath .. "#type", t)
        state.nodes = state.nodes + 1
        writtenHere = writtenHere + 1

        if t == "table" then
            if next(v) == nil then
                setXMLBool(xmlId, childPath .. "#empty", true)
            else
                local childAddr = tostring(v)
                visited.keys[childAddr] = k
                self:writeTable(xmlId, childPath, depth - 1, visited, v, counters, state)
            end
        elseif t == "boolean" then
            setXMLBool (xmlId, childPath .. "#value", v)
        elseif t == "number" then
            setXMLFloat(xmlId, childPath .. "#value", v)
        elseif t == "string" then
            setXMLString(xmlId, childPath .. "#value", v)
        else
            setXMLString(xmlId, childPath .. "#value", safeToString(v))
        end
    end
end

function RuntimeInspector:dumpXML(globalPath, depthArg, rootTag, fileNameBase)
    if not globalPath then return loge("Usage: riDumpXML <globalPath> [depth] [rootTag] [fileName]") end

    local parts = split(globalPath, "%.")
    local rootName = table.remove(parts, 1)
    local tbl = _G[rootName]
    if tbl == nil then return loge("Global '" .. rootName .. "' not found") end

    local current = tbl
    for _, key in ipairs(parts) do
        if type(current) ~= "table" or current[key] == nil then
            return loge("Path '" .. key .. "' not valid in " .. safeToString(current))
        end
        current = current[key]
    end

    local depth = tonumber(depthArg) or RuntimeInspector.DEFAULT_DEPTH
    if depth < 1 or depth > RuntimeInspector.MAX_DEPTH then
        return loge("Depth must be in the range 1–" .. tostring(RuntimeInspector.MAX_DEPTH))
    end

    local dir, derr = self:getOutDir()
    if not dir then return loge("Cannot resolve output dir: " .. tostring(derr)) end

    local suffix      = table.concat(split(globalPath, "%."), "_")
    local depthSuffix = string.format("_%02d", depth)
    local fileName    = (fileNameBase and fileNameBase ~= "" and fileNameBase or suffix) .. depthSuffix .. ".xml"
    local fullPath    = dir .. fileName

    local tag = rootTag or "global"
    local xmlId = createXMLFile("RuntimeInspectorDump", fullPath, tag)
    if xmlId == 0 then return loge("Failed to create XML file: " .. fullPath) end

    setXMLString(xmlId, tag .. "#name", globalPath)
    setXMLBool  (xmlId, tag .. "#isServer", (g_currentMission and g_currentMission.getIsServer and g_currentMission:getIsServer()) or false)

    if type(current) ~= "table" then
        local leafKey = parts[#parts] or rootName
        setXMLString(xmlId, tag .. ".field(0)#key", leafKey)
        setXMLString(xmlId, tag .. ".field(0)#type", type(current))
        local t = type(current)
        if t == "boolean" then
            setXMLBool(xmlId, tag .. ".field(0)#value", current)
        elseif t == "number" then
            setXMLFloat(xmlId, tag .. ".field(0)#value", current)
        else
            setXMLString(xmlId, tag .. ".field(0)#value", tostring(current))
        end
        saveXMLFile(xmlId); delete(xmlId)
        return logi("DumpXML: saved scalar to " .. fullPath)
    end

    local visited = { keys = {} }
    visited.keys[tostring(tbl)] = rootName

    local counters = {}
    local state = { nodes = 0 }
    self:writeTable(xmlId, tag, depth, visited, current, counters, state)

    setXMLInt(xmlId, tag .. "#nodeCount", state.nodes)
    saveXMLFile(xmlId)
    delete(xmlId)
    logi(string.format("DumpXML: saved %d nodes to %s (rootTag=%s)", state.nodes, fullPath, tag))
end
