local M          = {}
local key_tables = {
    pane = {
        {
            key = "s",
            action = wezterm.action {
                SplitVertical = { domain = "CurrentPaneDomain" }
            }
        },
        {
            key = "v",
            action = wezterm.action {
                SplitHorizontal = { domain = "CurrentPaneDomain" }
            }
        },
        {
            key = "d",
            action = wezterm.action {
                CloseCurrentPane = { confirm = false }
            }
        },
        {
            key = "z",
            action = "TogglePaneZoomState"
        },
        {
            key = "h",
            action = wezterm.action { ActivatePaneDirection = "Left" }
        },
        {
            key = "j",
            action = wezterm.action { ActivatePaneDirection = "Down" }
        },
        {
            key = "k",
            action = wezterm.action { ActivatePaneDirection = "Up" }
        },
        {
            key = "l",
            action = wezterm.action { ActivatePaneDirection = "Right" }
        },
        {
            key = "h",
            mods = "CTRL",
            action = wezterm.action { AdjustPaneSize = { "Left", 5 } }
        },
        {
            key = "j",
            mods = "CTRL",
            action = wezterm.action { AdjustPaneSize = { "Down", 5 } }
        },
        {
            key = "k",
            mods = "CTRL",
            action = wezterm.action { AdjustPaneSize = { "Up", 5 } }
        },
        {
            key = "l",
            mods = "CTRL",
            action = wezterm.action { AdjustPaneSize = { "Right", 5 } }
        },
        {
            key = "Escape",
            action = "PopKeyTable"
        },
    },
    application = {
        {
            key = "q",
            action = "QuitApplication"
        },
        {
            key = "f",
            action = "ToggleFullScreen"
        },
        {
            key = "r",
            action = "ReloadConfiguration"
        },
        {
            key = "0",
            action = "ResetFontSize"
        },
        {
            key = "+",
            action = "IncreaseFontSize"
        },
        {
            key = "-",
            action = "DecreaseFontSize"
        },
        {
            key = "Escape",
            action = "PopKeyTable"
        },
    }
}

local function apply_to_config(config)
    config.key_tables = key_tables
end

M.apply_to_config = apply_to_config

return M
