-- Run: nvim --headless -u NONE --cmd "set rtp+=." -l tests/smoke.lua
local failures = {}
local function check(ok, message)
  if not ok then
    failures[#failures + 1] = message
  end
end

vim.cmd.colorscheme("yugure")
check(vim.g.colors_name == "yugure", "colors_name is " .. tostring(vim.g.colors_name))
check(vim.o.background == "dark", "background is " .. vim.o.background)
check(vim.o.termguicolors, "termguicolors is off")
check(vim.g.terminal_color_0 ~= nil and vim.g.terminal_color_15 ~= nil, "terminal colors not set")

local groups = require("yugure").groups()
local count = 0
for name, spec in pairs(groups) do
  count = count + 1
  if spec.link then
    check(groups[spec.link] ~= nil, name .. " links to undefined group " .. spec.link)
  end
  for _, key in ipairs({ "fg", "bg", "sp" }) do
    local value = spec[key]
    if value ~= nil then
      check(value == "NONE" or value:match("^#%x%x%x%x%x%x$"), name .. "." .. key .. " is not a hex color: " .. tostring(value))
    end
  end
end
check(count > 500, "only " .. count .. " groups defined")

local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
check(normal.fg ~= nil and normal.bg ~= nil, "Normal has no colors")

-- Options take effect.
require("yugure").setup({ transparent = true, italics = false, overrides = { Comment = { fg = "#FFFFFF" } } })
vim.cmd.colorscheme("yugure")
check(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == nil, "transparent did not clear the Normal background")
check(not vim.api.nvim_get_hl(0, { name = "Comment" }).italic, "italics = false left Comment italic")
check(vim.api.nvim_get_hl(0, { name = "Comment" }).fg == 0xFFFFFF, "override did not apply")

local lualine = require("lualine.themes.yugure")
check(lualine.normal and lualine.inactive, "lualine theme incomplete")

if #failures > 0 then
  io.stderr:write("FAIL\n" .. table.concat(failures, "\n") .. "\n")
  os.exit(1)
end
print(string.format("ok: %d highlight groups", count))
