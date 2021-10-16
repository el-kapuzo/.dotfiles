bindkey -e
function zle-line-init() {
    print -n '\e[5 q'
}
zle -N zle-line-init
