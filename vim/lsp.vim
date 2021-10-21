packadd! nvim-lspconfig
packadd! plenary.nvim
packadd! null-ls.nvim

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>rr <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>rf <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

execute 'sign define LspDiagnosticsSignError text=>> texthl=LspDiagnisticsDefaultError linehl='
execute 'sign define LspDiagnosticsSignWarning text=-- texthl=LspDiagnisticsDefaultWarning linehl='
execute 'sign define LspDiagnosticsSignInformation text=-- texthl=LspDiagnisticsDefaultInformation linehl='
execute 'sign define LspDiagnosticsSignHint text=-- texthl=LspDiagnisticsDefaultHint linehl='

let g:diagnostic_show_sign = 1

au BufWritePre *.rs,*.py lua vim.lsp.buf.formatting_sync()

lua <<EOF
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

EOF
