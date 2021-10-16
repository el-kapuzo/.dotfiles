#! /bin/sh


__install_script="$(dirname $(realpath $0))/install_extensions.sh"

echo "#! /bin/sh" > $__install_script
code --list-extensions | xargs -L 1 echo code --install-extension >> $__install_script

chmod +x $__install_script
