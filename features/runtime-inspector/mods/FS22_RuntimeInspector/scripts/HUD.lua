-- HUD.lua
-- Watch na ekranie w czasie rzeczywistym

RuntimeInspector = RuntimeInspector or {}

local logi, loge = RuntimeInspector.logi, RuntimeInspector.loge

RuntimeInspector.WATCH_LIMIT  = RuntimeInspector.WATCH_LIMIT or 12
RuntimeInspector.watchList    = RuntimeInspector.watchList    or {}
RuntimeInspector.watchOrder   = RuntimeInspector.watchOrder   or {}

function RuntimeInspector:addWatch(path)
    if not path or path == "" then return loge("Usage: riWatch <path>") end
    if self.watchList[path] then return logi("Already watching: " .. path) end
    if #self.watchOrder >= self.WATCH_LIMIT then return loge("Watch limit reached (" .. tostring(self.WATCH_LIMIT) .. ")") end
    self.watchList[path] = true
    table.insert(self.watchOrder, path)
    logi("Watching: " .. path)
end

function RuntimeInspector:removeWatch(path)
    if not path or path == "" then return loge("Usage: riUnwatch <path>") end
    if not self.watchList[path] then return loge("Path not watched: " .. tostring(path)) end
    self.watchList[path] = nil
    for i, p in ipairs(self.watchOrder) do
        if p == path then table.remove(self.watchOrder, i) break end
    end
    logi("Unwatched: " .. path)
end

-- Rysowanie overlay
function RuntimeInspector:draw()
    if #self.watchOrder == 0 then return end
    setTextAlignment(RenderText.ALIGN_LEFT)
    setTextColor(1, 1, 1, 1)
    setTextBold(true)
    local x, y0, step, size = 0.01, 0.01, 0.025, 0.020
    for i = 1, #self.watchOrder do
        local path = self.watchOrder[i]
        local parent, key, val_or_err = RuntimeInspector.resolvePath(path)
        local val
        if parent ~= nil or (parent == nil and key == nil) then
            val = RuntimeInspector.safeToString(val_or_err)
        else
            val = "ERR: " .. tostring(val_or_err)
        end
        local txt = string.format("%s = %s", path, val)
        renderText(x, y0 + (i - 1) * step, size, txt)
    end
end

-- Podpinamy jako ModEventListener (aby draw był wołany co frame)
function RuntimeInspector:loadMap()
    -- nic
end
function RuntimeInspector:update(dt)
    -- nic
end
function RuntimeInspector:drawUI()
    self:draw()
end
