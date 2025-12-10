-- core/FunctionIntrospection.lua
-- Function metadata extraction and introspection

FunctionIntrospection = FunctionIntrospection or {}

-- Extract function signature using debug.getinfo()
function FunctionIntrospection.extractSignature(func)
    local signature = {
        address = tostring(func),  -- e.g., "function: 0x12345678"
        type = "function",
        nparams = nil,      -- number of parameters (excluding varargs)
        isvararg = nil,     -- has varargs (...)
        params = nil,       -- array of parameter names (if available)
        what = nil,         -- "Lua" or "C"
        source = nil,       -- where function is defined
        linedefined = nil   -- line number where defined
    }

    -- Extract memory address for reference
    local addr = signature.address:match("function: (0x%x+)")
    if addr then
        signature.ref = addr
    end

    -- Try to get debug info (may not be available in all environments)
    if debug and debug.getinfo then
        local info = debug.getinfo(func, "nuS")
        if info then
            signature.nparams = info.nparams
            signature.isvararg = info.isvararg
            signature.what = info.what
            signature.source = info.source
            signature.linedefined = info.linedefined
        end

        -- Try to get parameter names using debug.getlocal()
        -- This only works for Lua functions, not C functions
        -- NOTE: FS22 might not allow debug.getlocal for security reasons
        if debug and debug.getlocal and signature.what == "Lua" then
            local ok, params = pcall(function()
                local p = {}
                local i = 1
                while true do
                    local name = debug.getlocal(func, i)
                    if not name then break end
                    -- Skip internal variables (start with '(')
                    if not name:match("^%(") then
                        table.insert(p, name)
                    end
                    i = i + 1
                    -- Safety limit
                    if i > 50 then break end
                end
                return p
            end)

            if ok and params and #params > 0 then
                signature.params = params
            end
        end
    end

    return signature
end

-- Check if function name follows common patterns
function FunctionIntrospection.inferFunctionType(name)
    if not name or type(name) ~= "string" then
        return "unknown"
    end

    -- Common FS22 patterns
    if name:match("^on%u") then return "event"           -- onLoad, onCreate, etc.
    elseif name:match("^update") then return "update"    -- update, updateTick
    elseif name:match("^draw") then return "render"      -- draw, drawUI
    elseif name:match("^get%u") then return "getter"     -- getValue, getPosition
    elseif name:match("^set%u") then return "setter"     -- setValue, setPosition
    elseif name:match("^is%u") then return "predicate"   -- isActive, isEmpty
    elseif name:match("^has%u") then return "predicate"  -- hasValue, hasChildren
    elseif name:match("^load") then return "loader"      -- loadFromXML
    elseif name:match("^save") then return "saver"       -- saveToXML
    elseif name:match("^new$") then return "constructor" -- new
    elseif name:match("^delete$") then return "destructor" -- delete
    end

    return "method"
end
