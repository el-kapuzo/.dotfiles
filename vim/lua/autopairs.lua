require'utils'.packadd("nvim-autopairs")

local autopairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')

autopairs.setup{}
autopairs.add_rule(rule("<", ">", "rust"))
