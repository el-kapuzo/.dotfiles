export EDITOR="nvim"
export PASSWORD_STORE_GENERATED_LENGTH=32

export FZF_DEFAULT_COMMAND='rg --files'
export SKIM_DEFAULT_COMMAND='rg --files'

export BAT_CONFIG_PATH=$DOTFILES/bat/bat.config
export RIPGREP_CONFIG_PATH=$DOTFILES/ripgrep/rg.config

# ------------ PYTHON ---------------
if ! [[ $(uname -s) == MINGW* ]];
then
    export PYTHONSTARTUP=$DOTFILES/python/pythonrc.py
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1
