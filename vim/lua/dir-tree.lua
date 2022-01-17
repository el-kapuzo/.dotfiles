vim.cmd("packadd! nvim-tree")

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_icons = {
     default= "",
     symlink= "",
     git= {
        unstaged= "✗",
        staged= "✓",
        unmerged= "",
        renamed= "➜",
        untracked= "★",
        deleted= "D",
        ignored= "I"
    },
    folder= {
        arrow_open= "▼",
        arrow_closed= "▶",
        default= "▶",
        open= "▼",
        empty= "▶",
        empty_open= "▼",
        symlink= "~",
        symlink_open= "~"
   }
 }

vim.api.nvim_set_keymap('n', '<leader>ft', ':NvimTreeToggle<CR>', {silent=true,noremap=true})

require"nvim-tree".setup{}
