require'utils'.packadd("nvim-tree")

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing=1
vim.g.nvim_tree_icons = {
     default= " ",
     symlink= "~",
     git= {
        unstaged= "✗",
        staged= "✓",
        unmerged= "",
        renamed= "➜",
        untracked= "★",
        deleted= "d",
        ignored= "i"
    },
    folder= {
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
        }
    }
}
