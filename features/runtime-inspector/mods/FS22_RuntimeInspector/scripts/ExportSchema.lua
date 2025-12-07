-- ExportSchema.lua
-- Eksport „schema”: rozpoznaje tablice, typy elementów, opcjonalność
RuntimeInspector                             = RuntimeInspector or {}

-- Konfiguracja schema
RuntimeInspector.SCHEMA_SAMPLE_COUNT         = RuntimeInspector.SCHEMA_SAMPLE_COUNT or 8
RuntimeInspector.SCHEMA_MAX_FIELDS_PER_TABLE = RuntimeInspector.SCHEMA_MAX_FIELDS_PER_TABLE or 500
RuntimeInspector.SCHEMA_KEY_BLACKLIST        = RuntimeInspector.SCHEMA_KEY_BLACKLIST or
    { mission = true, vehicles = true }

-- Pomocnicze
local function sortedPairs(t)
    local it = RuntimeInspector.sortedPairs and RuntimeInspector.sortedPairs(t)
    if it then return it end
    local keys = {}
    for k, _ in pairs(t) do keys[#keys + 1] = k end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    local i = 0
    return function()
        i = i + 1; local k = keys[i]; if k ~= nil then return k, t[k] end
    end
end

local function isArrayLike(t)
    if type(t) ~= "table" then return false end
    local nNum, nOther = 0, 0
    for k, _ in pairs(t) do
        if type(k) == "number" then nNum = nNum + 1 else nOther = nOther + 1 end
        if nOther > 0 then return false end
    end
    return nNum > 0
end

local function arrayLengthLike(t)
    local maxI = 0
    for k, _ in pairs(t) do
        if type(k) == "number" and k > maxI then maxI = k end
    end
    return maxI
end

local function sortedNumericKeys(t)
    local keys = {}
    for k, _ in pairs(t) do if type(k) == "number" then keys[#keys + 1] = k end end
    table.sort(keys)
    return keys
end

local function pickEvenly(keys, want)
    if #keys <= want then return keys end
    local out, n = {}, #keys
    for i = 0, want - 1 do
        local idx = math.floor(i * (n - 1) / (want - 1) + 1)
        out[#out + 1] = keys[idx]
    end
    return out
end

local function typeTag(v)
    local t = type(v)
    if t == "number" or t == "string" or t == "boolean" or t == "function" or t == "userdata" then
        return t
    elseif t == "table" then
        return "table"
    else
        return t
    end
end

local function mergeTypeSets(a, b)
    if not a then return b end
    if not b then return a end
    if a == b then return a end
    local set, out = {}, {}
    for typ in string.gmatch(a, "[^|]+") do set[typ] = true end
    for typ in string.gmatch(b, "[^|]+") do set[typ] = true end
    for typ, _ in pairs(set) do out[#out + 1] = typ end
    table.sort(out)
    return table.concat(out, "|")
end

-- Schema writer (zintegrowany z RuntimeInspector)
function RuntimeInspector:writeSchemaTable(xmlId, xmlPath, tbl, depth, visited)
    if depth <= 0 then
        setXMLBool(xmlId, xmlPath .. "#maxDepthReached", true)
        return
    end
    local addr = tostring(tbl)
    if visited[addr] then
        setXMLBool(xmlId, xmlPath .. "#alreadySeen", true)
        return
    end
    visited[addr] = true

    local wrote, fieldIdx, tableIdx = 0, 0, 0
    local blacklist = self.SCHEMA_KEY_BLACKLIST

    for k, v in sortedPairs(tbl) do
        if type(k) == "string" and not (blacklist and blacklist[k]) then
            local tv = type(v)
            if tv == "table" then
                local childPath = string.format("%s.table(%d)", xmlPath, tableIdx)
                setXMLString(xmlId, childPath .. "#name", k)
                self:writeSchemaValue(xmlId, childPath, v, depth - 1, visited)
                tableIdx = tableIdx + 1
            else
                local p = string.format("%s.field(%d)", xmlPath, fieldIdx)
                setXMLString(xmlId, p .. "#name", k)
                setXMLString(xmlId, p .. "#type", tv)
                fieldIdx = fieldIdx + 1
            end
            wrote = wrote + 1
            if wrote >= (self.SCHEMA_MAX_FIELDS_PER_TABLE or 500) then
                setXMLBool(xmlId, xmlPath .. "#childrenTruncated", true)
                break
            end
        end
    end
end

function RuntimeInspector:writeSchemaValue(xmlId, xmlPath, val, depth, visited)
    local tv = type(val)
    if tv ~= "table" then
        setXMLString(xmlId, xmlPath .. "#type", tv)
        return
    end

    if isArrayLike(val) then
        local arrPath = xmlPath .. ".array"
        setXMLInt(xmlId, arrPath .. "#lengthHint", arrayLengthLike(val))

        local keys                  = sortedNumericKeys(val)
        local sampleKeys            = pickEvenly(keys, self.SCHEMA_SAMPLE_COUNT or 8)

        local elemTypeSet, sawTable = nil, false
        for _, idx in ipairs(sampleKeys) do
            local et = typeTag(val[idx])
            elemTypeSet = mergeTypeSets(elemTypeSet, et)
            if et == "table" then sawTable = true end
        end
        setXMLString(xmlId, arrPath .. "#elementType", elemTypeSet or "nil")

        if sawTable and depth > 0 then
            local merged, appear = {}, {}
            for _, idx in ipairs(sampleKeys) do
                local ev = val[idx]
                if type(ev) == "table" then
                    local c = 0
                    for ck, cv in pairs(ev) do
                        if type(ck) == "string" and not ((self.SCHEMA_KEY_BLACKLIST or {})[ck]) then
                            local ctyp = typeTag(cv)
                            merged[ck] = mergeTypeSets(merged[ck], ctyp)
                            appear[ck] = (appear[ck] or 0) + 1
                            c = c + 1
                            if c > (self.SCHEMA_MAX_FIELDS_PER_TABLE or 500) then break end
                        end
                    end
                end
            end
            local i, elemPath = 0, arrPath .. ".elementSchema"
            -- użyj sortedPairs aby mieć deterministykę
            for name, typ in sortedPairs(merged) do
                local f = string.format("%s.field(%d)", elemPath, i)
                setXMLString(xmlId, f .. "#name", name)
                setXMLString(xmlId, f .. "#type", typ)
                if appear[name] and appear[name] < #sampleKeys then
                    setXMLBool(xmlId, f .. "#optional", true)
                end
                i = i + 1
            end
        end
    else
        setXMLString(xmlId, xmlPath .. "#kind", "table")
        self:writeSchemaTable(xmlId, xmlPath, val, depth, visited)
    end
end

-- Public: riDumpSignature <globalPath> [depth] [fileNameBase]
function RuntimeInspector:dumpSignature(globalPath, depthArg, fileNameBase)
    if not globalPath or globalPath == "" then
        return self.loge("Usage: riDumpSignature <globalPath> [depth] [fileName]")
    end

    -- Resolve path
    local parts = {}
    for token in string.gmatch(globalPath, "[^%.]+") do parts[#parts + 1] = token end
    local rootName = table.remove(parts, 1)
    local cur = _G[rootName]
    if cur == nil then return self.loge("Global '" .. rootName .. "' not found") end
    for _, key in ipairs(parts) do
        if type(cur) ~= "table" or cur[key] == nil then
            return self.loge("Path '" .. key .. "' not valid in " .. RuntimeInspector.safeToString(cur))
        end
        cur = cur[key]
    end

    local depth = tonumber(depthArg) or (self.DEFAULT_DEPTH or 1)
    local maxD  = self.MAX_DEPTH or 12
    if depth < 1 or depth > maxD then
        return self.loge("Depth must be in the range 1–" .. tostring(maxD))
    end

    local dir         = self:getOutDir()
    local suffix      = globalPath:gsub("%.", "_")
    local depthSuffix = string.format("_%02d", depth)
    local fileName    = (fileNameBase and fileNameBase ~= "" and fileNameBase or suffix) .. depthSuffix .. "_sig.xml"
    local fullPath    = dir .. fileName

    local xmlId       = createXMLFile("RuntimeInspectorSignature", fullPath, "signature")
    if xmlId == 0 then return self.loge("Failed to create XML file: " .. fullPath) end

    setXMLString(xmlId, "signature#name", globalPath)
    setXMLInt(xmlId, "signature#depth", depth)
    setXMLBool(xmlId, "signature#isServer",
        (g_currentMission and g_currentMission.getIsServer and g_currentMission:getIsServer()) or false)

    local rootPath = "signature"
    if type(cur) ~= "table" then
        setXMLString(xmlId, rootPath .. ".field(0)#name", parts[#parts] or rootName)
        setXMLString(xmlId, rootPath .. ".field(0)#type", type(cur))
    else
        local entryPath = rootPath .. ".table(0)"
        setXMLString(xmlId, entryPath .. "#name", parts[#parts] or rootName)
        self:writeSchemaValue(xmlId, entryPath, cur, depth, {})
    end

    saveXMLFile(xmlId); delete(xmlId)
    self.logi("Signature saved to " .. fullPath)
end
