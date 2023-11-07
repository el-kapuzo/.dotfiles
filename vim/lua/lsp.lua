local packadd = require 'utils'.packadd
packadd("nvim-lspconfig")
packadd("plenary.nvim")
packadd("null-ls.nvim")
packadd("cmp-nvim-lsp")


local nvim_lsp = require 'lspconfig'
local null_ls = require 'null-ls'
local python_executable = vim.g.py_binary_path .. '/python'

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.json_tool.with({
            command = python_executable
        }),
    }
})

nvim_lsp.jedi_language_server.setup {
    cmd = { vim.g.py_binary_path .. "/jedi-language-server" },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

nvim_lsp.ruff_lsp.setup {
    cmd = { vim.g.py_binary_path .. "/ruff-lsp" },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

nvim_lsp.rust_analyzer.setup {
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

nvim_lsp.texlab.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

nvim_lsp.lua_ls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, noremap = true })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true, noremap = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, noremap = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action, { silent = true, noremap = true })
vim.keymap.set('v', '<leader>ra', vim.lsp.buf.code_action, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>rf', vim.lsp.buf.format, { silent = true, noremap = true })
-- vim.keymap.set('n', '<C-n>', vim.lsp.buf.goto_next, {silent=true,noremap=true})
-- vim.keymap.set('n', '<C-p>', vim.lsp.buf.goto_next, {silent=true,noremap=true})

vim.cmd('sign define LspDiagnosticsSignError text=>> texthl=LspDiagnisticsDefaultError linehl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=-- texthl=LspDiagnisticsDefaultWarning linehl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=-- texthl=LspDiagnisticsDefaultInformation linehl=')
vim.cmd('sign define LspDiagnosticsSignHint text=-- texthl=LspDiagnisticsDefaultHint linehl=')

vim.api.nvim_set_var("diagnostic_show_sign", 1)

vim.api.nvim_create_autocmd("BufWritePre",
    { pattern = { "*.rs", "*.py", "*.lua" },
        callback = function(args)
            vim.lsp.buf.format({ async = false })
        end })
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end
})
