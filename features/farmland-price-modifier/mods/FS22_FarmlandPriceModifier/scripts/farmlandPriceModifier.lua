FPM = FPM or {}

local function _join(...)
  local n = select("#", ...)
  if n == 0 then return "" end
  if n == 1 then return tostring(select(1, ...)) end
  local t = {}
  for i=1,n do t[i] = tostring(select(i, ...)) end
  return table.concat(t, " ")
end

FPM.log = {
  info = function(...) print("[FPM][INFO]",  _join(...)) end,
  warn = function(...) print("[FPM][WARN]",  _join(...)) end,
  err  = function(...) print("[FPM][ERROR]", _join(...)) end,
}

FPM.log.info("Farmland Price Modifier bootstrap ready")
