-- Yūgure (夕暮れ) palette: a neutral near-black ground, softened text and six
-- muted accents that each own one job. Values are literal; nothing is derived
-- at runtime except the few blends in util.lua.
return {
  -- Ground, dark to light.
  base = "#141518", -- editor background
  surface = "#18191D", -- floats, popups, inactive statusline
  low = "#1B1C21", -- cursor line, scrollbar track
  overlay = "#1F2026", -- active statusline, terminal black
  med = "#2A2C34", -- visual selection, menu selection
  high = "#383A43", -- borders, matched parens, faint fills

  -- Text, bright to dim.
  text = "#A9B0BF", -- body text
  iron = "#9BA3B3", -- secondary text
  subtle = "#8B93A3", -- interface text
  muted = "#697083", -- comments, quotes, placeholders
  faint = "#505563", -- line numbers, whitespace markers

  -- Accents. One role each; errors use love and nothing else does.
  rose = "#C6919C", -- keywords, tags, bullets, table heads, h1
  gold = "#CCAC83", -- strings, warnings, highlights, h2
  foam = "#86B0C2", -- functions, links, info, primary actions, h3
  teal = "#87ACAB", -- types, additions, hints, success, h4
  iris = "#A69AC6", -- numbers, attributes, metadata, h5
  love = "#C7777C", -- errors and deletions

  none = "NONE",
}
