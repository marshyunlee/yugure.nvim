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
  text = "#9DA4B2", -- body text
  iron = "#8F97A6", -- secondary text
  subtle = "#7F8797", -- interface text
  muted = "#5E6577", -- comments, quotes, placeholders
  faint = "#454A58", -- line numbers, whitespace markers

  -- Accents. One role each; errors use love and nothing else does.
  rose = "#B98590", -- keywords, tags, bullets, table heads, h1
  gold = "#BFA077", -- strings, warnings, highlights, h2
  foam = "#7AA3B5", -- functions, links, info, primary actions, h3
  teal = "#7BA09F", -- types, additions, hints, success, h4
  iris = "#9A8EB9", -- numbers, attributes, metadata, h5
  love = "#BA6B70", -- errors and deletions

  none = "NONE",
}
