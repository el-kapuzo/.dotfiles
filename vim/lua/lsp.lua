vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! plenary.nvim")
vim.cmd("packadd! null-ls.nvim")


local nvim_lsp = require'lspconfig'
local null_ls = require'null-ls'
local flake8_executable = vim.g.py_binary_path .. '/flake8'
local black_executable = vim.g.py_binary_path .. '/black'
local python_executable = vim.g.py_binary_path .. '/python'

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.flake8.with({
            command =  flake8_executable,
            extra_args=  { '--max-line-lengt', '88' }
        }),
        null_ls.builtins.formatting.black.with({
            command = black_executable
        }),
        null_ls.builtins.formatting.json_tool.with({
            command = python_executable
        }),
    }
})

-- nvim_lsp["null-ls"].setup({
--     -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- })

nvim_lsp.jedi_language_server.setup{
    cmd = { vim.g.py_binary_path .. "/jedi-language-server" },
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

nvim_lsp.rust_analyzer.setup{
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<leader>rf', '<cmd>lua vim.lsp.buf.code_action()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.buf.goto_next()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.buf.goto_next()<CR>', {silent=true,noremap=true})

vim.cmd('sign define LspDiagnosticsSignError text=>> texthl=LspDiagnisticsDefaultError linehl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=-- texthl=LspDiagnisticsDefaultWarning linehl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=-- texthl=LspDiagnisticsDefaultInformation linehl=')
vim.cmd('sign define LspDiagnosticsSignHint text=-- texthl=LspDiagnisticsDefaultHint linehl=')

vim.api.nvim_set_var("diagnostic_show_sign", 1)

vim.cmd("au BufWritePre *.rs,*.py lua vim.lsp.buf.formatting_sync()")
