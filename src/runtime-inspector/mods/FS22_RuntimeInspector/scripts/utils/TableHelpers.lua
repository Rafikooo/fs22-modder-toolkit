TableHelpers = TableHelpers or {}

function TableHelpers.sortedKeys(obj)
    local keys = {}
    for k in pairs(obj) do
        table.insert(keys, k)
    end

    -- Sort with type-aware comparison
    table.sort(keys, function(a, b)
        local typeA, typeB = type(a), type(b)
        if typeA ~= typeB then
            -- Sort by type first: number < string < boolean < others
            local order = {number=1, string=2, boolean=3, table=4}
            return (order[typeA] or 9) < (order[typeB] or 9)
        end

        -- Same type comparison
        if typeA == "number" or typeA == "string" then
            return a < b
        elseif typeA == "boolean" then
            return (a and 1 or 0) < (b and 1 or 0)
        else
            return tostring(a) < tostring(b)
        end
    end)

    return keys
end
