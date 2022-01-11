local wezterm = require 'wezterm';
local os = require'os'

function send_to_nvim(window, pane, direction) 
    local dofile_path = os.getenv("HOME") .. "/.dotfiles"
    local py_path = dofile_path .. "/.venv/bin/python"
    local py_script_path = dofile_path .. "/term/wezterm_navigator.py"
    local nvim_address = "/tmp/nvim_wezterm_" .. pane:pane_id()
    local result = os.execute(py_path .. " " .. py_script_path .. " --socket " .. nvim_address .. " --direction " .. direction)
    if result then
        wezterm.log_info("succesfully changed nvim window")
    else
        window:perform_action(wezterm.action({ActivatePaneDirection = direction}), pane)
    end
end

wezterm.on("nvim-left", function(window, pane) send_to_nvim(window, pane, "Left") end)
wezterm.on("nvim-right", function(window, pane) send_to_nvim(window, pane, "Right") end)
wezterm.on("nvim-down", function(window, pane) send_to_nvim(window, pane, "Down") end)
wezterm.on("nvim-up", function(window, pane) send_to_nvim(window, pane, "Up") end)

return {
    font_size = 10.5,
    -- font = wezterm.font_with_fallback({"Roboto Mono", "Fira Code"}),
    color_scheme = "kapuzo_dark",
    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    automatically_reload_config = false,
    adjust_window_size_when_changing_font_size=false,
    force_reverse_video_cursor = true,
    window_padding = {
        left = 0,
        right =0,
        top = 0,
        bottom = 0,
    },
    inactive_pane_hsb = {
        saturation = 0.6,
        brightness = 0.5,
    },
    line_height = 1.1,
    initial_cols = 90,
    initial_rows = 20,

    -- KEYS
    leader = {key = "b", mods="CTRL"},
    keys = {
        -- PANES ------------------------------
        {key="s", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        {key="v", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        {key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
        -- NVIM AWARE NAVIGATION ----------------------
        {key="h", mods="CTRL", action=wezterm.action{EmitEvent = "nvim-left"}},
        {key="j", mods="CTRL", action=wezterm.action{EmitEvent="nvim-down"}},
        {key="k", mods="CTRL", action=wezterm.action{EmitEvent="nvim-up"}},
        {key="l", mods="CTRL", action=wezterm.action{EmitEvent="nvim-right"}},

        {key="h", mods="ALT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        {key="j", mods="ALT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        {key="k", mods="ALT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        {key="l", mods="ALT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        {key="d", mods="LEADER", action=wezterm.action{CloseCurrentPane={confirm=false}}},
        {key="z", mods="LEADER", action="TogglePaneZoomState"},

        -- APPLICATION
        {key="q", mods="LEADER", action="QuitApplication"},
        {key="f", mods="LEADER", action="ToggleFullScreen"},
        {key="r", mods="LEADER", action="ReloadConfiguration"},
        {key="0", mods="LEADER", action="ResetFontSize"},
        {key="+", mods="ALT", action="IncreaseFontSize"},
        {key="-", mods="ALT", action="DecreaseFontSize"},

        -- we need a way to send CTRL+b to the running program
        {key="b", mods="LEADER", action={SendKey={key="b", mods="CTRL"}}},
    }
}
