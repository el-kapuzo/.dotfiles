local wezterm = require 'wezterm'
local M = {}

M.apply_to_config = function(config)
    config.font_size = 14
    config.line_height = 1.2
    config.adjust_window_size_when_changing_font_size = false
    config.font = wezterm.font { family = "Fira Code", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } }
end

return M
