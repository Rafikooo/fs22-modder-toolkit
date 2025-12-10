FpmUtils = FpmUtils or {}

local function _tag(tag) return "[FPM][" .. (tag or "UTILS") .. "] " end

function FpmUtils.die(tag, msg)
  error(_tag(tag) .. tostring(msg), 2)
end

function FpmUtils.assertf(tag, cond, msg)
  if not cond then FpmUtils.die(tag, msg) end
end

function FpmUtils.join(...)
  local n = select("#", ...)
  if n == 0 then return "" end
  if n == 1 then return tostring(select(1, ...)) end
  local t = {}
  for i=1, n do t[i] = tostring(select(i, ...)) end
  return table.concat(t, " ")
end

function FpmUtils.round(x)
  FpmUtils.assertf("UTILS", type(x)=="number", "round(): arg not number")
  return math.floor(x + 0.5)
end

local function _iDiv(a, b)
  return math.floor(a / b)
end

function FpmUtils.median(nums)
  FpmUtils.assertf("UTILS", type(nums)=="table", "median(): needs table")
  table.sort(nums)
  local n = #nums
  FpmUtils.assertf("UTILS", n>0, "median(): empty")
  if (n % 2) == 1 then
    return nums[_iDiv(n + 1, 2)]
  end
  local r = _iDiv(n, 2) + 1
  local l = r - 1
  return 0.5 * (nums[l] + nums[r])
end

print("[FPM][INFO] Utils loaded")
