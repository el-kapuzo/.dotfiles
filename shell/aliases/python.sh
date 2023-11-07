
if [[ $(uname -s) == MINGW* ]]; then
    alias pyenv="make_py_env && . ./.venv/Scripts/activate"
else
    alias pyenv="make_py_env && . ./.venv/bin/activate"
fi

