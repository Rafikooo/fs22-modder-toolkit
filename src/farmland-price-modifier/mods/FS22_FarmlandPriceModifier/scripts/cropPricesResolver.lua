CropPricesResolver = CropPricesResolver or {}
local L = FPM and FPM.log or { info=print, warn=print, err=print }

-- --- lokalne helpery domenowe ----------------------------------------------

local function resolveFillTypeIndex(userInput)
  if userInput == nil or userInput == "" then return nil end
  local idx = tonumber(userInput)
  if idx ~= nil then return idx end
  FpmUtils.assertf("CropPricesResolver", g_fillTypeManager ~= nil, "g_fillTypeManager nil")
  local upper = string.upper(tostring(userInput))
  local ft = g_fillTypeManager:getFillTypeIndexByName(upper)
  g_cu
  FpmUtils.assertf("CropPricesResolver", ft ~= nil, "Unknown fillType name: "..tostring(userInput))
  return ft
end

local function stationName(st)
  if st == nil then return "?" end
  if st.stationName ~= nil then return st.stationName end
  if st.owningPlaceable and st.owningPlaceable.getName then
    local ok, name = pcall(function() return st.owningPlaceable:getName() end)
    if ok and name then return name end
  end
  if st.getName then
    local ok, name = pcall(function() return st:getName() end)
    if ok and name then return name end
  end
  return "?"
end

local function getPricePerLiter(st, fillTypeIndex)
  if st.getEffectiveFillTypePrice then
    local p = st:getEffectiveFillTypePrice(fillTypeIndex)
    if type(p) == "number" then return p end
  end
  if st.fillTypePrices then
    local p = st.fillTypePrices[fillTypeIndex]
    if type(p) == "number" then return p end
  end
  return nil
end

-- --- API: median price ------------------------------------------------------

function CropPricesResolver.getMedianPrice(fillTypeIndex)
  FpmUtils.assertf("CropPricesResolver", type(fillTypeIndex)=="number", "getMedianPrice: bad fillTypeIndex")
  local unloadingStations =
    (g_currentMission and g_currentMission.storageSystem and g_currentMission.storageSystem.unloadingStations)
    or {}
  local prices = {}
  for _, st in pairs(unloadingStations) do
    local accepts = st and st.isSellingPoint and st.acceptedFillTypes and st.acceptedFillTypes[fillTypeIndex]
    if accepts then
      local ppl = getPricePerLiter(st, fillTypeIndex)
      if type(ppl) == "number" then table.insert(prices, ppl) end
    end
  end
  FpmUtils.assertf("CropPricesResolver", #prices > 0, "No selling stations for fillType "..tostring(fillTypeIndex))
  return FpmUtils.median(prices) -- per liter
end

-- --- Console: fpmPrices -----------------------------------------------------

function CropPricesResolver:listPrices(userFillType)
  local fillTypeIndex = tonumber(userFillType) or resolveFillTypeIndex(userFillType)
  if not fillTypeIndex then
    return "Usage: fpmPrices <FILLTYPE_NAME|INDEX>"
  end

  local unloadingStations =
    (g_currentMission and g_currentMission.storageSystem and g_currentMission.storageSystem.unloadingStations)
    or {}

  local rows, prices = {}, {}
  for _, st in pairs(unloadingStations) do
    local accepts = st and st.isSellingPoint and st.acceptedFillTypes and st.acceptedFillTypes[fillTypeIndex]
    if accepts then
      local ppl = getPricePerLiter(st, fillTypeIndex)
      if type(ppl) == "number" then
        table.insert(rows, { name = stationName(st), ppl = ppl })
        table.insert(prices, ppl)
      end
    end
  end

  table.sort(rows, function(a,b) return a.ppl > b.ppl end)
  if #rows == 0 then
    return "No stations accept this fillType."
  end

  print(string.format("[EconomyPricing] %s — prices per station (per 1000L):", tostring(userFillType)))
  for _, r in ipairs(rows) do
    print(string.format("  %s: %d", r.name, FpmUtils.round(r.ppl * 1000)))
  end

  local med = FpmUtils.median(prices)
  print(string.format("Median: %d /1000L", FpmUtils.round(med * 1000)))
  return string.format("Stations: %d, median=%d /1000L", #rows, FpmUtils.round(med * 1000))
end

function CropPricesResolver:loadMap()
  addConsoleCommand("fpmPrices", "List station prices + median: fpmPrices <FILLTYPE>", "listPrices", self)
  L.info("CropPricesResolver ready")
end

function CropPricesResolver:deleteMap()
  removeConsoleCommand("fpmPrices")
  L.info("CropPricesResolver unloaded")
end

addModEventListener(CropPricesResolver)
