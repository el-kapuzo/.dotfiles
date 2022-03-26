vim.cmd("packadd! gitsigns.nvim")

require('gitsigns').setup{
    signs = {
        add = { hl = "GitSignsAdd", text = '▌', numhl="GitSignsAddNr", linehl="GitSignesAddLne"},
        change = { hl = "GitSignsChange", text = '▌'}
    }
}

vim.api.nvim_set_keymap('n', '<leader>gc', ':G commit<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gp', ':G push<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gl', ':G pull<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gf', ':G fetch<CR>', {silent=true,noremap=true})
