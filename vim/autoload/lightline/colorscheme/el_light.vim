let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}, 'command': {}}
let s:p.command.middle = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.normal.middle = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.insert.middle = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.inactive.middle = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.visual.middle = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.replace.middle = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.tabline.middle = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.inactive.left = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.inactive.right = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.tabline.left = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.tabline.right = [ [ '#121212', '#ebdbb2', 233, 223 ] ]
let s:p.replace.left = [ [ '#fffff0', '#ffb090', 231, 216, 'bold' ], [ '#121212', '#a89984', 233, 138 ] ]
let s:p.replace.right = [ [ '#fffff0', '#ffb090', 231, 216, 'bold' ], [ '#121212', '#a89984', 233, 138 ] ]
let s:p.normal.left = [ [ '#121212', '#d7e7e9', 233, 254, 'bold' ], [ '#121212', '#a89984', 233, 138 ] ]
let s:p.normal.right = [ [ '#121212', '#d7e7e9', 233, 254, 'bold' ], [ '#121212', '#a89984', 233, 138 ] ]
let s:p.normal.error = [ [ '#121212', '#af0000', 233, 124 ] ]
let s:p.command.left = [ [ '#121212', '#dfa000', 233, 178, 'bold' ], [ '#121212', '#bdae93', 233, 144 ] ]
let s:p.command.right = [ [ '#121212', '#dfa000', 233, 178, 'bold' ], [ '#121212', '#bdae93', 233, 144 ] ]
let s:p.insert.left = [ [ '#121212', '#d1d187', 233, 186, 'bold' ], [ '#121212', '#d5c4a1', 233, 187 ] ]
let s:p.insert.right = [ [ '#121212', '#d1d187', 233, 186, 'bold' ], [ '#121212', '#d5c4a1', 233, 187 ] ]
let s:p.visual.left = [ [ '#121212', '#00875f', 233, 29, 'bold' ], [ '#121212', '#d5c4a1', 233, 187 ] ]
let s:p.visual.right = [ [ '#121212', '#00875f', 233, 29, 'bold' ], [ '#121212', '#d5c4a1', 233, 187 ] ]
let s:p.normal.warning = [ [ '#121212', '#f57d26', 233, 208 ] ]

let g:lightline#colorscheme#el_light#palette = s:p
