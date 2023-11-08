packadd = require 'utils'.packadd
nnoremap = require 'utils'.nnoremap

packadd("plenary.nvim")
packadd("gitsigns.nvim")

require('gitsigns').setup {
    signs = {
        add = { hl = "GitSignsAdd", text = '▍', numhl = "GitSignsAddNr", linehl = "GitSignesAddLne" },
        change = { hl = "GitSignsChange", text = '▍' },
        changedelete = { hl = "GitSignsChange", text = '▍' },
        delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    }
}

vim.cmd("hi link GitSignsAdd DiffAdd")
vim.cmd("hi link GitSignsChange DiffChange")
vim.cmd("hi link GitSignsDelete DiffDelete")

nnoremap('<leader>gc', ':G commit<CR>')
nnoremap('<leader>gp', ':G push<CR>')
nnoremap('<leader>gl', ':G pull<CR>')
nnoremap('<leader>gs', ':G<CR>')
nnoremap('<leader>gf', ':G fetch<CR>')
