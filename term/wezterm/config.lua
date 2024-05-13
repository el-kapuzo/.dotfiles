local wezterm = require 'wezterm'
local os = require 'os'

function move(window, pane, direction)
    local result = run_nvim_navigator(pane:pane_id(), "move", direction)
    if result then
        wezterm.log_info("succesfully changed nvim window")
    else
        wezterm.log_info("changing wezterm window")
        window:perform_action(wezterm.action({ ActivatePaneDirection = direction }), pane)
    end
end

local key_tables = {
    pane = {
        { key = "s", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "v", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "d", action = wezterm.action { CloseCurrentPane = { confirm = false } } },
        { key = "z", action = "TogglePaneZoomState" },

        { key = "h", action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j", action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k", action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l", action = wezterm.action { ActivatePaneDirection = "Right" } },

        { key = "h", mods = "CTRL",                                                                 action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "j", mods = "CTRL",                                                                 action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "k", mods = "CTRL",                                                                 action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "l", mods = "CTRL",                                                                 action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    },
    application = {
        { key = "q", action = "QuitApplication" },
        { key = "f", action = "ToggleFullScreen" },
        { key = "r", action = "ReloadConfiguration" },
        { key = "0", action = "ResetFontSize" },
        { key = "+", action = "IncreaseFontSize" },
        { key = "-", action = "DecreaseFontSize" },

    }
}

return {
    font_size = 13,
    color_scheme = "el_light",
    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    automatically_reload_config = false,
    adjust_window_size_when_changing_font_size = false,
    force_reverse_video_cursor = true,
    window_padding = {
        left = 3,
        right = 0,
        top = 0,
        bottom = 0,
    },
    inactive_pane_hsb = {
        saturation = 0.95,
        brightness = 0.9,
    },
    line_height = 1.1,
    initial_cols = 90,
    initial_rows = 20,

    command_palette_fg_color = "#121212",
    command_palette_bg_color = "#ebdbb2",
    -- KEYS
    leader = { key = "b", mods = "CTRL" },
    keys = {
        -- PANES ------------------------------
        { key = "s", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "v", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "d", mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = false } } },
        { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },

        { key = "h", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Right" } },

        { key = "h", mods = "ALT",    action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "j", mods = "ALT",    action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "k", mods = "ALT",    action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "l", mods = "ALT",    action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },

        -- APPLICATION
        { key = "q", mods = "LEADER", action = "QuitApplication" },
        { key = "f", mods = "LEADER", action = "ToggleFullScreen" },
        { key = "r", mods = "LEADER", action = "ReloadConfiguration" },
        { key = "0", mods = "LEADER", action = "ResetFontSize" },
        { key = "+", mods = "ALT",    action = "IncreaseFontSize" },
        { key = "-", mods = "ALT",    action = "DecreaseFontSize" },

        -- we need a way to send CTRL+b to the running program
        { key = "b", mods = "LEADER", action = { SendKey = { key = "b", mods = "CTRL" } } }
    }
}
