local M = {}

local function to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

--- Mix `fg` into `bg`; `amount` 0 returns bg, 1 returns fg.
function M.blend(fg, bg, amount)
  local fr, fg_, fb = to_rgb(fg)
  local br, bg_, bb = to_rgb(bg)
  local function channel(f, b)
    return math.floor(b + (f - b) * amount + 0.5)
  end
  return string.format("#%02X%02X%02X", channel(fr, br), channel(fg_, bg_), channel(fb, bb))
end

--- A faint fill of `color` over the editor ground, for diagnostic and diff lines.
function M.tint(color, base, amount)
  return M.blend(color, base, amount or 0.12)
end

return M
