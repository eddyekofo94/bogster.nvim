local config = require("tokyonight.config")
local colors = require("tokyonight.colors").setup(config)
local util = require("tokyonight.util")

local tokyonight = {}

tokyonight.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

tokyonight.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.green },
}

tokyonight.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.yellow },
}

tokyonight.visual = {
  a = { bg = colors.pink, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.pink },
}

tokyonight.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg0, fg = colors.red },
}

tokyonight.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg0, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg0 },
}

if vim.o.background == "light" then
  for _, mode in pairs(tokyonight) do
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

if vim.g.tokyonight_lualine_bold then
  for _, mode in pairs(tokyonight) do
    mode.a.gui = "bold"
  end
end

return tokyonight
