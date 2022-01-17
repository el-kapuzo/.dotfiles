" ------ LEADER KEYS --------------
nnoremap <SPACE> <Nop>
let mapleader=" "

" ---- NORMAL MODE --------------------------------
" -------------------------------------------------
" ---- let Y behave like D, C
nnoremap Y y$

" ---- easier navigation between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ----- easier creation of splits
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ws :split<CR>

" ----- switching between buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" ----- closing buffers
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bD :%bd\|e#\|bd#\|'"<CR>

" ----- create new buffer
nnoremap <leader>bs :enew<CR>

" -----  closing windows
nnoremap <leader>wd :q<CR>
nnoremap <leader>wD :on<CR>

" ----- resizing windows
nnoremap <silent> <C-Up> :resize -2<CR>
nnoremap <silent> <C-Down> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" ----- saving
nnoremap <leader>fs :w<CR>
nnoremap <leader>fS :wa<CR>

" ---- handling settings
nnoremap <leader>fe :split $DOTFILES/vim/vimrc<CR>
nnoremap <leader>fE :source $DOTFILES/vim/vimrc<CR>

" ---- enter ntree
" nnoremap <leader>ft :Vex<CR>

" ----- alternative for esc
nnoremap <silent> <C-c> :nohl<CR><esc>

" ---- VISUAL MODE ----------------------------------
" ---------------------------------------------------
" ---- keep visual selection when changing indention
vnoremap > >gv
vnoremap < <gv
