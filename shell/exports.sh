export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

export FZF_DEFAULT_COMMAND='rg --files'
export SKIM_DEFAULT_COMMAND='rg --files'
export BAT_CONFIG_PATH=$DOTFILES/bat/bat.config
export RIPGREP_CONFIG_PATH=$DOTFILES/ripgrep/rg.config

if ! [[ $(uname -s) == MINGW* ]];
then
    export PYTHONSTARTUP=$DOTFILES/python/pythonrc.py
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias py="python"
export PATH=$DOTFILES/git/commands:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
