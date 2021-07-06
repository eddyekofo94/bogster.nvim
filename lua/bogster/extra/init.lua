package.path = "./lua/?/init.lua;./lua/?.lua"

local config = require("bogster.config")

local function write(str, fileName)
  print("[write] extra/" .. fileName)
  local file = io.open("extras/" .. fileName, "w")
  file:write(str)
  file:close()
end

-- map of plugin name to plugin extension
local extras = { kitty = "conf", fish = "fish", alacritty = "yml", wezterm = "toml", tmux = "tmux" }
local styles = { "storm", "night", "day" }

for extra, ext in pairs(extras) do
  local plugin = require("bogster.extra." .. extra)
  for _, style in pairs(styles) do
    config.style = style
    config = config or require("bogster.config")
    config.transform_colors = true
    local colors = require("bogster.colors").setup(config)
    write(plugin.generate(colors), extra .. "_bogster_" .. style .. "." .. ext)
  end
end
