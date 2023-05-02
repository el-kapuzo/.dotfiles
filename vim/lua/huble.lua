local packadd = require'utils'.packadd

packadd("plenary.nvim")
packadd("telescope.nvim")

local builtin_pickers = require'telescope.builtin'

vim.keymap.set('n', '<leader>ff', builtin_pickers.find_files, {silent=true, noremap=true})
vim.keymap.set('n', '<leader>bb', builtin_pickers.buffers, {silent=true, noremap=true})
vim.keymap.set('n', '<leader><leader><Space>', builtin_pickers.commands, {silent=true, noremap=true})
vim.keymap.set('n', '<leader>oc', builtin_pickers.colorscheme, {silent=True, noremap=True})

