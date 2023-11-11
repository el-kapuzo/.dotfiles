local g = vim.g
local o = vim.opt

-- ----- GLOBAL INDENTION ----------------------
o.smarttab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.backspace = 'indent,eol,start'

-- ---- FASTER UPDATE TIMES
o.updatetime = 300

-- ---- USE LUA FILETYPES ---------------
g.do_filetype_lua = true
g.did_load_fileetypes = true

-- --- SHOW WHITESPACES
o.listchars = {
    tab = '▷·',
    space = '·',
    trail = '•',
    extends = '»',
    precedes = '«'
}
o.list = true

-- ---- SEARCHING ------------------------
o.showmatch = true
o.ignorecase = true
o.smartcase = true


-- ---- LINE NUMBERS -----------------------------------
o.number = true
o.relativenumber = true

-- ------ TABS ----------------------------------
o.showtabline = 0

-- ---- SPLITS ----------------------------------------
o.splitbelow = true
o.splitright = true

-- ----- WRAPPING LINES ------------------------------
o.linebreak = true
o.textwidth = 0
o.wrapmargin = 0
o.showbreak = '↳ '
o.whichwrap = "b,h,l,s,<,>,[,],~"
-- ----- FORMATING -----------------------
-- remove comment leader when joinig lines
-- better formatting for ordered lists
-- do not continue comment when hitting o/O in normal mode
-- do not continue comment when hitting o/O in normal mode
-- do not continue comment when hitting enter in insert mode
o.formatoptions = "jncql"

-- ----- JOINING LINES -------------------------------
o.joinspaces = false

-- ----- SCROLLING -----------------------------------
o.scrolloff = 3
o.sidescroll = 0
o.sidescrolloff = 3

-- ----- FOLDING ------------------------------------
o.foldmethod = 'indent'
o.foldlevelstart = 99

-- ---- OTHER SETTINGS --------------------------------
o.hidden = true
o.autowrite = true
o.encoding = "utf-8"
o.cursorline = true
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess:append('c')


-- ----- WILDMENU ------------------------------------
o.wildmenu = true
o.wildmode = "longest,list,full"
o.iskeyword:append('-')

-- ------ MODELINE ---------------------------------
o.modeline = true

-- ----- WILDIGNORE ---------------------------------
o.wildignore:append("*.py[co]")

-- ----- HIGHLIGHT YANK ------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank({ higroup = "Visual", timeout = 200 }) end,
    pattern = "*",
})

-- ----- BACKUP FILES ------------------------------
o.backup = false

-- ----- SWAP FILES ------------------------------
o.swapfile = false

-- ----- UNDO FILES ------------------------------
o.undofile = false
