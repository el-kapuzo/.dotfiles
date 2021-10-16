install () {
    PACKAGE_MANAGER=$(_package_manager)
    case $PACKAGE_MANAGER in
        apt-get)
            eval "$(_maybe_sudo) $(_package_manager) install -y $1";;
        *)
            echo "Unkonw package manager...";;
    esac
}

update () {
    PACKAGE_MANAGER=$(_package_manager)
    case $PACKAGE_MANAGER in
        apt-get)
            eval "$(_maybe_sudo) $(_package_manager) update"
            eval "$(_maybe_sudo) $(_package_manager) upgrade -y";;
        *)
            echo "Unkonw package manager...";;
    esac
}

sys_update () {
    PACKAGE_MANAGER=$(_package_manager)
    case $PACKAGE_MANAGER in
        apt-get)
            eval "$(_maybe_sudo) $(_package_manager) update"
            eval "$(_maybe_sudo) $(_package_manager) dist-upgrade -y";;
        *)
            echo "Unkonw package manager...";;
    esac

}

clean () {
    PACKAGE_MANAGER=$(_package_manager)
    case $PACKAGE_MANAGER in
        apt-get)
            eval "$(_maybe_sudo) $(_package_manager) clean -y"
            eval "$(_maybe_sudo) $(_package_manager) autoremove -y";;
        *)
            echo "Unkonw package manager...";;
    esac
}

_maybe_sudo() {
   if [ "$UID" != 0 ];
   then
       echo "sudo"
   fi
}

_package_manager() {
    echo "apt-get"
}
