require'utils'.packadd("LuaSnip")

dotfiles=os.getenv("DOTFILES")

require'luasnip.loaders.from_snipmate'.lazy_load()
require'luasnip.loaders.from_lua'.lazy_load({path = dotfiles .. '/vim/lua/lua_snippets'})
