local config = require("bogster.config")
local colors = require("bogster.colors").setup(config)
local util = require("bogster.util")

local bogster = {}

bogster.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

bogster.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.green },
}

bogster.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.yellow },
}

bogster.visual = {
  a = { bg = colors.pink, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.pink },
}

bogster.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.red },
}

bogster.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg0, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg0 },
}

if vim.o.background == "light" then
  for _, mode in pairs(bogster) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.getColor(section.bg)
      end
      if section.fg then
        section.fg = util.getColor(section.fg)
      end
    end
  end
end

if vim.g.bogster_lualine_bold then
  for _, mode in pairs(bogster) do
    mode.a.gui = "bold"
  end
end

return bogster
