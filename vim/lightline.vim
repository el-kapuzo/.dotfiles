packadd! lightline.vim

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

