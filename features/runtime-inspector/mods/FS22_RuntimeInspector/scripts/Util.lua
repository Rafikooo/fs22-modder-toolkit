-- Util.lua
RuntimeInspector = RuntimeInspector or {}

function RuntimeInspector.logi(msg) Logging.info   ((RuntimeInspector.LOG_PREFIX or "[RuntimeInspector] ") .. msg) end
function RuntimeInspector.logw(msg) Logging.warning((RuntimeInspector.LOG_PREFIX or "[RuntimeInspector] ") .. msg) end
function RuntimeInspector.loge(msg) Logging.error  ((RuntimeInspector.LOG_PREFIX or "[RuntimeInspector] ") .. msg) end

function RuntimeInspector.ensureDir(path)
    if not path or path == "" then return end
    local acc = ""
    for part in string.gmatch(path, "[^/]+") do
        acc = (acc == "" and part) or (acc .. "/" .. part)
        pcall(function() createFolder(acc) end)
    end
end

function RuntimeInspector.sortedPairs(t)
    local keys = {}
    for k,_ in pairs(t) do keys[#keys+1] = k end
    table.sort(keys, function(a,b) return tostring(a) < tostring(b) end)
    local i = 0
    return function()
        i = i + 1
        local k = keys[i]
        if k ~= nil then return k, t[k] end
    end
end

function RuntimeInspector.sanitizeFilename(s)
    s = tostring(s):gsub("[^%w%._%-]", "_")
    return (#s > 0) and s or "unnamed"
end

function RuntimeInspector.matches(name, patt)
    if not patt or patt == "" then return true end
    if string.find(name, patt, 1, true) then return true end
    if patt:find("[%^%$%[%]%%().%*%+%-%?]") then
        local ok, res = pcall(string.match, name, patt)
        if ok and res then return true end
    end
    return false
end

function RuntimeInspector:getOutDir()
    local base = g_modSettingsDirectory or (getUserProfileAppPath() .. "modSettings/")
    local dir  = base .. (self.MOD_SETTINGS_FOLDER or "FS22_RuntimeInspector") .. "/"
    self.ensureDir(dir)
    return dir
end
