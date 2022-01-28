if ! [[ $(uname -s) == MINGW* ]];
then
    export PYTHONSTARTUP=$DOTFILES/python/pythonrc.py
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias py="python"

python () {
    if [ "${VIRTUAL_ENV+x}" = "x" ];
    then
        command python "$@"
    else
        if [[ $(uname -s) == MINGW* ]];
        then
            winpty -Xallow-non-tty $HOME/AppData/Local/Microsoft/WindowsApps/python3.9.exe
        else
            python3 "$@"
        fi
    fi
}

pyenv () {
    if [ -d "./.venv" ];
    then
        __activate_env
    else
        python -m venv ./.venv
        if [ -d "./.venv/bin/" ];
        then
            ./.venv/bin/python -m pip install --upgrade pip setuptools
        else
            ./.venv/Scripts/python.exe -m pip install --upgrade pip setuptools
        fi
        __activate_env
    fi
}

rmpyenv () {
    if [ -d "./.venv" ];
    then
        if [ "${VIRTUAL_ENV+x}" = "x" ];
        then
            deactivate
        fi
        rm -r ./.venv
    fi
}

__activate_env () {
    if [ -d "./.venv/bin/" ];
    then
        . ./.venv/bin/activate
    else
        . ./.venv/Scripts/activate
    fi
}
