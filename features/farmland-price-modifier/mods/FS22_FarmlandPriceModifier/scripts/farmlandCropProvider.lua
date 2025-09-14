FarmlandCropProvider = FarmlandCropProvider or {}
local L = FPM and FPM.log or { info=print, warn=print, err=print }

function FarmlandCropProvider:scanFarmlandCrops(farmlandId)
  local fields = g_fieldManager:getFields() or {}

  local areaByFruit, totalArea = {}, 0
  for _, field in pairs(fields) do
    local fid = field and ((field.farmland and field.farmland.id) or field.farmlandId)
    if fid == farmlandId then
      local areaHa = (field and (field.fieldArea or field.area or field.maxFieldArea)) or 0
      if type(areaHa) ~= "number" or areaHa < 0 then areaHa = 0 end
      totalArea = totalArea + areaHa

      local fruit = field and field.fruitType
      if fruit == nil and g_fieldManager.findFieldFruit ~= nil then
        pcall(function() g_fieldManager:findFieldFruit(field) end)
        fruit = field and field.fruitType
      end

      if fruit ~= nil then
        areaByFruit[fruit] = (areaByFruit[fruit] or 0) + areaHa
      end
    end
  end

  local bestFruit, bestArea = nil, 0
  for fIdx, a in pairs(areaByFruit) do
    if (a or 0) > bestArea then bestFruit, bestArea = fIdx, a end
  end

  return bestFruit, bestArea, totalArea
end

function FarmlandCropProvider:consoleGetFarmlandCrop(farmlandIdStr)
  local id = tonumber(farmlandIdStr or "")
  if id == nil then return "Usage: fpmGetFarmlandCrop <farmlandId>" end

  local fruitIdx, cropAreaHa, totalAreaHa = self:scanFarmlandCrops(id)
  if fruitIdx == nil then
    return string.format("Farmland %d: no crop data available.", id)
  end

  local fruitDesc = g_fruitTypeManager:getFruitTypeByIndex(fruitIdx)
  local fruitName = (fruitDesc and (fruitDesc.name or fruitDesc.title)) or tostring(fruitIdx)
  local cropArea = math.floor((cropAreaHa or 0) * 100 + 0.5) / 100
  local totalArea = math.floor((totalAreaHa or 0) * 100 + 0.5) / 100
  local pct = (totalArea > 0) and (cropArea / totalArea * 100) or 0

  return string.format(
    "Farmland %d: dominant crop = %s, area = %.2f ha (%.1f%% of %.2f ha fields)",
    id, fruitName, cropArea, pct, totalArea
  )
end

function FarmlandCropProvider:loadMap()
  addConsoleCommand(
    "fpmGetFarmlandCrop",
    "Shows dominant crop and its area: fpmGetFarmlandCrop <id>",
    "consoleGetFarmlandCrop",
    self
  )
  L.info("FarmlandCropProvider ready")
end

function FarmlandCropProvider:deleteMap()
  removeConsoleCommand("fpmGetFarmlandCrop")
  L.info("FarmlandCropProvider unloaded")
end

addModEventListener(FarmlandCropProvider)
