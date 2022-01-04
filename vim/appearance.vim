packadd! lightline

" ---- VERTICAL SPLITS -----------------------
set fillchars+=vert:│

" ---- COLORS ------
set background=dark
if (has('termguicolors'))
    set termguicolors
endif

" ---- COLORSCHEMES --------------------------
colorscheme el_dark

let g:lightline = {
    \ 'colorscheme': 'el_dark',
    \ 'active': {
    \   'left': [
    \     [ 'mode', 'paste' ],
    \     [ 'gitbranch'] ,
    \     [ 'filename', 'modified' ]
    \   ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'MyBranch'
    \ },
    \ }

function! MyBranch()
    let branch = fugitive#head()
    return strlen(branch) ? "\ue725" . " " . branch : ''
endfunction

function! Mode()
    let branch = fugitive#head()
    return "MODE"
endfunction

" set statusline=
" set statusline+=%(%{Mode()}%)
" set statusline+=%#StatusLineLeft_0#
" set statusline+=\|
" set statusline+=%(\ %{MyBranch()}\ %)
" set statusline+=%#StatusLineMiddle#
" set statusline+=\|
" set statusline+=%(\ %t\ %)
" set statusline+=\|
" set statusline+=%(\ %m\ %)
" set statusline+=%=
" set statusline+=%(\ %{&fileformat}\ %)
" set statusline+=\|
" set statusline+=%(\ %{&fileencoding?&fenc:&enc}\ %)
" set statusline+=\|
" set statusline+=%(\ %f\ %)
" set statusline+=%#StatusLineRight#
" set statusline+=%(\ %3p%%\ %)
" set statusline+=\|
" set statusline+=%#StatusLineFarRight#
" set statusline+=%(\ %3l:%-2c\ %)

