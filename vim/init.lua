if vim.loader then
    vim.loader.enable()
end

local dot_file_path = vim.fn.expand('<sfile>:p:h:h')

local vim_config_path = dot_file_path .. "/vim"

vim.opt.packpath:append(vim_config_path)

vim.opt.rtp:prepend(vim_config_path)
vim.opt.rtp:append(vim_config_path .. "/after")


local win_32 = vim.fn.has("win32") == 1
local win_64 = vim.fn.has("win64") == 1

if win_32 or win_64 then
    vim.opt.shell = "winpyt"
    vim.g.py_binary_path = dot_file_path .. "/.venv/Script"
    vim.g.python3_host_prog = vim.g.py_binary_path .. "/python.exe"
else
    vim.g.py_binary_path = dot_file_path .. "/.venv/bin"
    vim.g.python3_host_prog = vim.g.py_binary_path .. "/python"
end

-- ====== Load config Files =======

require 'key-mappings'
require 'colorscheme-config'
require 'autopairs'
require 'dir-tree'
require 'colorizer-config'
require 'completion'
require 'git'
require 'lsp'
require 'rooter'
require 'snippets'
require 'statusline'
require 'plugins'
require 'huble'
require 'settings'
