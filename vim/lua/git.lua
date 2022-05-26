vim.cmd("packadd! gitsigns.nvim")

require('gitsigns').setup{
    signs = {
        add = { hl = "GitSignsAdd", text = '▐█', numhl="GitSignsAddNr", linehl="GitSignesAddLne"},
        change = { hl = "GitSignsChange", text = '▐█'}
    }
}

vim.cmd("hi link GitSignsAdd DiffAdd")
vim.cmd("hi link GitSignsChange DiffChange")
vim.cmd("hi link GitSignsDelete DiffDelete")

vim.keymap.set('n', '<leader>gc', ':G commit<CR>', {silent=true,noremap=true})
vim.keymap.set('n', '<leader>gp', ':G push<CR>', {silent=true,noremap=true})
vim.keymap.set('n', '<leader>gl', ':G pull<CR>', {silent=true,noremap=true})
vim.keymap.set('n', '<leader>gs', ':G<CR>', {silent=true,noremap=true})
vim.keymap.set('n', '<leader>gf', ':G fetch<CR>', {silent=true,noremap=true})
