local wezterm = require 'wezterm'


local config_modules = {
    'key_tables', "key_mapping", "font", "colors", "windows", "cursor"
}

local config = wezterm.config_builder()
for _, module in ipairs(config_modules) do
    require(module).apply_to_config(config)
end

return config
