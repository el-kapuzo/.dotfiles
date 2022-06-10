if [[ $(uname -s) == MINGW* ]]; then
    alias black="$DOTFILES/.venv/Scripts/black.exe"
    alias flake8="$DOTFILES/.venv/Scripts/flake8.exe"
else
    alias black="$DOTFILES/.venv/bin/black"
    alias flake8="$DOTFILES/.venv/bin/flake8"
fi

