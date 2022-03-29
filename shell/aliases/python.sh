py () {
    if [ "${VIRTUAL_ENV+x}" = "x" ];
    then
        command python "$@"
    elif [ -d './.venv/Scripts' ];
    then
        ./.venv/Scripts/python3.exe "$@"
    elif [ -d './.venv/bin' ];
    then
        ./.venv/bin/python3 "$@"
    elif [[ $(uname -s) == MINGW* ]];
    then
        winpty -Xallow-non-tty $HOME/AppData/Local/Microsoft/WindowsApps/python3.10.exe "$@"
    else
        python3 "$@"
    fi
}

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
