-- Farmland Crop Info (FS22) - DEBUG HEAVY
-- Console commands:
--   fpmGetFarmlandCrop <farmlandId>

FarmlandCropInfo = {}

local function dbg(...)
    local args = {...}
    for i,v in ipairs(args) do args[i] = tostring(v) end
    print("[FarmlandCropInfo] " .. table.concat(args, " "))
end

function FarmlandCropInfo:loadMap()
    dbg("loadMap() called")
    if addConsoleCommand ~= nil then
        addConsoleCommand(
            "fpmGetFarmlandCrop",
            "Shows dominant crop and its area for a farmland: fpmGetFarmlandCrop <id>",
            "consoleGetFarmlandCrop",
            self
        )
        dbg("Console command registered:", "fpmGetFarmlandCrop")
    else
        dbg("WARN: addConsoleCommand is nil!")
    end
end

function FarmlandCropInfo:deleteMap()
    dbg("deleteMap() called")
    if removeConsoleCommand ~= nil then
        removeConsoleCommand("fpmGetFarmlandCrop")
        dbg("Console command removed:", "fpmGetFarmlandCrop")
    else
        dbg("WARN: removeConsoleCommand is nil!")
    end
end

-- Helper: try to resolve a human-readable crop name from fruitType index
local function getFruitName(fruitTypeIndex)
    if fruitTypeIndex == nil then
        dbg("getFruitName(): fruitTypeIndex is nil -> UNKNOWN")
        return "UNKNOWN"
    end
    if g_fruitTypeManager ~= nil and g_fruitTypeManager.getFruitTypeByIndex ~= nil then
        local ok, ft = pcall(function() return g_fruitTypeManager:getFruitTypeByIndex(fruitTypeIndex) end)
        if not ok then
            dbg("getFruitName(): ERROR getFruitTypeByIndex failed for index", fruitTypeIndex)
            return tostring(fruitTypeIndex)
        end
        if ft ~= nil then
            local name = ft.name or ft.title or tostring(fruitTypeIndex)
            dbg("getFruitName(): index", fruitTypeIndex, "->", name)
            return name
        end
        dbg("getFruitName(): ft is nil for index", fruitTypeIndex)
        return tostring(fruitTypeIndex)
    end
    dbg("getFruitName(): g_fruitTypeManager or method missing; fallback tostring", fruitTypeIndex)
    return tostring(fruitTypeIndex)
end

-- Best-effort scan of fields that belong to farmlandId.
-- Returns: dominantFruitTypeIndex, totalAreaHaForThatFruit, totalFieldAreaHa
function FarmlandCropInfo:scanFarmlandCrops(farmlandId)
    dbg("scanFarmlandCrops(): start for farmlandId =", farmlandId)

    local fm = g_fieldManager
    if fm == nil or fm.getFields == nil then
        dbg("scanFarmlandCrops(): ERROR g_fieldManager or getFields is nil")
        return nil, 0, 0
    end

    local fields = nil
    local okFields, errFields = pcall(function() return fm:getFields() end)
    if okFields then
        fields = fields or errFields -- w pcall drugi zwrot to wynik
        if type(fields) ~= "table" then
            dbg("scanFarmlandCrops(): getFields() did not return a table; type =", type(fields))
            return nil, 0, 0
        end
    else
        dbg("scanFarmlandCrops(): ERROR calling getFields():", tostring(errFields))
        return nil, 0, 0
    end

    dbg("scanFarmlandCrops(): number of fields:", tostring(#fields or "n/a (non-array table)"))

    local fruitArea = {}  -- fruitTypeIndex -> areaHa
    local totalAreaHa = 0
    local matchedCount = 0
    local idxCount = 0

    for k, field in pairs(fields) do
        idxCount = idxCount + 1
        dbg("Field loop idx/key:", tostring(k), "object:", tostring(field))

        -- Associate field with farmland ID (varies by build/map)
        local fieldFarmlandId = nil
        if field ~= nil then
            if field.farmland ~= nil and field.farmland.id ~= nil then
                dbg("  Field has field.farmland.id =", field.farmland.id)
                fieldFarmlandId = field.farmland.id
            elseif field.farmlandId ~= nil then
                dbg("  Field has field.farmlandId =", field.farmlandId)
                fieldFarmlandId = field.farmlandId
            else
                dbg("  Field has no farmland link (field.farmland / field.farmlandId missing).")
            end
        else
            dbg("  WARN: field is nil")
        end

        if fieldFarmlandId == farmlandId then
            matchedCount = matchedCount + 1
            dbg("  MATCH: field belongs to farmlandId", farmlandId)

            -- Heuristic area (pick the first available)
            local areaHa = 0
            if field ~= nil then
                if field.fieldArea ~= nil then
                    areaHa = field.fieldArea
                    dbg("  area source: field.fieldArea =", areaHa)
                elseif field.area ~= nil then
                    areaHa = field.area
                    dbg("  area source: field.area =", areaHa)
                elseif field.maxFieldArea ~= nil then
                    areaHa = field.maxFieldArea
                    dbg("  area source: field.maxFieldArea =", areaHa)
                else
                    dbg("  WARN: no area property present; default 0")
                end
            end

            if type(areaHa) ~= "number" or areaHa < 0 then
                dbg("  WARN: areaHa invalid:", tostring(areaHa), "-> forcing 0")
                areaHa = 0
            end

            totalAreaHa = totalAreaHa + areaHa
            dbg("  Acc totalAreaHa now =", totalAreaHa)

            -- Try to read fruit type (API differs between maps)
            local fruitTypeIndex = nil
            if field ~= nil then
                if field.getFruitType ~= nil then
                    local okFT, res = pcall(function() return field:getFruitType() end)
                    if okFT then
                        fruitTypeIndex = res
                        dbg("  fruit source: field:getFruitType() ->", tostring(fruitTypeIndex))
                    else
                        dbg("  ERROR: field:getFruitType() failed:", tostring(res))
                    end
                elseif field.fruitType ~= nil then
                    fruitTypeIndex = field.fruitType
                    dbg("  fruit source: field.fruitType =", tostring(fruitTypeIndex))
                elseif field.fruitTypeIndex ~= nil then
                    fruitTypeIndex = field.fruitTypeIndex
                    dbg("  fruit source: field.fruitTypeIndex =", tostring(fruitTypeIndex))
                else
                    dbg("  WARN: no fruitType on field")
                end
            end

            -- If the map exposes fruit distribution per field (rare), prefer planted area
            if field ~= nil and field.getPlantedArea ~= nil then
                dbg("  Trying field:getPlantedArea()")
                local ok, plantedTableOrErr = pcall(function() return field:getPlantedArea() end)
                if ok then
                    local plantedTable = plantedTableOrErr
                    if type(plantedTable) == "table" then
                        local sumPlanted = 0
                        for ftIdx, ha in pairs(plantedTable) do
                            local haNum = tonumber(ha) or 0
                            fruitArea[ftIdx] = (fruitArea[ftIdx] or 0) + haNum
                            sumPlanted = sumPlanted + haNum
                            dbg("    planted: fruit", tostring(ftIdx), " += ", haNum, " -> total", fruitArea[ftIdx])
                        end
                        dbg("  getPlantedArea() total planted (ha) for this field:", sumPlanted)
                        goto continue_field
                    else
                        dbg("  getPlantedArea(): returned non-table:", type(plantedTable))
                    end
                else
                    dbg("  ERROR: getPlantedArea() failed:", tostring(plantedTableOrErr))
                end
            end

            -- Fallback: if we only have a single fruitType, attribute whole area to it
            if fruitTypeIndex ~= nil then
                fruitArea[fruitTypeIndex] = (fruitArea[fruitTypeIndex] or 0) + areaHa
                dbg("  Fallback assign: fruit", tostring(fruitTypeIndex), "+=", areaHa, "->", fruitArea[fruitTypeIndex])
            else
                dbg("  No fruitTypeIndex available; not assigning area.")
            end
        else
            dbg("  SKIP: fieldFarmlandId =", tostring(fieldFarmlandId), "!= requested", tostring(farmlandId))
        end
        ::continue_field::
    end

    dbg("scanFarmlandCrops(): matched fields =", matchedCount, "out of", idxCount)
    dbg("scanFarmlandCrops(): totalAreaHa =", totalAreaHa)

    -- Dump fruitArea map
    for ftIdx, ha in pairs(fruitArea) do
        dbg("  fruitArea dump: fruit", tostring(ftIdx), "=", ha, "ha (", getFruitName(ftIdx), ")")
    end

    -- Find dominant fruit by area
    local bestFruit, bestArea = nil, 0
    for ftIdx, ha in pairs(fruitArea) do
        local haNum = tonumber(ha) or 0
        if haNum > bestArea then
            bestFruit, bestArea = ftIdx, haNum
            dbg("  new best: fruit", tostring(bestFruit), "area", bestArea)
        end
    end

    if bestFruit == nil then
        dbg("scanFarmlandCrops(): No dominant fruit found.")
    else
        dbg("scanFarmlandCrops(): Dominant fruit =", tostring(bestFruit), getFruitName(bestFruit), "area =", bestArea, "of total", totalAreaHa)
    end

    return bestFruit, bestArea, totalAreaHa
end

function FarmlandCropInfo:consoleGetFarmlandCrop(farmlandIdStr)
    dbg("consoleGetFarmlandCrop() raw arg =", tostring(farmlandIdStr))
    local id = tonumber(farmlandIdStr or "")
    if id == nil then
        dbg("consoleGetFarmlandCrop(): invalid/missing id")
        return "Usage: fpmGetFarmlandCrop <farmlandId>"
    end
    dbg("consoleGetFarmlandCrop(): parsed id =", id)

    local farmlandManager = g_farmlandManager
    if farmlandManager == nil then
        dbg("consoleGetFarmlandCrop(): ERROR g_farmlandManager is nil")
        return string.format("Invalid farmlandId: %s (no farmland manager)", tostring(id))
    end

    local okValid, isValidOrErr = pcall(function() return farmlandManager:getIsValidFarmlandId(id) end)
    local isValid = okValid and isValidOrErr == true
    if not okValid then
        dbg("consoleGetFarmlandCrop(): ERROR getIsValidFarmlandId failed:", tostring(isValidOrErr))
    end
    if not isValid then
        dbg("consoleGetFarmlandCrop(): farmlandId not valid:", id)
        return string.format("Invalid farmlandId: %s", tostring(id))
    end

    local fruitIdx, cropAreaHa, totalAreaHa = self:scanFarmlandCrops(id)
    dbg("consoleGetFarmlandCrop(): scan result -> fruitIdx=", tostring(fruitIdx),
        "cropAreaHa=", tostring(cropAreaHa), "totalAreaHa=", tostring(totalAreaHa))

    if fruitIdx == nil then
        dbg("consoleGetFarmlandCrop(): No crop data available for farmland", id)
        return string.format("Farmland %d: no crop data available.", id)
    end

    local fruitName = getFruitName(fruitIdx)
    -- Round values for display
    local cropArea = math.floor((cropAreaHa or 0) * 100 + 0.5) / 100
    local totalArea = math.floor((totalAreaHa or 0) * 100 + 0.5) / 100
    local pct = (totalArea > 0) and (cropArea / totalArea * 100) or 0
    dbg("consoleGetFarmlandCrop(): display ->", "fruitName=", fruitName, "cropArea=", cropArea, "totalArea=", totalArea, "pct=", pct)

    return string.format(
        "Farmland %d: dominant crop = %s, area = %.2f ha (%.1f%% of %.2f ha fields)",
        id, fruitName, cropArea, pct, totalArea
    )
end

addModEventListener(FarmlandCropInfo)
