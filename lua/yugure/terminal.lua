local M = {}

function M.apply(p)
  vim.g.terminal_color_0 = p.overlay
  vim.g.terminal_color_1 = p.love
  vim.g.terminal_color_2 = p.teal
  vim.g.terminal_color_3 = p.gold
  vim.g.terminal_color_4 = p.foam
  vim.g.terminal_color_5 = p.iris
  vim.g.terminal_color_6 = p.teal
  vim.g.terminal_color_7 = p.text
  vim.g.terminal_color_8 = p.muted
  vim.g.terminal_color_9 = p.rose
  vim.g.terminal_color_10 = p.teal
  vim.g.terminal_color_11 = p.gold
  vim.g.terminal_color_12 = p.foam
  vim.g.terminal_color_13 = p.iris
  vim.g.terminal_color_14 = p.foam
  vim.g.terminal_color_15 = p.iron
end

return M
