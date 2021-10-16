" ----- GLOBAL INDENTION ----------------------
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start

" ---- FASTER UPDATE TIMES
set updatetime=300

" --- SHOW WHITESPACES ------------------
set list
set listchars=tab:▷┅
set listchars+=space:·
set listchars+=trail:•
set listchars+=extends:»
set listchars+=precedes:«

" ----- FORMATING -----------------------
" remove comment leader when joinig lines
" better formatting for ordered lists
" do not continue comment when hitting o/O in normal mode
" do not continue comment when hitting o/O in normal mode
" do not continue comment when hitting enter in insert mode
set formatoptions=jncql

" ---- SEARCHING ------------------------
"set hlsearch
set showmatch
set ignorecase
set smartcase

" ---- LINE NUMBERS -----------------------------------
set number
set relativenumber

" ------ TABS ----------------------------------
set showtabline=0

" ---- SPLITS ----------------------------------------
set splitbelow
set splitright

" ----- WRAPPING LINES ------------------------------
set linebreak
set textwidth=0
set wrapmargin=0
let &showbreak='↳ '
set whichwrap=b,h,l,s,<,>,[,],~

" ----- JOINING LINES -------------------------------
set nojoinspaces

" ----- SCROLLING -----------------------------------
set scrolloff=3
set sidescroll=0
set sidescrolloff=3

" ----- FOLDING ------------------------------------
set foldmethod=indent
set foldlevelstart=99

" ---- OTHER SETTINGS --------------------------------
set hidden
set autowrite
set encoding=utf-8
set ruler
set cursorline
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" ---- STAUTS LINE ---------------------------------
set laststatus=2
set noshowmode

" ----- WILDMENU ------------------------------------
set wildmenu
set wildmode=longest,list,full
set iskeyword+=-

" ------ MODELINE ---------------------------------
 set nomodeline

" ----- WILDIGNORE ---------------------------------
set wildignore+=*.py[co]

" ----- HIGHLIGHT YANK ------------------------
au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=200}

" ----- BACKUP FILES ------------------------------
set nobackup

" ----- SWAP FILES ------------------------------
set noswapfile

" ----- UNDO FILES ------------------------------
set noundofile
