-- core/GlobalDiscovery.lua
-- Discovery of global variables from _G and metatable

GlobalDiscovery = GlobalDiscovery or {}

-- Discover all g_* globals (from _G and metatable __index)
function GlobalDiscovery.discoverAll()
    local globals = {}
    local stats = {
        direct = 0,
        metatable = 0,
        total = 0
    }

    -- Direct _G
    for k, v in pairs(_G) do
        if type(k) == "string" and k:match("^g_") then
            globals[k] = v
            stats.direct = stats.direct + 1
        end
    end

    -- Metatable __index
    local mt = getmetatable(_G)
    if mt and mt.__index and type(mt.__index) == "table" then
        for k, v in pairs(mt.__index) do
            if type(k) == "string" and k:match("^g_") and not globals[k] then
                globals[k] = v
                stats.metatable = stats.metatable + 1
            end
        end
    end

    stats.total = stats.direct + stats.metatable

    return globals, stats
end

-- Get a specific global by name (checks both _G and metatable)
function GlobalDiscovery.get(name)
    -- Try direct _G first
    local value = _G[name]
    if value ~= nil then
        return value, "direct"
    end

    -- Try metatable __index
    local mt = getmetatable(_G)
    if mt and mt.__index and type(mt.__index) == "table" then
        value = mt.__index[name]
        if value ~= nil then
            return value, "metatable"
        end
    end

    return nil, "not_found"
end

-- Check if a global exists
function GlobalDiscovery.exists(name)
    local value, source = GlobalDiscovery.get(name)
    return value ~= nil, source
end
