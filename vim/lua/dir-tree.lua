require'utils'.packadd("nvim-tree")

vim.api.nvim_set_keymap('n', '<leader>ft', ':NvimTreeToggle<CR>', {silent=true,noremap=true})

require"nvim-tree".setup{
    hijack_cursor = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        }
    },
    view = {
        width = 30,
    },
    renderer = {
        indent_markers = {
            enable = true
        },
        add_trailing = true,
        highlight_git= true,
        highlight_opened_files = "none",
        icons = {
            glyphs = {
                default= " ",
                symlink= "~",
                git={
                    unstaged='', --- "✗",
                    staged= '', --- "✓",
                    unmerged='', --- "",
                    renamed='', --- "➜",
                    untracked='', --- "★",
                    deleted='', --- "d",
                    ignored='', --- "i"
                },
                folder={
                    arrow_open= "▼",
                    arrow_closed= "▶",
                    default= "▶",
                    open= "▼",
                    empty= "▷",
                    empty_open= "▽",
                    symlink= "~",
                    symlink_open= "~"
               }
           }
       }
    },
}
