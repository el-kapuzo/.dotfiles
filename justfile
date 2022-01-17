# The id of the user running just.
# If it is 0, we are running as root, if not, we must run some commands with sudo
user_id := `id -u`
user_guid := `id -g`
home := env_var("HOME")
os := os()
os_family := os_family()

# Some variables and options, which depend on running as root or not
maybe_sudo := if user_id == "0" { "" } else { "sudo"}
build_directory := if user_id == "0" { "/build" } else { "~/build"}

# List of build dependencies, for the different recipes
nvim_build_deps := "ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl"
python_build_deps := "build-essential gdb lcov libbz2-dev libffi-dev libgdbm-dev liblzma-dev libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev"
rust_build_deps := "curl build-essential"

# Git option which should be different on windows and unix like systems
git_autcrf_option := if os_family() == "unix" { "input" } else { "true" }

# ---------------------------------------------------------------------------------------------------------------------------
# -----------------------      RECIPIES     ---------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

# ------ DOTFILES ---------------------------------------
# Add a (n)vim package as git submodule
packadd url dir="opt":
    git submodule add --name {{file_stem(url)}} -- {{url}} ./vim/pack/bundle/{{dir}}/{{file_stem(url)}}

# Update all git submodules
packupdate:
    git submodule update --remote --depth=1

# PACKAGE MANAGER -----------------------------------------------------------------------------------------------------------
# Update the package manager repositroy.
update:
    {{maybe_sudo}} apt-get update -y

# Update installed packages via packagemanager.
upgrade: update
    {{maybe_sudo}} apt-get upgrade -y

# Install a programm via package manager. Use sudo if necessary.
install +programms:
    {{maybe_sudo}} apt-get install -y {{programms}}

# Uninstall a prgoramm via package manager. Use sudo if necessary.
uninstall +programms:
    {{maybe_sudo}} apt-get remove -y --purge {{programms}}
    {{maybe_sudo}} apt-get autoremove -y --purge

clean:
    {{maybe_sudo}} apt-get autoremove -y --purge
    {{maybe_sudo}} apt-get clean -y --purge

# BUILD DIRECTORY --------------------------------------------------------------------------------------------------------------
_build_dir:
    mkdir -p {{build_directory}}
    {{maybe_sudo}} chmod -R a+rwx {{build_directory}}

_rm_build_dir:
    rm -rf {{build_directory}}

# BUILD NEOVIM --------------------------------------------------------------------------------------------------------------

# Build and install neovim from the specified branch
install_nvim branch="stable": _build_dir maybe_install_python (install nvim_build_deps) && _rm_build_dir
    {{maybe_sudo}} chmod +x {{justfile_directory()}}/scripts/nvim.sh
    {{justfile_directory()}}/scripts/nvim.sh {{branch}} {{build_directory}} {{maybe_sudo}} {{justfile_directory()}}/.venv {{user_id}}
    echo "source $DOTFILES/vim/vimrc" > $HOME/.config/nvim/init.vim
    rm -rf {{build_directory}}/neovim

# BUILD PYTHON --------------------------------------------------------------------------------------------------------------
# Maybe install python 3 from source with specified version. But only if no python3 binary is found.
maybe_install_python version="3.8":
    #!/usr/bin/env sh
    if [ -x "$(command -v python3)" ];
    then
        echo "python3 is already installed"
    else
        just install_python {{version}}
    fi


# Build and install the specified python version
install_python version="3.8": (install python_build_deps) _build_dir && _rm_build_dir
    {{maybe_sudo}} chmod +x {{justfile_directory()}}/scripts/python.sh
    {{justfile_directory()}}/scripts/python.sh {{version}} {{build_directory}} {{maybe_sudo}} install

altinstall_python version="3.8": (install python_build_deps) _build_dir && _rm_build_dir
    {{maybe_sudo}} chmod +x {{justfile_directory()}}/scripts/python.sh
    {{justfile_directory()}}/scripts/python.sh {{version}} {{build_directory}} {{maybe_sudo}} altinstall

# SETUP SHELL ----------------------------------------------------------------------------
# Install zsh, and setup the zshrc file
install_zsh: (install "zsh")
    chsh -s /bin/zsh
    echo "source {{justfile_directory()}}/zsh/zshrc > $HOME/.zshrc

# Setup the bashrc file.
install_bash:
    rm -rf $HOME/.bashrc
    echo "source {{justfile_directory()}}/bash/bashrc > $HOME/.bashrc

# SETUP GIT ----------------------------------------------------------------------------
# Install git, and setup the global config file
install_git: (install "git") (install "pass")
    echo "[include]" > $HOME/.gitconfig
    echo "path = {{justfile_directory()}}/git/gitconfig" >> $HOME/.gitconfig
    git config --global core.autocrlf {{git_autcrf_option}}
    read -p "Enter git user name: " git_user && git config --global user.name "$git_user"
    read -p "Enter git email: " git_email && git config --global user.email "$git_email"

# RUST TOOLCHAIN --------------------------------------------------------------------------------------
# Install the specified rust-toolchain.
install_rust profile="default": (install rust_build_deps)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --profile {{profile}}

rust_analyzer_target := if os() == "linux" {
"unknown-linux-gnu"
} else if os() == "windows" {
"pc-windows-msvc"
} else { "apple-darwin"}

install_rust_analyser:
    rustup component add rust-src
    curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-{{arch()}}-{{rust_analyzer_target}}.gz |gzip -c - > ~/.local/bin/rust-analyzer
    chmod +x ~/.local/bin/rust-analyzer

# Cargo install a program. If run as root, install to /usr/local/bin
cargo_args := if user_id == "0" {"--root /usr/local"} else { "" }

cargo_install programm:
    cargo install {{programm}} {{cargo_args}}

# Wezterm -------------------------------------------------------------
wezterm_url := "https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu20.04.deb"

_install_wezterm: _build_dir && _rm_build_dir
    #!/usr/bin/env sh
    if [ {{os}} == "macos" ]; then
        brew tab wez/wezterm
        brew install --cask wezterm-nightly --no-quarantine
    else
        curl -L -o {{build_directory}}/wezterm.deb {{wezterm_url}}
        sudo apt-get install -y {{build_directory}}/wezterm.deb
        mkdir -p {{home}}/.config/wezterm
    fi

install_wezterm: _install_wezterm
    rm -rf {{home}}/.config/wezterm/wezterm.lua
    ln -s {{justfile_directory()}}/term/wezterm.lua {{home}}/.config/wezterm/wezterm.lua

# DEV-DOCKER ---------------------------------------------------------------------------------------------
_docker_cleanup: _rm_build_dir (uninstall nvim_build_deps) (uninstall rust_build_deps) (uninstall python_build_deps) (uninstall "git") clean
    rm -rf /var/lib/apt/lists/*

# install the basic binaries needed for developing in docker
docker_base_py username: _build_nvim install_rust (install "zsh") (install "sudo") (cargo_install "ripgrep") (cargo_install "skim") && _docker_cleanup
    useradd {{username}} --shell /usr/bin/zsh -G sudo
    echo "{{username}}:password" | chpasswd

# install the python version in docker
docker_py version: (install_python version) _nvim_pyenv && _docker_cleanup
    python3 -m pip install pdbpp

install_py_docker username: (install_python  "3.9") (altinstall_python "3.6") install_nvim install_rust (install "zsh") (install "sudo") (install "fzf") (cargo_install "ripgrep") && _docker_cleanup
    useradd {{username}} --shell /usr/bin/zsh -G sudo
    echo "source /home/{{username}}/.dotfiles/zsh/zshrc" > /home/username/.zshrc
    echo "{{username}}:password" | chpasswd

# PRIVATE ------------------------------------------------------------------------------------------------
# setup the machine for private use
_fritz_nas: (install "samba cifs-utils")
    rm -f {{home}}/.smbcredentials
    mkdir -p {{home}}/nas
    bash -c 'read -p "Enter Fritz-NAS user name: " user_name && echo "username=${user_name}" >> {{home}}/.smbcredentials'
    bash -c 'read -s -p "Enter Fritz-NAS password: " password && echo "password=${password}" >> {{home}}/.smbcredentials'
    {{maybe_sudo}} sh -c 'echo "//192.168.42.1/FRITZ.NAS/TOSHIBA-ExternalUSB3-0-01/⋅{{home}}/nas cifs noserverino,credentials={{home}}/.smbcredentials,vers=3.0,uid={{user_id}},gid={{user_guid}},x-systemd.automount,x-systemd.requires=network-online.target 0 0" >> /etc/fstab'

_no_sudo_shutdown:
    {{maybe_sudo}} echo "%sudo ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/shutdown, /sbin/reboot"

_install_fonts: _build_dir (install "git")
    cd {{build_directory}} && git clone --depth=1 https://github.com/googlefonts/RobotoMono
    mkdir -p ~/.local/share/fonts/robotomono
    rm {{build_directory}}/RobotMono/fonts/ttf/*Light*
    rm {{build_directory}}/RobotMono/fonts/ttf/*Medium*
    rm {{build_directory}}/RobotMono/fonts/ttf/*Thin*
    cp -f {{build_directory}}/RobotoMono/fonts/ttf/*.ttf ~/.local/share/fonts/truetype/robotomono
    rm -rf {{build_directory}}/RobotoMono
    fc-cache -f -v


install_neomutt: (install "pass")

install_private: install_rust install_rust_analyser install_git install_bash install_zsh maybe_install_python install_nvim  (install "fzf") (cargo_install "ripgrep") (install "pass") install_neomutt _fritz_nas _install_fonts && _rm_build_dir _no_sudo_shutdown
