-- Farmland Price Modifier for FS22
-- Console commands:
--  fpmSetFarmlandPriceModifier <farmlandId> <multiplier>
--  fpmGetFarmlandPrice <farmlandId>
--  fpmResetFarmlandPriceModifier <farmlandId|all>

FarmlandPriceModifier = {
    -- Maps of original/base values per farmland id
    originalFixedPrice  = {}, -- [id] = base fixedPrice (may be nil if map uses dynamic pricing)
    originalPriceFactor = {}  -- [id] = base priceFactor (defaults to 1 when fixedPrice is used)
}

function FarmlandPriceModifier:loadMap()
    addConsoleCommand(
        "fpmSetFarmlandPriceModifier",
        "Sets a farmland price multiplier: fpmSetFarmlandPriceModifier <id> <multiplier>",
        "consoleSetFarmlandPriceModifier",
        self
    )

    addConsoleCommand(
        "fpmGetFarmlandPrice",
        "Shows farmland price and parameters: fpmGetFarmlandPrice <id>",
        "consoleGetFarmlandPrice",
        self
    )

    addConsoleCommand(
        "fpmResetFarmlandPriceModifier",
        "Resets price modifier (by ID or all): fpmResetFarmlandPriceModifier <id|all>",
        "consoleResetFarmlandPriceModifier",
        self
    )

    addConsoleCommand(
        "fpmFarmlandPriceHelp",
        "Shows help for FarmlandPriceModifier commands.",
        "consoleHelpFarmlandPrice",
        self
    )
end

function FarmlandPriceModifier:deleteMap()
    removeConsoleCommand("fpmSetFarmlandPriceModifier")
    removeConsoleCommand("fpmGetFarmlandPrice")
    removeConsoleCommand("fpmResetFarmlandPriceModifier")
    removeConsoleCommand("fpmFarmlandPriceHelp")
end

-- Store the original/base values for a farmland so we can restore them later
function FarmlandPriceModifier:rememberBase(farmland)
    local id = farmland.id
    if self.originalFixedPrice[id] == nil then
        self.originalFixedPrice[id] = farmland.fixedPrice -- may be nil
    end
    if self.originalPriceFactor[id] == nil then
        -- Default to 1 when the parcel had no priceFactor (typical when fixedPrice is used)
        self.originalPriceFactor[id] = farmland.priceFactor or 1
    end
end

-- Apply multiplier and recalculate price
function FarmlandPriceModifier:applyModifier(id, multiplier)
    local fm = g_farmlandManager
    if fm == nil or not fm:getIsValidFarmlandId(id) then
        return string.format("Invalid farmlandId: %s", tostring(id))
    end

    local farmland = fm:getFarmlandById(id)
    if farmland == nil then
        return string.format("Farmland with id %d not found", id)
    end

    self:rememberBase(farmland)

    if farmland.fixedPrice ~= nil then
        -- Map uses a fixed price: scale against the stored base value
        local base = self.originalFixedPrice[id] or farmland.fixedPrice
        farmland.fixedPrice = base * multiplier
    else
        -- Standard case: use priceFactor
        farmland.priceFactor = multiplier
    end

    if farmland.updatePrice ~= nil then
        -- Recompute farmland.price based on areaInHa, pricePerHa and priceFactor
        farmland:updatePrice()
    end

    local price = farmland.price or 0
    return string.format("OK: Farmland %d -> multiplier=%.3f, new price=%d €", id, multiplier, math.floor(price + 0.5))
end

function FarmlandPriceModifier:consoleSetFarmlandPriceModifier(farmlandIdStr, multiplierStr)
    if not g_currentMission:getIsServer() then
        return "Command not allowed (host only)."
    end

    local id   = tonumber(farmlandIdStr)
    local mult = tonumber(multiplierStr)

    if id == nil or mult == nil then
        return "Usage: fpmSetFarmlandPriceModifier <farmlandId> <multiplier>"
    end
    if mult <= 0 then
        return "Multiplier must be > 0"
    end

    return self:applyModifier(id, mult)
end

function FarmlandPriceModifier:consoleGetFarmlandPrice(farmlandIdStr)
    local id = tonumber(farmlandIdStr or "")
    if id == nil then
        return "Usage: fpmGetFarmlandPrice <farmlandId>"
    end

    local fm = g_farmlandManager
    if fm == nil or not fm:getIsValidFarmlandId(id) then
        return string.format("Invalid farmlandId: %s", tostring(id))
    end

    local farmland = fm:getFarmlandById(id)
    local area     = farmland and farmland.areaInHa or 0
    local pph      = fm:getPricePerHa()
    local factor   = farmland.priceFactor or 1
    local fixed    = (farmland.fixedPrice ~= nil) and string.format("YES (%d €)", farmland.fixedPrice) or "NO"

    if farmland.updatePrice ~= nil then
        farmland:updatePrice()
    end

    local price = farmland.price or 0

    return string.format(
        "Farmland %d: price=%d €, area=%.2f ha, pricePerHa=%d €/ha, factor=%.3f, fixedPrice=%s",
        id, math.floor(price + 0.5), area, math.floor(pph + 0.5), factor, fixed
    )
end

function FarmlandPriceModifier:consoleResetFarmlandPriceModifier(target)
    if not g_currentMission:getIsServer() then
        return "Command not allowed (host only)."
    end

    local fm = g_farmlandManager
    if fm == nil then
        return "farmlandManager not available"
    end

    if target == "all" then
        for _, farmland in pairs(fm:getFarmlands()) do
            self:resetOne(farmland)
        end
        return "Reset modifiers for all farmlands."
    else
        local id = tonumber(target or "")
        if id == nil or not fm:getIsValidFarmlandId(id) then
            return "Usage: fpmResetFarmlandPriceModifier <farmlandId|all>"
        end
        local farmland = fm:getFarmlandById(id)
        self:resetOne(farmland)
        return string.format("Reset modifier for farmland %d.", id)
    end
end

-- Restore original values for a single farmland
function FarmlandPriceModifier:resetOne(farmland)
    local id = farmland.id

    if self.originalFixedPrice[id] ~= nil then
        farmland.fixedPrice = self.originalFixedPrice[id]
    end

    if self.originalPriceFactor[id] ~= nil then
        farmland.priceFactor = self.originalPriceFactor[id]
    end

    if farmland.updatePrice ~= nil then
        farmland:updatePrice()
    end
end

function FarmlandPriceModifier:consoleHelpFarmlandPrice()
    return table.concat({
        "Farmland Price Modifier — commands:",
        "  fpmSetFarmlandPriceModifier <farmlandId> <multiplier>",
        "      Sets a price multiplier for the specified farmland.",
        "  fpmGetFarmlandPrice <farmlandId>",
        "      Shows current price and parameters for the farmland.",
        "  fpmResetFarmlandPriceModifier <farmlandId|all>",
        "      Resets modifier for a single farmland or all farmlands.",
        "  fpmFarmlandPriceHelp",
        "      Displays this help.",
    }, "\n")
end

-- Register as a mod event listener
addModEventListener(FarmlandPriceModifier)
