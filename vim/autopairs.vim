packadd! nvim-autopairs

lua <<EOF
local autopairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')

autopairs.setup{}
autopairs.add_rule(rule("<", ">", "rust"))
EOF
