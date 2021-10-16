alias gs='git status'

alias ga='git add'
alias gaa='git add .'

alias gc='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcamend='git commit --amend --no-edit'

alias gp='git push'

git () {
    case "$1" in
        prune)
            __checkout_default
            git branch | grep -v "master\|develop" | xargs git branch -D
            git sync;;
        sync)
            git pull
            command git fetch --all -Pp;;
        root)
            cd $(git rev-parse --show-toplevel);;
        feat)
            __checkout_default
            git pull
            git checkout -b feat/dpohl/$2;;
        fix)
            __checkout_default
            git pull
            git checkout -b fix/dpohl/$2;;
        *)
            command git "$@";;
    esac
}

__checkout_default () {
    if git branch | grep develop >& /dev/null;
    then
        git checkout develop
    else
        git checkout master
    fi
}
