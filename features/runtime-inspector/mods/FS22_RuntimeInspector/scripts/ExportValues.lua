-- ExportValues.lua
-- Zrzut wartości: dumpXML / dumpAll / dumpAllByPattern
RuntimeInspector = RuntimeInspector or {}

local function sortedPairs(t)
    local it = RuntimeInspector.sortedPairs and RuntimeInspector.sortedPairs(t)
    if it then return it end
    local keys = {}
    for k,_ in pairs(t) do keys[#keys+1] = k end
    table.sort(keys, function(a,b) return tostring(a) < tostring(b) end)
    local i=0
    return function() i=i+1; local k=keys[i]; if k~=nil then return k, t[k] end end
end

function RuntimeInspector.writeValueTree(xmlId, xmlPath, depth, visited, tbl, counters, state)
    local maxNodes = RuntimeInspector.MAX_NODES or 50000
    if depth <= 0 then setXMLBool(xmlId, xmlPath .. "#maxDepthReached", true); return end
    if state.nodes >= maxNodes then setXMLBool(xmlId, xmlPath .. "#maxNodesReached", true); return end

    local addr = tostring(tbl)
    if visited[addr] then
        setXMLString(xmlId, xmlPath .. "#ref", addr)
        state.nodes = state.nodes + 1
        return
    end
    visited[addr] = true

    for k, v in sortedPairs(tbl) do
        if state.nodes >= maxNodes then break end
        local t = type(v)
        local nodeName = (t == "table") and "table" or "field"
        local basePath = xmlPath .. "." .. nodeName
        counters[basePath] = (counters[basePath] or 0) + 1
        local idx = counters[basePath] - 1
        local p   = basePath .. "(" .. idx .. ")"

        setXMLString(xmlId, p .. "#key", tostring(k))
        setXMLString(xmlId, p .. "#type", t)
        state.nodes = state.nodes + 1

        if t == "table" then
            if next(v) == nil then
                setXMLBool(xmlId, p .. "#empty", true)
            else
                RuntimeInspector.writeValueTree(xmlId, p, depth - 1, visited, v, counters, state)
            end
        elseif t == "boolean" then
            setXMLBool (xmlId, p .. "#value", v)
        elseif t == "number" then
            setXMLFloat(xmlId, p .. "#value", v)
        elseif t == "string" then
            setXMLString(xmlId, p .. "#value", v)
        else
            setXMLString(xmlId, p .. "#value", RuntimeInspector.safeToString(v))
        end
    end
end

function RuntimeInspector:dumpXML(globalPath, depthArg, rootTag, fileNameBase)
    if not globalPath then return self.loge("Usage: riDumpXML <globalPath> [depth] [rootTag] [fileName]") end

    local depth = tonumber(depthArg) or (self.DEFAULT_DEPTH or 1)
    local maxD  = self.MAX_DEPTH or 12
    if depth < 1 or depth > maxD then return self.loge("Depth 1–" .. tostring(maxD)) end

    local parts = {}
    for token in string.gmatch(globalPath, "[^%.]+") do parts[#parts+1] = token end
    local rootName = table.remove(parts, 1)
    local cur = _G[rootName]
    if cur == nil then return self.loge("Global '" .. rootName .. "' not found") end
    for _, key in ipairs(parts) do
        if type(cur) ~= "table" or cur[key] == nil then return self.loge("Invalid path at '" .. key .. "'") end
        cur = cur[key]
    end

    local dir = self:getOutDir()
    local tag = rootTag or "global"

    local base
    if fileNameBase and fileNameBase ~= "" then
        base = fileNameBase
    else
        local segs = { rootName }
        for _, s in ipairs(parts) do segs[#segs+1] = s end
        base = table.concat(segs, "_")
    end

    local subd = base:match("(.+)/[^/]+$")
    if subd then self.ensureDir(dir .. subd .. "/") end

    local file  = base .. string.format("_%02d.xml", depth)
    local full  = dir .. file
    local xmlId = createXMLFile("RIDump", full, tag)
    if xmlId == 0 then return self.loge("Failed to create XML file: " .. full) end

    setXMLString(xmlId, tag .. "#name", globalPath)

    if type(cur) ~= "table" then
        setXMLString(xmlId, tag .. ".field(0)#key", parts[#parts] or rootName)
        setXMLString(xmlId, tag .. ".field(0)#type", type(cur))
        local t = type(cur)
        if t == "boolean" then setXMLBool (xmlId, tag .. ".field(0)#value", cur)
        elseif t == "number" then setXMLFloat(xmlId, tag .. ".field(0)#value", cur)
        else setXMLString(xmlId, tag .. ".field(0)#value", tostring(cur)) end
        saveXMLFile(xmlId); delete(xmlId)
        return self.logi("DumpXML: saved scalar to " .. full)
    end

    local visited, counters, state = {}, {}, { nodes = 0 }
    RuntimeInspector.writeValueTree(xmlId, tag, depth, visited, cur, counters, state)
    setXMLInt(xmlId, tag .. "#nodeCount", state.nodes)
    saveXMLFile(xmlId); delete(xmlId)
    self.logi(string.format("DumpXML: saved %d nodes to %s", state.nodes, full))
end

function RuntimeInspector:dumpAll(depthArg, folder, rootTag)
    return self:dumpAllByPattern(depthArg, "^g_", folder, rootTag)
end

function RuntimeInspector:dumpAllByPattern(depthArg, pattern, folder, rootTag)
    local depth = tonumber(depthArg) or (self.DEFAULT_DEPTH or 1)
    local maxD  = self.MAX_DEPTH or 12
    if depth < 1 or depth > maxD then return self.loge("Depth 1–" .. tostring(maxD)) end

    local pat       = (pattern == "*" and ".*") or pattern or "^g_"
    local subfolder = (folder and folder ~= "") and folder or "byRoot"
    local baseDir   = self:getOutDir()
    self.ensureDir(baseDir .. subfolder .. "/")

    local keys = {}
    for k,_ in pairs(_G) do
        if type(k) == "string" and self.matches(k, pat) then keys[#keys+1] = k end
    end
    table.sort(keys)

    if #keys == 0 then return self.logw("dumpAllByPattern: no matches for pattern=" .. tostring(pat)) end

    local done = 0
    for _, name in ipairs(keys) do
        local fileBase = subfolder .. "/" .. self.sanitizeFilename(name)
        self:dumpXML(name, depth, rootTag or "global", fileBase)
        done = done + 1
    end
    self.logi(string.format("dumpAllByPattern: wrote %d files to %s", done, baseDir .. subfolder .. "/"))
end
