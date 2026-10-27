local M = {}

M.defaults = {
  -- Keep the terminal's own background instead of painting the editor ground.
  transparent = false,
  -- Italic comments and virtual text.
  italics = true,
  -- Set the 16 terminal colors for :terminal.
  terminal_colors = true,
  -- Highlight overrides: a table of group -> spec, or a function(palette)
  -- returning one. Specs follow nvim_set_hl.
  overrides = {},
}

M.config = vim.deepcopy(M.defaults)

M.modules = {
  "yugure.groups.editor",
  "yugure.groups.syntax",
  "yugure.groups.treesitter",
  "yugure.groups.lsp",
  "yugure.groups.plugins",
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

--- Every highlight group the theme sets, merged in module order.
function M.groups()
  local palette = require("yugure.palette")
  local merged = {}
  for _, name in ipairs(M.modules) do
    for group, spec in pairs(require(name)(palette, M.config)) do
      merged[group] = spec
    end
  end
  local overrides = M.config.overrides
  if type(overrides) == "function" then
    overrides = overrides(palette) or {}
  end
  for group, spec in pairs(overrides) do
    merged[group] = spec
  end
  return merged
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "yugure"
  for group, spec in pairs(M.groups()) do
    vim.api.nvim_set_hl(0, group, spec)
  end
  if M.config.terminal_colors then
    require("yugure.terminal").apply(require("yugure.palette"))
  end
end

return M
