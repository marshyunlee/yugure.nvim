# yugure.nvim

A quiet twilight colorscheme for Neovim.

Yūgure (夕暮れ) is Japanese for dusk. The theme sits on a neutral near-black
ground with softened body text and six muted accents that each do one job.
Accents appear as text, never as solid fills, so the editor reads dark without
being flat and colourful without being loud.

The palette and its role mapping follow the [Yūgure theme for
Inkdrop](https://github.com/stoykotolev/inkdrop-yugure) by stoykotolev, so notes
and code look like they belong together. This Neovim package is an independent
implementation of that palette.

## Requirements

Neovim 0.9 or newer with `termguicolors`.

## Install

lazy.nvim:

```lua
{
  "marshyunlee/yugure.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("yugure")
  end,
}
```

vim.pack (Neovim 0.12):

```lua
vim.pack.add({ "https://github.com/marshyunlee/yugure.nvim" })
vim.cmd.colorscheme("yugure")
```

## Options

Call `setup` before `colorscheme` only when you want to change a default.

```lua
require("yugure").setup({
  transparent = false, -- keep the terminal's own background
  italics = true, -- italic comments, keywords, built-in constants and virtual text
  terminal_colors = true, -- set the 16 :terminal colors
  overrides = {}, -- table of group -> nvim_set_hl spec, or function(palette)
})
```

Overrides take the palette, so a tweak can reuse its names:

```lua
overrides = function(p)
  return { CursorLine = { bg = p.surface }, ["@keyword"] = { fg = p.rose, bold = true } }
end
```

lualine:

```lua
require("lualine").setup({ options = { theme = "yugure" } })
```

## Palette

Text and accent colors sit 0.04 higher in OKLCH lightness than the Inkdrop
table, for more contrast; hues, chroma and the grounds are unchanged.

| name    | hex       | role                                              |
| ------- | --------- | ------------------------------------------------- |
| base    | `#141518` | editor background                                 |
| surface | `#18191D` | floats, popups, inactive statusline               |
| low     | `#1B1C21` | cursor line                                       |
| overlay | `#1F2026` | active statusline, terminal black                 |
| med     | `#2A2C34` | visual selection, menu selection                  |
| high    | `#383A43` | borders, matched parens                           |
| text    | `#A9B0BF` | body text                                         |
| iron    | `#9BA3B3` | secondary text                                    |
| subtle  | `#8B93A3` | interface text, punctuation                       |
| muted   | `#697083` | comments, quotes, placeholders                    |
| faint   | `#505563` | line numbers, whitespace markers                  |
| rose    | `#C6919C` | keywords, tags, list bullets, table heads, h1     |
| gold    | `#CCAC83` | strings, warnings, search, cursor line number, h2 |
| foam    | `#86B0C2` | functions, links, info, primary buttons, h3       |
| teal    | `#87ACAB` | types, inline code, additions, hints, h4          |
| iris    | `#A69AC6` | numbers, attributes, metadata, h5                 |
| love    | `#C7777C` | errors and deletions, nothing else                |

## Supported plugins

Treesitter and semantic tokens, LSP diagnostics, telescope, blink.cmp,
nvim-cmp, gitsigns, diffview, mini.nvim (statusline, pick, files, diff, clue,
notify, jump, surround, hipatterns, indentscope, cursorword, trailspace), oil,
neo-tree, nvim-tree, which-key, indent-blankline, lazy, mason, noice,
nvim-notify, snacks (notifier, dashboard, picker, indent), trouble, flash,
treesitter-context, todo-comments, render-markdown, fidget, nvim-dap and
dap-ui, neotest, navic, lualine.

## Development

```sh
nvim --headless -u NONE --cmd "set rtp+=." -l tests/smoke.lua
```

The smoke test loads the colorscheme, checks every link target exists and every
color is a hex value, and exercises the options.

## License

MIT. The palette is adapted from the Inkdrop theme's published color table.
