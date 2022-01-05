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
    let mode_map = {
      \ 'n': 'NORMAL',
      \ 'i': 'INSERT',
      \ 'R': 'REPLACE',
      \ 'v': 'VISUAL',
      \ 'V': 'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT',
      \ 'S': 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'TERMINAL'
      \   }
    return get(mode_map, mode(), '')
endfunction

" set statusline=
" set statusline+=%#StatusLineNormal#%{(g:currentmode[mode()]=='n')?'\ \ normal\ ':''}
" set statusline+=%#StatusLineInsert#%{(g:currentmode[mode()]=='i')?'\ \ insert\ ':''}
" set statusline+=%#StatusLine#%{(g:currentmode[mode()]=='i')?'\ \ insert\ ':''}
" set statusline+=%#StatusLineInsert#%{(g:currentmode[mode()]=='i')?'\ \ insert\ ':''}
" set statusline+=%#StatusLineInsert#%{(g:currentmode[mode()]=='i')?'\ \ insert\ ':''}
" set statusline+=%(\ %{Mode()}\ %)
" set statusline+=%#StatusLineLeft#
" set statusline+=%(\ %{MyBranch()}\ %)
" set statusline+=%#StatusLineMiddle#
" set statusline+=%(\ %t\ %)
" set statusline+=\│
" set statusline+=%(\ %m\ %)
" set statusline+=%=
" set statusline+=%(\ %{&fileformat}\ %)
" set statusline+=\│
" set statusline+=%(\ %{&fileencoding?&fenc:&enc}\ %)
" set statusline+=\│
" set statusline+=%(\ %y\ %)
" set statusline+=%#StatusLineRight#
" set statusline+=%(\ %3p%%\ %)
" set statusline+=%#StatusLineFarRight#
" set statusline+=%(\ %3l:%-2c\ %)

