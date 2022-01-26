let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}, 'command': {}}
let s:p.normal.left = [ [ '#fce8c3', '#2c78bf', 224, 31 ], [ '#fce8c3', '#4e4e4e', 224, 239 ] ]
let s:p.normal.right = [ [ '#fce8c3', '#4e4e4e', 224, 239 ], [ '#fce8c3', '#3a3a3a', 224, 237 ] ]
let s:p.command.left = [ [ '#1c1b19', '#fbb829', 234, 214 ], [ '#fce8c3', '#585858', 224, 240 ] ]
let s:p.command.right = [ [ '#fce8c3', '#585858', 224, 240 ], [ '#fce8c3', '#444444', 224, 238 ] ]
let s:p.insert.left = [ [ '#1c1b19', '#fce8c3', 234, 224 ], [ '#1c1b19', '#baa67f', 234, 144 ] ]
let s:p.insert.right = [ [ '#1c1b19', '#baa67f', 234, 144 ], [ '#fce8c3', '#444444', 224, 238 ] ]
let s:p.command.middle = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.normal.middle = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.insert.middle = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.inactive.middle = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.visual.middle = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.replace.middle = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.tabline.middle = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.inactive.left = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.inactive.right = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.tabline.left = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.tabline.right = [ [ '#fce8c3', '#303030', 224, 236 ] ]
let s:p.normal.warning = [ [ '#1c1b19', '#ff5f00', 234, 202 ] ]
let s:p.replace.left = [ [ '#fce8c3', '#f75341', 224, 203 ], [ '#1c1b19', '#918175', 234, 244 ] ]
let s:p.replace.right = [ [ '#1c1b19', '#918175', 234, 244 ], [ '#fce8c3', '#444444', 224, 238 ] ]
let s:p.normal.error = [ [ '#fce8c3', '#ef2f27', 224, 196 ] ]
let s:p.visual.left = [ [ '#1c1b19', '#0aaeb3', 234, 37 ], [ '#fce8c3', '#4e4e4e', 224, 239 ] ]
let s:p.visual.right = [ [ '#fce8c3', '#4e4e4e', 224, 239 ], [ '#fce8c3', '#3a3a3a', 224, 237 ] ]

let g:lightline#colorscheme#el_dark#palette = s:p