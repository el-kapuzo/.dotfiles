vim.cmd("packadd! nvim-cmp")
vim.cmd("packadd! cmp-nvim-lsp")
vim.cmd("packadd! cmp-path")
vim.cmd("packadd! cmp-buffer")
vim.cmd("packadd! cmp-nvim-ultisnips")
vim.cmd("packadd! cmp-nvim-lua")

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = false}),
    },
    sources = cmp.config.sources(
        { name = "nvim_lsp"},
        { name = "ultisnips"},
        { name = "path"},
        { name = "nvim_lua"},
        { name = "buffer"}
    )
})

-- vim.cmd("packadd! nvim-compe")

-- require'compe'.setup {
--     enabled=true;
--     autocomplete=true;
--     min_length=1;
--     preselect='enable';
--     throttle_time=80;
--     source_timeout=200;
--     incomplete_delay=200;
--     max_abbr_width=88;
--     max_kind_width=88;
--     max_menu_width=88;
--     documentation=true;

--     source = {
--         path = true;
--         buffer = true;
--         calc = true;
--         nvim_lsp = true;
--         nvim_lua = true;
--         ultisnips = true;
--     };
-- }

-- vim.api.nvim_set_keymap("i", "<Tab>", "compe#confirm('<Tab>')", {expr = true})

