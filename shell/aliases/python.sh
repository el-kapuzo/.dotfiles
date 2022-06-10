if [[ $(uname -s) == MINGW* ]]; then
    alias black="$DOTFILES/.venv/Scripts/black.exe"
    alias flake8="$DOTFILES/.venv/Scripts/flake8.exe"
else
    alias black="$DOTFILES/.venv/bin/black"
    alias flake8="$DOTFILES/.venv/bin/flake8"
fi


pyenv () {
    if [ -d "./.venv" ];
    then
        __activate_env
    else
        py -m venv ./.venv
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
