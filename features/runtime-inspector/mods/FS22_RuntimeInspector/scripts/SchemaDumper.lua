-- SchemaDumper.lua (fix)

local U = RuntimeInspector._util
local logi, logw, loge = U.logi, U.logw, U.loge
local sortedPairs      = U.sortedPairs

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
    for k, _ in pairs(t) do
        if type(k) == "number" then table.insert(keys, k) end
    end
    table.sort(keys)
    return keys
end

local function pickEvenly(keys, want)
    if #keys <= want then return keys end
    local out, n = {}, #keys
    for i = 0, want - 1 do
        local idx = math.floor(i * (n - 1) / (want - 1) + 1)
        table.insert(out, keys[idx])
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
    for typ, _ in pairs(set) do table.insert(out, typ) end
    table.sort(out)
    return table.concat(out, "|")
end

local function writeSkippedPlaceholder(xmlId, xmlPath, idx, name, val)
    local t = type(val)
    if t == "table" then
        local p = string.format("%s.table(%d)", xmlPath, idx)
        setXMLString(xmlId, p .. "#name", name)
        setXMLBool  (xmlId, p .. "#skipped", true)
        setXMLString(xmlId, p .. "#reason", "blacklisted")
    else
        local p = string.format("%s.field(%d)", xmlPath, idx)
        setXMLString(xmlId, p .. "#name", name)
        setXMLString(xmlId, p .. "#type", t)
        setXMLBool  (xmlId, p .. "#skipped", true)
        setXMLString(xmlId, p .. "#reason", "blacklisted")
    end
end

local Sig = {
    SAMPLE_COUNT = 8,
    MAX_FIELDS_PER_TABLE = 500,
    KEY_BLACKLIST = { mission = true, vehicles = true },
    EMIT_SKIPPED_PLACEHOLDER = true,
}

local function writeField(xmlId, base, idx, name, typ)
    local p = string.format("%s.field(%d)", base, idx)
    setXMLString(xmlId, p .. "#name", name)
    setXMLString(xmlId, p .. "#type", typ)
end

function Sig:writeTableSchema(xmlId, xmlPath, tbl, depth, visited)
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

    local wrote, fieldIdx = 0, 0

    for k, v in sortedPairs(tbl) do
        if type(k) ~= "string" then
            -- pomiń nie-stringowe klucze w mapie
        else
            if self.KEY_BLACKLIST and self.KEY_BLACKLIST[k] then
                if self.EMIT_SKIPPED_PLACEHOLDER then
                    writeSkippedPlaceholder(xmlId, xmlPath, fieldIdx, k, v)
                    fieldIdx = fieldIdx + 1
                    wrote = wrote + 1
                end
            else
                local tv = type(v)
                if tv == "table" then
                    local childPath = string.format("%s.table(%d)", xmlPath, fieldIdx)
                    setXMLString(xmlId, childPath .. "#name", k)
                    self:writeValueSchema(xmlId, childPath, v, depth - 1, visited)
                else
                    writeField(xmlId, xmlPath, fieldIdx, k, tv)
                end
                fieldIdx = fieldIdx + 1
                wrote = wrote + 1
            end
        end

        if wrote >= self.MAX_FIELDS_PER_TABLE then
            setXMLBool(xmlId, xmlPath .. "#childrenTruncated", true)
            break
        end
    end
end

function Sig:writeValueSchema(xmlId, xmlPath, val, depth, visited)
    local tv = type(val)
    if tv ~= "table" then
        setXMLString(xmlId, xmlPath .. "#type", tv)
        return
    end

    if isArrayLike(val) then
        local arrPath = xmlPath .. ".array"
        -- nazwa dziedziczona z rodzica (jeśli ustawiona wyżej)
        local parentName = getXMLString(xmlId, xmlPath .. "#name") or ""
        setXMLString(xmlId, arrPath .. "#name", parentName)
        setXMLInt   (xmlId, arrPath .. "#lengthHint", arrayLengthLike(val))

        -- 1) policz typy elementów i czy są tam tabele
        local keys       = sortedNumericKeys(val)
        local sampleKeys = pickEvenly(keys, self.SAMPLE_COUNT)

        local elemTypeSet = nil
        local sawTable    = false
        for _, idx in ipairs(sampleKeys) do
            local ev = val[idx]
            local et = typeTag(ev)
            elemTypeSet = mergeTypeSets(elemTypeSet, et)
            if et == "table" then sawTable = true end
        end
        setXMLString(xmlId, arrPath .. "#elementType", elemTypeSet or "nil")

        -- 2) jeśli elementy to tabele i mamy jeszcze budżet głębokości – zbuduj elementSchema
        if sawTable and depth > 0 then
            local merged, appear = {}, {}
            for _, idx in ipairs(sampleKeys) do
                local ev = val[idx]
                if type(ev) == "table" then
                    local c = 0
                    for ck, cv in pairs(ev) do
                        if type(ck) == "string" and not (self.KEY_BLACKLIST and self.KEY_BLACKLIST[ck]) then
                            local ctyp = typeTag(cv)
                            merged[ck] = mergeTypeSets(merged[ck], ctyp)
                            appear[ck] = (appear[ck] or 0) + 1
                            c = c + 1
                            if c > self.MAX_FIELDS_PER_TABLE then break end
                        end
                    end
                end
            end
            local elemPath, i = arrPath .. ".elementSchema", 0
            for name, typ in pairs(merged) do
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
        self:writeTableSchema(xmlId, xmlPath, val, depth, visited)
    end
end

function RuntimeInspector:dumpSignature(globalPath, depthArg, fileNameBase)
    if not globalPath or globalPath == "" then
        return loge("Usage: riDumpSignature <globalPath> [depth] [fileName]")
    end

    local parts = {}
    for token in string.gmatch(globalPath, "[^%.]+") do table.insert(parts, token) end
    local rootName = table.remove(parts, 1)
    local cur = _G[rootName]
    if cur == nil then return loge("Global '" .. rootName .. "' not found") end
    for _, key in ipairs(parts) do
        if type(cur) ~= "table" or cur[key] == nil then
            return loge("Path '" .. key .. "' not valid in " .. tostring(cur))
        end
        cur = cur[key]
    end

    local depth = tonumber(depthArg) or RuntimeInspector.DEFAULT_DEPTH
    if depth < 1 or depth > RuntimeInspector.MAX_DEPTH then
        return loge("Depth must be in the range 1–" .. tostring(RuntimeInspector.MAX_DEPTH))
    end

    local dir, derr = self:getOutDir()
    if not dir then return loge("Cannot resolve output dir: " .. tostring(derr)) end

    local suffix      = globalPath:gsub("%.", "_")
    local depthSuffix = string.format("_%02d", depth)
    local fileName    = (fileNameBase and fileNameBase ~= "" and fileNameBase or suffix) .. depthSuffix .. "_sig.xml"
    local fullPath    = dir .. fileName

    local xmlId = createXMLFile("RuntimeInspectorSignature", fullPath, "signature")
    if xmlId == 0 then return loge("Failed to create XML file: " .. fullPath) end

    setXMLString(xmlId, "signature#name", globalPath)
    setXMLInt   (xmlId, "signature#depth", depth)
    setXMLBool  (xmlId, "signature#isServer",
        (g_currentMission and g_currentMission.getIsServer and g_currentMission:getIsServer()) or false)

    local rootPath = "signature"
    if type(cur) ~= "table" then
        setXMLString(xmlId, rootPath .. ".field(0)#name", parts[#parts] or rootName)
        setXMLString(xmlId, rootPath .. ".field(0)#type", type(cur))
    else
        local entryPath = rootPath .. ".table(0)"
        setXMLString(xmlId, entryPath .. "#name", parts[#parts] or rootName)
        Sig:writeValueSchema(xmlId, entryPath, cur, depth, {})
    end

    saveXMLFile(xmlId)
    delete(xmlId)
    logi("Signature saved to " .. fullPath)
end
