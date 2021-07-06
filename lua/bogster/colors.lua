local util = require("bogster.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("bogster.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    base0 = "#161c23",
    base1 = "#232d38",
    base2 = "#313f4e",
    base3 = "#415367",
    base4 = "#536984",
    base5 = "#627d9d",
    base6 = "#9ea4c2",
    base7 = "#b6b6c9",
    base8 = "#cbc7d0",
    fg0 = "#c6b8ad",
    fg1 = "#e5ded6",
    red = "#d32c5d",
    light_red = "#dc597f",
    orange = "#dc7759",
    yellow = "#dcb659",
    green = "#5dd32c",
    light_green = "#7fdc59",
    blue = "#59c0dc",
    light_blue = "#59dcd8",
    purple = "#b759dc",
    pink = "#dc59c0",
    teal = "#2cd3a4",
    light_teal = "#59dcb7",
    git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
    gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
    none = "NONE",
  }

  if config.style == "night" or config.style == "day" or vim.o.background == "light" then
    colors.bg = "#1a1b26"
  else
    colors.bg = colors.base0
    colors.fg = colors.fg1
    colors.comment = colors.base5
  end
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green, 0.15),
    delete = util.darken(colors.red, 0.15),
    change = util.darken(colors.orange, 0.15),
    text = colors.fg0,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.base4
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.base2
  colors.border = colors.base2

  -- Popups and statusline always get a dark background
  colors.bg_popup = util.darken(colors.base0, 0.15)
  colors.bg_statusline = util.darken(colors.base0, 0.15)

  -- Sidebar and Floats are configurable
  -- colors.bg_sidebar = config.darkSidebar and util.darken(colors.base0, 0.15) or colors.bg
  -- colors.bg_float = config.darkFloat and util.darken(colors.base0, 0.15) or colors.bg
  colors.bg_sidebar = util.darken(colors.bg, 0.85)
  colors.bg_float = util.darken(colors.bg, 0.85)

  -- colors.bg_visual = util.lighten(colors.bg, 0.95)
  colors.bg_visual = colors.base1
  colors.bg_search = util.lighten(colors.bg, 0.7)
  colors.bg_highlight = util.lighten(colors.bg, 0.7)
  colors.fg_sidebar = colors.fg0

  colors.error = util.darken(colors.red, 0.8)
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.teal

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M
