# Updates editor information when the keymap changes.
function zle-keymap-select() {
    # Update keymap variable for the prompt
    VI_KEYMAP=$KEYMAP

    # Change cursor depending on mode.
    # Block cursor in "normal" mode, Beam in insert mode.
    [[ -n "$VI_MODE_KEEP_CURSOR" ]] || if [[ "$VI_KEYMAP" == "vicmd" ]]; then
        print -n '\e[1 q'
    else
        print -n '\e[5 q'
    fi

    zle reset-prompt
    zle -R
}

# Start every prompt in insert mode
function zle-line-init() {
    zle -K viins
}

zle -N zle-line-init
zle -N zle-keymap-select

# Reset the cursor to block style before running applications
function _vi_mode_reset_cursor() {
    [[ -n "$VI_MODE_KEEP_CURSOR" ]] || print -n '\e[1 q'
}
autoload -U add-zsh-hook
add-zsh-hook preexec _vi_mode_reset_cursor

# Enable vi keymap
bindkey -v
