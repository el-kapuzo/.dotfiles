local packadd = require 'utils'.packadd
local nnoremap = require 'utils'.nnoremap

packadd("plenary.nvim")
packadd("telescope.nvim")

local builtin_pickers = require 'telescope.builtin'

nnoremap('<leader>ff', builtin_pickers.find_files)
nnoremap('<leader>bb', builtin_pickers.buffers,)
nnoremap('<leader><leader><Space>', builtin_pickers.commands)
nnoremap('<leader>oc', builtin_pickers.colorscheme)
