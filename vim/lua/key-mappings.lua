local nnoremap = require 'utils'.nnoremap
local vnoremap = require 'utils'.vnoremap

nnoremap("<SPACE>", "<Nop>")
vim.g.mapleader = ' '

-- easier navigation between windows
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")

-- WINDOWS
--   creation
nnoremap("<leader>wv", ":vsplit<CR>")
nnoremap("<leader>ws", ":split<CR>")
--    closing
nnoremap("<leader>wd", ":q<CR>")
nnoremap("<leader>wD", ":on<CR>")
--     resizing
nnoremap("<C-Up>", ":resize -3<CR>")
nnoremap("<C-Down>", ":resize +3<CR>")
nnoremap("<C-Left>", ":resize -3<CR>")
nnoremap("<C-Right>", ":resize +3<CR>")
--   navigation between windows
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")

-- BUFFERS
--   switching
nnoremap("<leader>bn", ":bn<CR>")
nnoremap("<leader>bp", ":bp<CR>")
--   closing
nnoremap("<leader>bd", ":bd<CR>")
nnoremap("<leader>bD", ":%bd\\|e#\\|bd#\\|'\"<CR>")
--    new buffer
nnoremap("<leader>bs", ":enew<CR>")


-- FILE ACTIONS
--    saving
nnoremap("<leader>fs", ":w<CR>")
nnoremap("<leader>fS", ":wa<CR>")
--   vimrc
nnoremap("<leader>fe", ":split $DOTFILES/vim/vimrc<CR>")
nnoremap("<leader>fE", ":source $DOTFILES/vim/vimrc<CR>")

-- OTHERS
--   keep selection after changing idention level
vnoremap(">", ">gv")
vnoremap("<", "<gv")

--    better esc
nnoremap("<C-c>", ":nohl<CR><esc>")
nnoremap("<esc>", ":nohl<CR><esc>")

-- Y should behave like D, C
nnoremap("Y", "y$")
