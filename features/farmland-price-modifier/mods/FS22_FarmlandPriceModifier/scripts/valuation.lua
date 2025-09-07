-- scripts/valuation.lua
Valuation = Valuation or {}
local L = FPM and FPM.log or { info=print, warn=print, err=print }

-- stan przywracania (po fpmReprice)
local _snapshots = {}  -- [farmlandId] = { fixedPrice=?, priceFactor=? }

-- --- lokalne helpery domenowe ----------------------------------------------

local function getFarmlandChecked(id)
  FpmUtils.assertf("Valuation", g_farmlandManager ~= nil, "g_farmlandManager nil")
  FpmUtils.assertf("Valuation", g_farmlandManager:getIsValidFarmlandId(id), "invalid farmlandId")
  local f = g_farmlandManager:getFarmlandById(id)
  FpmUtils.assertf("Valuation", f ~= nil, "farmland not found: "..tostring(id))
  return f
end

local function getBasePriceAndMeta(id)
  local f = getFarmlandChecked(id)

  local price = f.price
  local usedComputed = false

  if type(price) ~= "number" then
    -- brak wyliczonej ceny – policz z PPH * ha * factor (jawna formuła)
    local pph = g_farmlandManager:getPricePerHa()
    FpmUtils.assertf("Valuation", type(pph)=="number" and pph>0, "pricePerHa unavailable")

    local ha = f.areaInHa
    FpmUtils.assertf("Valuation", type(ha)=="number" and ha>0, "farmland area missing")

    local factor = f.priceFactor or 1
    price = pph * ha * factor
    usedComputed = true
  end

  local meta = {
    areaHa     = f.areaInHa,                 -- może być nil na niektórych mapach
    pricePerHa = g_farmlandManager:getPricePerHa(),
    factor     = f.priceFactor or 1,
    fixed      = f.fixedPrice ~= nil,
    usedComputed = usedComputed
  }
  return price, meta, f
end

local function fruitToFillTypeIndex(fruitIdx)
  FpmUtils.assertf("Valuation", g_fruitTypeManager ~= nil, "g_fruitTypeManager nil")
  local desc = g_fruitTypeManager:getFruitTypeByIndex(fruitIdx)
  FpmUtils.assertf("Valuation", desc ~= nil, "unknown fruit idx "..tostring(fruitIdx))

  local ft = desc.fillTypeIndex
  if type(ft) ~= "number" then
    FpmUtils.assertf("Valuation", g_fillTypeManager ~= nil, "g_fillTypeManager nil")
    ft = g_fillTypeManager:getFillTypeIndexByName(desc.name)
  end
  FpmUtils.assertf("Valuation", type(ft)=="number", "fillTypeIndex missing on fruit "..tostring(fruitIdx))
  return ft, desc
end

local function computeCropValueEuro(farmlandId)
  FpmUtils.assertf("Valuation", Market and Market.getMedianPrice, "Market module missing")
  FpmUtils.assertf("Valuation", CropSurvey and CropSurvey.scanFarmlandCrops, "CropSurvey module missing")

  local fruitIdx, areaHa = CropSurvey:scanFarmlandCrops(farmlandId)
  if fruitIdx == nil or (areaHa or 0) <= 0 then
    return 0, nil
  end

  local fillTypeIndex, fruitDesc = fruitToFillTypeIndex(fruitIdx)

  local lps = fruitDesc.literPerSqm or fruitDesc.litersPerSqm
  FpmUtils.assertf("Valuation", type(lps)=="number" and lps>=0, "literPerSqm missing for fruit "..tostring(fruitIdx))

  local liters = areaHa * 10000 * lps
  local pricePerLiter = Market.getMedianPrice(fillTypeIndex)

  local value = liters * pricePerLiter
  return FpmUtils.round(value), fruitDesc
end

local function applyFixedPrice(farmland, newPrice)
  FpmUtils.assertf("Valuation", type(newPrice)=="number" and newPrice>=0, "applyFixedPrice bad value")
  farmland.fixedPrice = newPrice
  if farmland.updatePrice ~= nil then farmland:updatePrice() end
end

-- --- Console: fpmGetFarmlandPrice ------------------------------------------

function Valuation:consoleGetFarmlandPrice(farmlandIdStr)
  local id = tonumber(farmlandIdStr or "")
  if id == nil then return "Usage: fpmGetFarmlandPrice <farmlandId>" end

  local price, meta = getBasePriceAndMeta(id)
  local areaStr = (meta.areaHa ~= nil) and string.format("%.2f ha", meta.areaHa) or "n/a"
  local pphStr  = (type(meta.pricePerHa)=="number") and string.format("%d €/ha", FpmUtils.round(meta.pricePerHa)) or "n/a"

  return string.format(
    "Farmland %d: price=%d €, area=%s, pricePerHa=%s, factor=%.3f, fixedPrice=%s",
    id, FpmUtils.round(price), areaStr, pphStr, meta.factor, meta.fixed and "YES" or "NO"
  )
end

-- --- Console: fpmValue (base + crop) ---------------------------------------

function Valuation:consoleValue(farmlandIdStr)
  local id = tonumber(farmlandIdStr or "")
  if id == nil then return "Usage: fpmValue <farmlandId>" end

  local base = select(1, getBasePriceAndMeta(id))
  local crop = select(1, computeCropValueEuro(id)) or 0
  local newPrice = base + crop

  print(string.format("[FarmlandReprice] id=%d base=%d crop=%d new=%d", id, FpmUtils.round(base), FpmUtils.round(crop), FpmUtils.round(newPrice)))
  print(string.format("base=%d, crop=%d, new=%d", FpmUtils.round(base), FpmUtils.round(crop), FpmUtils.round(newPrice)))

  return ""
end

-- --- Console: fpmReprice (ustaw cenę = base + crop) ------------------------

function Valuation:consoleReprice(farmlandIdStr)
  local id = tonumber(farmlandIdStr or "")
  if id == nil then return "Usage: fpmReprice <farmlandId>" end

  local base, _, farmland = getBasePriceAndMeta(id)
  local crop = select(1, computeCropValueEuro(id)) or 0
  local newPrice = base + crop

  -- snapshot tylko raz
  if _snapshots[id] == nil then
    _snapshots[id] = { fixedPrice = farmland.fixedPrice, priceFactor = farmland.priceFactor }
  end

  applyFixedPrice(farmland, newPrice)

  print(string.format("[FarmlandReprice] id=%d base=%d crop=%d new=%d", id, FpmUtils.round(base), FpmUtils.round(crop), FpmUtils.round(newPrice)))
  print(string.format("base=%d, crop=%d, new=%d", FpmUtils.round(base), FpmUtils.round(crop), FpmUtils.round(newPrice)))

  return ""
end

-- --- Console: fpmClear (przywróć wcześniejszy stan) ------------------------

local function restoreOne(id)
  local snap = _snapshots[id]
  FpmUtils.assertf("Valuation", snap ~= nil, "no state to restore")

  local f = getFarmlandChecked(id)
  f.fixedPrice  = snap.fixedPrice
  f.priceFactor = snap.priceFactor
  if f.updatePrice ~= nil then f:updatePrice() end

  _snapshots[id] = nil
end

function Valuation:consoleClear(arg)
  if arg == nil or arg == "" then return "Usage: fpmClear <farmlandId|all>" end
  if arg == "all" then
    local hadAny = false
    for id, _ in pairs(_snapshots) do
      hadAny = true
      restoreOne(id)
    end
    FpmUtils.assertf("Valuation", hadAny, "no state to restore")
    return "Restored all"
  end

  local id = tonumber(arg or "")
  if id == nil then return "Usage: fpmClear <farmlandId|all>" end
  restoreOne(id)
  return string.format("Restored %d", id)
end

-- --- lifecycle -------------------------------------------------------------

function Valuation:loadMap()
  addConsoleCommand("fpmGetFarmlandPrice", "Shows base farmland price", "consoleGetFarmlandPrice", self)
  addConsoleCommand("fpmValue",            "Shows base + crop value",   "consoleValue",            self)
  addConsoleCommand("fpmReprice",          "Sets fixed price = base+crop", "consoleReprice",       self)
  addConsoleCommand("fpmClear",            "Restores former pricing",   "consoleClear",            self)
  L.info("Valuation ready")
end

function Valuation:deleteMap()
  removeConsoleCommand("fpmGetFarmlandPrice")
  removeConsoleCommand("fpmValue")
  removeConsoleCommand("fpmReprice")
  removeConsoleCommand("fpmClear")
  L.info("Valuation unloaded")
end

addModEventListener(Valuation)
