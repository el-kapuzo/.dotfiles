local wezterm = require 'wezterm'
local M = {}

M.apply_to_config = function(config)
    config.color_scheme = 'el_light'
    config.command_palette_fg_color = "#121212"
    config.command_palette_bg_color = "#ebdbb2"
    config.inactive_pane_hsb = {
        saturation = 0.95,
        brightness = 0.9,
    }
    config.window_frame = {
        font = wezterm.font { family = "Fira Code" },
        font_size = 12,
        active_titlebar_bg = "#ebdbb2",
        inactive_titlebar_bg = "#d5c4a1",
        button_fg = "#121212",
        button_bg = "#ebdbb2",
    }
    config.colors = {
        tab_bar = {
            background = "#ebdbb2",
            active_tab = {
                bg_color = "#bdae93",
                fg_color = "#121212",
                intensity = "Bold",
            },
            inactive_tab = {
                bg_color = "#f2e7cb",
                fg_color = "#121212",
                intensity = "Half",
            },
            new_tab = {
                fg_color = "#121212",
                bg_color = "#ebdbb2",
            },
            new_tab_hover = {
                fg_color = "#121212",
                bg_color = "#ebdbb2",
                italic = true,
            },
        },
    }
end

return M
