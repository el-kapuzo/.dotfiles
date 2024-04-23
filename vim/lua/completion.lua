packadd = require 'utils'.packadd

packadd('nvim-cmp')
packadd("cmp-path")
packadd("cmp-buffer")
packadd("cmp-nvim-lua")
packadd("cmp_luasnip")
packadd("LuaSnip")

local cmp = require 'cmp'
local luasnip = require 'luasnip'


cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "buffer" }
    }),
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                end
                cmp.confirm()
            else
                fallback()
            end
        end)
    }),
    -- window = {
    --     completion = cmp.config.window.bordered(),
    --     documentation = cmp.config.window.bordered()
    -- },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = ""
            vim_item.menu = ({
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                ultisnips = "[SNIPS]",
                nvim_lua = "[LUA]",
                path = "[PATH]"
            })[entry.source.name]
            return vim_item
        end
    }
})
