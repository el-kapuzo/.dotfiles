packadd = require 'utils'.packadd

vim.opt.background = 'light'
vim.opt.fillchars:append("vert:│")
vim.opt.termguicolors = true

packadd('spectrum-nvim')
packadd('carbon-nvim')

vim.cmd('colorscheme carbon')
