" ---- VERTICAL SPLITS -----------------------
set fillchars+=vert:│

" ---- COLORS ------
set background=dark
if (has('termguicolors'))
    set termguicolors
endif

" ---- COLORSCHEMES --------------------------
colorscheme el_dark

if !has('nvim')
    packadd! lightline
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
endif
"
