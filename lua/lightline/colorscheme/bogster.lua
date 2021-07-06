local config = require("bogster.config")
local colors = require("bogster.colors").setup(config)
local util = require("bogster.util")

local bogster = {}

bogster.normal = {
  left = {{ colors.black, colors.blue }, { colors.blue, colors.bg }},
  middle = {{ colors.blue, colors.fg0 }},
  right = {{ colors.fg_sidebar, colors.bg_statusline }, { colors.blue, colors.bg }},
  error = {{ colors.black, colors.error }},
  warning = {{ colors.black, colors.warning }},
}

bogster.insert = {
  left = {{ colors.black, colors.green }, { colors.blue, colors.bg }},
}

bogster.visual = {
  left = {{ colors.black, colors.pink }, { colors.blue, colors.bg }},
}

bogster.replace = {
  left = {{ colors.black, colors.red }, { colors.blue, colors.bg }},
}

bogster.inactive = {
  left = {{ colors.blue, colors.bg_statusline }, {colors.base5, colors.bg }},
  middle = {{ colors.fg0, colors.bg_statusline }},
  right = {{ colors.fg0, colors.bg_statusline }, {colors.base5, colors.bg }},
}

bogster.tabline = {
  left = {{ colors.base6, colors.bg_highlight }, {colors.base5, colors.bg }},
  middle = {{ colors.fg0, colors.bg_statusline }},
  right = {{ colors.fg0, colors.bg_statusline }, {colors.base5, colors.bg }},
  tabsel = {{ colors.blue, colors.fg0 }, { colors.base5, colors.bg }},
}

if vim.o.background == "light" then
  for _, mode in pairs(bogster) do
    for _, section in pairs(mode) do
      for _, subsection in pairs(section) do
        subsection[1] = util.getColor(subsection[1])
        subsection[2] = util.getColor(subsection[2])
      end
    end
  end
end

return bogster
