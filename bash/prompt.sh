PROMPT_SYMBOL="❯"

# Colors
COLOR_RESET="\[\033[00m\]"
RED="\[\033[31m\]"
GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
BLUE="\[\033[34m\]"
PURPLE="\[\033[35m\]"
CYAN="\[\033[36m\]"
WHITE="\[\033[37m\]"



__host() {
    if [[ -n $SSH_CONNECTION ]]; then
       me="\u@\h"
    elif [[ $LOGNAME != $USER ]]; then
      me="\u"
    fi
    if [[ -n $me ]]; then
      echo "$GREEN[$me] $COLOR_RESET"
    fi
}


__py_env () {
    local venv_base_dir=""
    if [ "${VIRTUAL_ENV+x}" = "x" ];
    then
        venv_base_dir=$(basename $(dirname $VIRTUAL_ENV))
    fi
    if [[ -n $venv_base_dir ]];
    then
        echo "\n[$venv_base_dir]\n"
    fi
}

__git_branch () {
    local current_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n $current_branch ]];
    then
        echo " $PURPLE [$current_branch]$COLOR_RESET"
    fi
}


__set_prompt () {
    [[ $? -eq 0 ]] && __symbol_color=$YELLOW || __symbol_color=$RED

    PS1="$(__py_env)$(__host)$BLUE\W$COLOR_RESET$(__git_branch) $__symbol_color$PROMPT_SYMBOL$COLOR_RESET "
}

export PROMPT_COMMAND=__set_prompt
