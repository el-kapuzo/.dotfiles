packadd! nvim-lspconfig

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

nvim_lsp.jedi_language_server.setup{
    cmd = { vim.g.py_binary_path .. "/jedi-language-server" },
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

nvim_lsp.rust_analyzer.setup{
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

EOF
