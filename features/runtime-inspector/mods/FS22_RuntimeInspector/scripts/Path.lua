RuntimeInspector = RuntimeInspector or {}

function RuntimeInspector.safeToString(v)
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
    local out = {}
    for token in string.gmatch(str, "[^" .. sepPattern .. "]+") do out[#out+1] = token end
    return out
end

local function parseFragment(fragment)
    local name, idx = string.match(fragment, "^([_%w]+)%[(%d+)%]$")
    if name then return name, tonumber(idx) else return fragment, nil end
end

function RuntimeInspector.resolvePath(path)
    if type(path) ~= "string" or path == "" then
        return nil, "Path must be non-empty string"
    end
    local parts = split(path, "%.")
    local root  = table.remove(parts, 1)
    local cur   = _G[root]
    if cur == nil then return nil, "Global '" .. tostring(root) .. "' not found" end
    if #parts == 0 then return nil, nil, cur end

    for i = 1, #parts - 1 do
        local frag = parts[i]
        local keyName, numericIndex = parseFragment(frag)
        if type(cur) ~= "table" then return nil, "Not a table at '" .. frag .. "'" end
        if numericIndex then
            local arr = cur[keyName]
            if type(arr) ~= "table" then return nil, "'" .. keyName .. "' is not a table" end
            cur = arr[numericIndex]
        else
            cur = cur[keyName]
        end
        if cur == nil then return nil, "Invalid path at '" .. frag .. "'" end
    end

    local last   = parts[#parts]
    local key, i = parseFragment(last)
    if type(cur) ~= "table" then return nil, "Cannot index non-table with '" .. last .. "'" end
    if i then
        local parent = cur[key]
        if type(parent) ~= "table" then return nil, "Final key '" .. key .. "' is not a table" end
        return parent, i, parent[i]
    else
        return cur, key, cur[key]
    end
end
