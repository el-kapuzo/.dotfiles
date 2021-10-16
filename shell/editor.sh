alias vi='nvim'
alias vim='nvim'

export EDITOR=nvim
export MANPAGER='nvim +Man!'

co () {
    if [ "$#" -eq 0 ];
    then
        __location="."
    else
        __location=$1
    fi
    code $__location

    # if [ -d "$__location/.devcontainer" ];
    # then
    #     if which devcontainer &1> /dev/null &2>1;
    #     then
    #         devcontainer open $__location
    #     else
    #         code $__location
    #     fi
    # else
    #     code $__location
    # fi
}

devcontainer () {
    case $1 in
        init)
            cp -r $DOTFILES/vs_code/.devcontainer .;;
        *)
            command devcontainer "$@";;
    esac
}
