-- RuntimeInspector.lua
-- Command-based tool for exploring in-game data.
-- Console prefix: ri*
-- Global: g_ri

---@class RuntimeInspector
RuntimeInspector = {}

-- =========================
-- CONFIG
-- =========================
RuntimeInspector.DEFAULT_DEPTH = 1
RuntimeInspector.MAX_DEPTH     = 15
RuntimeInspector.MAX_NODES     = 50000
RuntimeInspector.WATCH_LIMIT   = 12
RuntimeInspector.LOG_PREFIX    = "[RuntimeInspector] "

-- Output directory mode (kept simple: modSettings only)
RuntimeInspector.OUT_MODE            = "modSettings"
RuntimeInspector.MOD_SETTINGS_FOLDER = "FS22_RuntimeInspector"

-- =========================
-- UTILS
-- =========================
local function logi(msg) Logging.info   (RuntimeInspector.LOG_PREFIX .. msg) end
local function logw(msg) Logging.warning(RuntimeInspector.LOG_PREFIX .. msg) end
local function loge(msg) Logging.error  (RuntimeInspector.LOG_PREFIX .. msg) end

local function safeToString(v)
    local t = type(v)
    if t == "table" then
        return string.format("table:%s", tostring(v):gsub("table: ", ""))
    elseif t == "function" then
        return "function"
    else
        return tostring(v)
    end
end

local function split(str, sepPattern)
    local parts = {}
    for token in string.gmatch(str, "[^" .. sepPattern .. "]+") do
        table.insert(parts, token)
    end
    return parts
end

local function sortedPairs(t)
    local keys, i = {}, 0
    for k, _ in pairs(t) do table.insert(keys, k) end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    return function()
        i = i + 1
        local k = keys[i]
        if k ~= nil then
            return k, t[k]
        end
    end
end

local function isServer()
    return g_currentMission ~= nil and g_currentMission.getIsServer ~= nil and g_currentMission:getIsServer()
end

local function ensureDir(path)
    if not path or path == "" then return end
    local abs = string.sub(path, 1, 1) == "/"
    local acc = abs and "/" or ""
    for part in string.gmatch(path, "[^/]+") do
        if part ~= "" then
            if acc == "/" or acc == "" then
                acc = (acc == "/") and ("/" .. part) or part
            else
                acc = acc .. "/" .. part
            end
            pcall(function() createFolder(acc) end)
        end
    end
end

function RuntimeInspector:getOutDir()
    if self.OUT_MODE == "modSettings" then
        local base = g_modSettingsDirectory or (getUserProfileAppPath() .. "modSettings/")
        local dir  = base .. self.MOD_SETTINGS_FOLDER .. "/"
        ensureDir(dir)
        return dir, nil
    else
        return nil, "unknown OUT_MODE: " .. tostring(self.OUT_MODE)
    end
end

-- Expose small util bundle for submodules
RuntimeInspector._util = {
    logi = logi, logw = logw, loge = loge,
    safeToString = safeToString,
    split = split,
    sortedPairs = sortedPairs,
    isServer = isServer
}

-- =========================
-- PATH RESOLUTION: "g_name.foo[3].bar"
-- Returns: parent, key/index, value  (or nil, "error")
-- =========================
local function parseFragment(fragment)
    local name, idx = string.match(fragment, "^([_%w]+)%[(%d+)%]$")
    if name then
        return name, tonumber(idx)
    else
        return fragment, nil
    end
end

local function resolvePath(path)
    if type(path) ~= "string" or path == "" then
        return nil, "Path must be non-empty string"
    end

    local parts = split(path, "%.")
    local root = table.remove(parts, 1)
    local cur = _G[root]
    if cur == nil then
        return nil, "Global '" .. tostring(root) .. "' not found"
    end

    if #parts == 0 then
        return nil, nil, cur
    end

    for i = 1, #parts - 1 do
        local frag = parts[i]
        local keyName, numericIndex = parseFragment(frag)

        if type(cur) ~= "table" then
            return nil, "Not a table when resolving '" .. frag .. "'"
        end

        if numericIndex then
            local arr = cur[keyName]
            if type(arr) ~= "table" then
                return nil, "Path '" .. keyName .. "' is not a table"
            end
            cur = arr[numericIndex]
        else
            cur = cur[keyName]
        end

        if cur == nil then
            return nil, "Invalid path at '" .. frag .. "'"
        end
    end

    local lastFrag = parts[#parts]
    local keyName, numericIndex = parseFragment(lastFrag)

    if type(cur) ~= "table" then
        return nil, "Cannot index non-table value with '" .. lastFrag .. "'"
    end

    if numericIndex then
        local parent = cur[keyName]
        if type(parent) ~= "table" then
            return nil, "Final key '" .. keyName .. "' is not a table"
        end
        return parent, numericIndex, parent[numericIndex]
    else
        return cur, keyName, cur[keyName]
    end
end

-- =========================
-- WATCHER (HUD)
-- =========================
RuntimeInspector.watchList  = {}
RuntimeInspector.watchOrder = {}

function RuntimeInspector:addWatch(path)
    if not path or path == "" then return loge("Usage: riWatch <path>") end
    if self.watchList[path] then
        return logw("Already watching: " .. path)
    end
    if #self.watchOrder >= self.WATCH_LIMIT then
        return loge("Watch limit reached (" .. tostring(self.WATCH_LIMIT) .. ")")
    end
    self.watchList[path] = true
    table.insert(self.watchOrder, path)
    logi("Watching: " .. path)
end

function RuntimeInspector:removeWatch(path)
    if not path then return loge("Usage: riUnwatch <path>") end
    if not self.watchList[path] then
        return loge("Path not watched: " .. tostring(path))
    end
    self.watchList[path] = nil
    for i, p in ipairs(self.watchOrder) do
        if p == path then table.remove(self.watchOrder, i) break end
    end
    logi("Unwatched: " .. path)
end

function RuntimeInspector:draw()
    if #self.watchOrder == 0 then return end
    setTextAlignment(RenderText.ALIGN_LEFT)
    setTextColor(1, 1, 1, 1)
    setTextBold(true)
    local x, y0, step, size = 0.01, 0.01, 0.025, 0.020
    for i = 1, #self.watchOrder do
        local path = self.watchOrder[i]
        local parent, key, val_or_err = resolvePath(path)
        local val
        if parent ~= nil or (parent == nil and key == nil) then
            val = safeToString(val_or_err)
        else
            val = "ERR: " .. tostring(val_or_err)
        end
        local txt = string.format("%s = %s", path, val)
        renderText(x, y0 + (i - 1) * step, size, txt)
    end
end

-- =========================
-- INSPECT & VALUES
-- =========================
function RuntimeInspector:inspect(name, depthArg)
    if not name or name == "" then return loge("Usage: riInspect <g_name> [depth]") end
    local obj = _G[name]
    if obj == nil then return loge("Global '" .. tostring(name) .. "' not found") end

    local t = type(obj)
    if t ~= "table" then
        return logi(string.format("%s = %s -- %s", name, safeToString(obj), t))
    end

    local depth = tonumber(depthArg) or 1
    if depth < 1 or depth > RuntimeInspector.MAX_DEPTH then
        return loge("Depth must be in the range 1–" .. tostring(RuntimeInspector.MAX_DEPTH))
    end

    logi("===== " .. name .. " =====")
    local function walk(tbl, d, pref, visited, count)
        if d <= 0 then return count end
        local addr = tostring(tbl)
        if visited[addr] then
            logi(pref .. "(ref) " .. addr)
            return count
        end
        visited[addr] = true
        for k, v in sortedPairs(tbl) do
            local vt = type(v)
            if vt == "table" then
                logi(pref .. tostring(k) .. " (table)")
                count = walk(v, d - 1, pref .. "  ", visited, count)
            elseif vt == "function" then
                logi(pref .. tostring(k) .. "()")
            else
                logi(pref .. tostring(k) .. " = " .. safeToString(v) .. " -- " .. vt)
            end
            count = count + 1
            if count > 2000 then
                logw("inspect: truncated (2000 lines)")
                return count
            end
        end
        return count
    end
    walk(obj, depth, "  ", {}, 0)
end

function RuntimeInspector:inspectAll(depthArg)
    local depth = tonumber(depthArg) or 1
    if depth < 1 or depth > 2 then
        return loge("inspectAll depth allowed: 1–2")
    end
    local keys = {}
    for k, _ in pairs(_G) do
        if type(k) == "string" and k:match("^g_[A-Za-z0-9_]+$") then
            table.insert(keys, k)
        end
    end
    table.sort(keys)
    for _, k in ipairs(keys) do
        local v = _G[k]
        local t = type(v)
        if t == "table" and depth == 2 then
            logi(k .. " (table)")
            for kk, vv in sortedPairs(v) do
                logi("  " .. tostring(kk) .. " -- " .. type(vv))
            end
        else
            logi(k .. " -- " .. t)
        end
    end
end

function RuntimeInspector:showValue(path)
    if not path then return loge("Usage: riShow <path>") end
    local parent, key, val_or_err = resolvePath(path)
    if parent ~= nil or (parent == nil and key == nil) then
        return logi(path .. " = " .. safeToString(val_or_err))
    else
        return loge(val_or_err)
    end
end

function RuntimeInspector:setValue(path, newValue)
    if not path or newValue == nil then
        return loge("Usage: riSet <path> <value>")
    end
    if not isServer() then
        return loge("riSet is allowed only on server/SP host")
    end

    local parent, key, old = resolvePath(path)
    if not parent then
        return loge(key or old)
    end

    local t = type(old)
    local conv
    if t == "boolean" then
        local l = string.lower(tostring(newValue))
        if l == "true" or l == "1" then conv = true
        elseif l == "false" or l == "0" then conv = false
        else return loge("Cannot convert '" .. tostring(newValue) .. "' to boolean") end
    elseif t == "number" then
        conv = tonumber(newValue)
        if not conv then return loge("Cannot convert '" .. tostring(newValue) .. "' to number") end
    elseif t == "string" then
        conv = tostring(newValue)
    else
        return loge("Type '" .. t .. "' not supported for riSet")
    end

    parent[key] = conv
    logi(string.format("Set %s: %s → %s", path, safeToString(old), safeToString(conv)))
end

-- More robust function finder:
function RuntimeInspector:listFuncs(pattern)
  -- If no pattern: use useful prefixes
  local names = {}
  if not pattern or pattern == "" then
      local prefixes = {
          "create","load","save","delete","getXML","setXML","file",
          "addConsole","removeConsole","getUserProfileAppPath"
      }
      for k, v in pairs(_G) do
          if type(k) == "string" and type(v) == "function" then
              for _, pfx in ipairs(prefixes) do
                  if string.sub(k, 1, #pfx) == pfx then
                      table.insert(names, k)
                      break
                  end
              end
          end
      end
  else
      -- Treat as plain substring by default; if user gives a Lua pattern, it still works.
      for k, v in pairs(_G) do
          if type(k) == "string" and type(v) == "function" then
              local ok = false
              -- plain find
              if string.find(k, pattern, 1, true) then ok = true end
              -- fallback to Lua pattern if it contains meta chars
              if not ok and pattern:find("[%^%$%[%]%%().%*%+%-%?]") then
                  local okMatch = pcall(function() return string.match(k, pattern) end)
                  if okMatch then ok = string.match(k, pattern) ~= nil end
              end
              if ok then table.insert(names, k) end
          end
      end
  end

  table.sort(names)
  if #names == 0 then
    return logw("No functions matched pattern: " .. (pattern or "(default)"))
  end
  logi("Functions matching " .. (pattern and ("/" .. pattern .. "/") or "(default prefixes)") .. ":")
  for _, n in ipairs(names) do logi("  " .. n) end
end

function RuntimeInspector:outDir()
    local dir, err = self:getOutDir()
    if dir then logi("Output dir: " .. dir) else loge(err) end
end

function RuntimeInspector:help()
  logi("=== RuntimeInspector ===")
  logi("riInspect <g_name> [depth]       - inspect a table/value")
  logi("riInspectAll [depth]             - list all g_* (depth 1–2)")
  logi("riShow <path>                    - show value (e.g. g_fieldManager.fields[1].fruitType)")
  logi("riSet <path> <value>             - set scalar (server/SP; bool/num/str)")
  logi("riWatch <path> / riUnwatch       - HUD watch (limit " .. tostring(self.WATCH_LIMIT) .. ")")
  logi("riDumpXML <globalPath> [d] [tag] [file] - export to XML values")
  logi("riDumpSignature <globalPath> [depth] [file] - export type/signature XML")
  logi("riOutDir                         - show resolved output directory")
  logi("riFuncs [substring-or-pattern]   - list global functions")
  logi("Example: riDumpXML g_currentMission 2")
end

-- =========================
-- COMMAND REGISTRATION
-- =========================
function RuntimeInspector:register()
    addConsoleCommand("riInspect",    "Inspect a g_* (table/value)",             "inspect",     self)
    addConsoleCommand("riInspectAll", "List all g_* (optionally shallow)",       "inspectAll",  self)
    addConsoleCommand("riShow",       "Show value of a global path",             "showValue",   self)
    addConsoleCommand("riSet",        "Set scalar value (server/SP)",            "setValue",    self)
    addConsoleCommand("riWatch",      "Watch path on HUD",                       "addWatch",    self)
    addConsoleCommand("riUnwatch",    "Stop watching path",                      "removeWatch", self)
    addConsoleCommand("riDumpXML",    "Dump nested path to XML",                 "dumpXML",     self) -- from ri_xml.lua
    addConsoleCommand("riDumpSignature",    "Dump nested path to XML",           "dumpSignature",     self) -- from ri_xml.lua
    addConsoleCommand("riOutDir",     "Show resolved output directory",          "outDir",      self)
    addConsoleCommand("riFuncs",      "List global functions (substring/pattern)","listFuncs",   self)
    addConsoleCommand("riHelp",       "Show RuntimeInspector usage",             "help",        self)
    addModEventListener(self)
    logi("RuntimeInspector registered")
end
