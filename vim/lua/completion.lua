packadd = require'utils'.packadd

packadd('nvim-cmp')
packadd("cmp-path")
packadd("cmp-buffer")
packadd("cmp-nvim-lua")
packadd("cmp_luasnip")
packadd("LuaSnip")

local cmp = require'cmp'


cmp.setup({
    preselect = nil,
    snippet = {
        function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip"},
        { name = "path"},
        { name = "nvim_lua"},
        { name = "buffer"}
    }),
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({select = true })
    }),
    -- window = {
    --     completion = cmp.config.window.bordered(),
    --     documentation = cmp.config.window.bordered()
    -- },
    formatting = {
        format = function(entry, vim_item) 
            vim_item.kind = ""
            vim_item.menu = ({
                buffer= "[BUF]",
                nvim_lsp = "[LSP]",
                ultisnips = "[SNIPS]",
                nvim_lua = "[LUA]",
                path = "[PATH]"
            })[entry.source.name]
            return vim_item
        end
    }
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
