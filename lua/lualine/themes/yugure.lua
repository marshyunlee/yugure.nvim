local p = require("yugure.palette")

local function mode(accent)
  return {
    a = { fg = p.base, bg = accent, gui = "bold" },
    b = { fg = p.iron, bg = p.med },
    c = { fg = p.iron, bg = p.overlay },
  }
end

return {
  normal = mode(p.foam),
  insert = mode(p.teal),
  visual = mode(p.iris),
  replace = mode(p.love),
  command = mode(p.gold),
  terminal = mode(p.rose),
  inactive = {
    a = { fg = p.muted, bg = p.surface },
    b = { fg = p.muted, bg = p.surface },
    c = { fg = p.muted, bg = p.surface },
  },
}
