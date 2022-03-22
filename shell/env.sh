export EDITOR="nvim"
export MANPAGER='nvim +Man!'

export PASSWORD_STORE_GENERATED_LENGTH=32

export FZF_DEFAULT_COMMAND='rg --files'
export SKIM_DEFAULT_COMMAND='rg --files'

# ------------ PYTHON ---------------
if ! [[ $(uname -s) == MINGW* ]];
then
    export PYTHONSTARTUP=$DOTFILES/python/pythonrc.py
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1
