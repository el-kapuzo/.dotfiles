PROMPT_SYMBOL="%(!.#.❯)"

COLOR_HOST_ME=green
COLOR_CURRENT_DIR=blue
COLOR_RETURN_STATUS_TRUE=yellow
COLOR_RETURN_STATUS_FALSE=red
COLOR_GIT_STAGED=green
COLOR_GIT_UNSTAGED=yellow
COLOR_GIT_UNTRACKED=red
COLOR_GIT_BRANCH=magenta
COLOR_GIT_ACTION=cyan
COLORS_BG_JOBS=yellow


PROMPT='$(host)$(current_dir)$(git_branch)$(bg_jobs)$(return_status)'
# RPROMPT='${vcs_info_msg_0_}'
setopt PROMPT_SUBST

host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[$COLOR_HOST_ME]%}[$me]%{$reset_color%} "
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
        echo "\n[$venv_base_dir]"
    fi
}


current_dir() {
  echo -n "%{$fg[$COLOR_CURRENT_DIR]%}%c "
}

git_branch () {
    local current_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n $current_branch ]];
    then
        echo "%{$fg[$COLOR_GIT_BRANCH]%}[$current_branch]%{$reset_color%} "
    fi
}

return_status() {
  echo -n "%(?.%F{$COLOR_RETURN_STATUS_TRUE}.%F{$COLOR_RETURN_STATUS_FALSE})$PROMPT_SYMBOL%f "
}


bg_jobs() {
  bg_status="%{$fg[$COLOR_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{$COLOR_GIT_STAGED}S%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{$COLOR_GIT_UNSTAGED}M%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '%F{$COLOR_GIT_BRANCH}%b%f %c%u'
zstyle ':vcs_info:git*:*' actionformats '[%F{$COLOR_GIT_BRANCH}⚡︎%b%f %f%c%u]'
function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{$COLOR_GIT_UNTRACKED}U%f"
  fi
}


precmd() {
    vcs_info
    __py_env
}

