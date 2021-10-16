packadd! ale

let g:ale_linters = {
            \    'python': ['flake8'],
            \    'rust': [],
            \}

let g:ale_fixers = {
    \ '*': ['trim_whitespace'],
    \ 'python': ['black'],
    \ 'rust': [],
\}
let g:ale_fix_on_save = 1

let g:ale_python_black_executable = g:py_binary_path . '/black'
let g:ale_python_black_use_global = 1

let g:ale_python_flake8_executable = g:py_binary_path . '/flake8'
let g:ale_python_flake8_use_global = 1
