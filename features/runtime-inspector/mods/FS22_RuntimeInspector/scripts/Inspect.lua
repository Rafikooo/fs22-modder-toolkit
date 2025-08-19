-- Inspect.lua
-- Komendy inspektora: inspect, showValue

RuntimeInspector = RuntimeInspector or {}

local logi, logw, loge = RuntimeInspector.logi, RuntimeInspector.logw, RuntimeInspector.loge

function RuntimeInspector:inspect(name, depthArg)
    if not name or name == "" then return loge("Usage: riInspect <g_name> [depth]") end
    local obj = _G[name]
    if obj == nil then return loge("Global '" .. tostring(name) .. "' not found") end

    local t = type(obj)
    if t ~= "table" then return logi(name .. " = " .. self.safeToString(obj) .. " -- " .. t) end

    local depth = tonumber(depthArg) or (self.DEFAULT_DEPTH or 1)
    local maxD  = self.MAX_DEPTH or 12
    if depth < 1 or depth > maxD then return loge("Depth 1–" .. tostring(maxD)) end

    logi("===== " .. name .. " =====")
    local function walk(tbl, d, pref, visited, lines)
        if d <= 0 then return lines end
        local addr = tostring(tbl)
        if visited[addr] then logi(pref .. "(ref) " .. addr); return lines end
        visited[addr] = true

        local keys = {}
        for k,_ in pairs(tbl) do keys[#keys+1] = k end
        table.sort(keys, function(a,b) return tostring(a) < tostring(b) end)

        for _, k in ipairs(keys) do
            local v, vt = tbl[k], type(tbl[k])
            if vt == "table" then
                logi(pref .. tostring(k) .. " (table)")
                lines = walk(v, d - 1, pref .. "  ", visited, lines)
            elseif vt == "function" then
                logi(pref .. tostring(k) .. "()")
            else
                logi(pref .. tostring(k) .. " = " .. RuntimeInspector.safeToString(v) .. " -- " .. vt)
            end
            lines = lines + 1
            if lines > 2000 then logw("inspect: truncated (2000 lines)"); return lines end
        end
        return lines
    end
    walk(obj, depth, "  ", {}, 0)
end

function RuntimeInspector:showValue(path)
    local parent, key, val_or_err = RuntimeInspector.resolvePath(path)
    if parent ~= nil or (parent == nil and key == nil) then
        return logi(path .. " = " .. RuntimeInspector.safeToString(val_or_err))
    else
        return loge(val_or_err)
    end
end
