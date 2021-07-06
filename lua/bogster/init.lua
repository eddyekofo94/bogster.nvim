local util = require("bogster.util")
local theme = require("bogster.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
