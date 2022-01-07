vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! plenary.nvim")
vim.cmd("packadd! null-ls.nvim")


vim.cmd("au BufWritePre *.rs,*.py lua vim.lsp.buf.formatting_sync()")

local nvim_lsp = require'lspconfig'
local null_ls = require'null-ls'
local flake8_executable = vim.g.py_binary_path .. '/flake8'
local black_executable = vim.g.py_binary_path .. '/flake8'

null_ls.config({
    sources = {
        null_ls.builtins.diagnostics.flake8.with({
            command =  flake8_executable,
            extra_args=  { '--max-line-lengt', '88' }
        }),
        null_ls.builtins.formatting.black.with({
            command = black_executable
        }),
        null_ls.builtins.formatting.json_tool,
    }
})

nvim_lsp["null-ls"].setup({
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
})

nvim_lsp.jedi_language_server.setup{
    cmd = { vim.g.py_binary_path .. "/jedi-language-server" },
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

nvim_lsp.rust_analyzer.setup{
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

vim.api.nvim_set_keymap('n', 'gd', 'v:lua.lsp.buf.definition()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'gD', 'v:lua.lsp.buf.declaration()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'K', 'v:lua.lsp.buf.hover()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'gr', 'v:lua.lsp.buf.references()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'rr', 'v:lua.lsp.buf.rename()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', 'rf', 'v:lua.lsp.buf.code_action()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<C-n>', 'v:lua.lsp.buf.goto_next()<CR>', {silent=true,noremap=true})
vim.api.nvim_set_keymap('n', '<C-p>', 'v:lua.lsp.buf.goto_next()<CR>', {silent=true,noremap=true})

vim.cmd('sign define LspDiagnosticsSignError text=>> texthl=LspDiagnisticsDefaultError linehl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=-- texthl=LspDiagnisticsDefaultWarning linehl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=-- texthl=LspDiagnisticsDefaultInformation linehl=')
vim.cmd('sign define LspDiagnosticsSignHint text=-- texthl=LspDiagnisticsDefaultHint linehl=')

vim.api.nvim_set_var("diagnostic_show_sign", 1)

