# The id of the user running just.
# If it is 0, we are running as root, if not, we must run some commands with sudo
user_id := `id -u`
user_guid := `id -g` 
home := env_var("HOME")
os := os()
os_family := os_family()
scipts_dir := justfile_directory() + "/scripts"

set windows-shell := ["powershell"]

# Some variables and options, which depend on running as root or not
maybe_sudo := if user_id == "0" { "" } else { "sudo"}
build_directory := if user_id == "0" { "/build" } else { "~/build"}

# List of build dependencies, for the different recipes
nvim_build_deps := "ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl"
py_packages := "ruff jedi-language-server pynvim rope ruff-lsp"

python_build_deps := "build-essential gdb lcov libbz2-dev libffi-dev libgdbm-dev liblzma-dev libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev"

rust_build_deps := "curl build-essential"

alacritty_build_deps := "cmake libfreetype6-dev libfontconfig1-dev xclip"

# Git option which should be different on windows and unix like systems
git_autcrf_option := if os_family() == "unix" { "input" } else { "true" }

# ---------------------------------------------------------------------------------------------------------------------------
# -----------------------      RECIPIES     ---------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

# ------ DOTFILES ---------------------------------------
# Add a (n)vim package as git submodule
packadd url dir="opt":
    git submodule add --depth 1 --name {{file_stem(url)}} -- {{url}} ./vim/pack/bundle/{{dir}}/{{file_stem(url)}}
    git config -f .gitmodule submodule.{{file_stem(url)}}.shallow true
    git config -f .gitmodule submodule.{{file_stem(url)}}.ignore dirty


pack_update_commit_message := "chore(vim): update plugins"

# Update all git submodules
packupdate:
    git submodule update --remote --depth=1
    cd {{justfile_directory()}} && git add vim/pack/
    cd {{justfile_directory()}} && git commit -m "{{pack_update_commit_message}}"

packinit:
    git submodule init

# PACKAGE MANAGER -----------------------------------------------------------------------------------------------------------
# Update the package manager repositroy.
update:
    {{maybe_sudo}} apt-get update -y

# Update installed packages via packagemanager.
upgrade: update
    {{maybe_sudo}} apt-get upgrade -y

# Install a programm via package manager. Use sudo if necessary.
install +programms: update
    {{maybe_sudo}} apt-get install -y {{programms}}

# Uninstall a prgoramm via package manager. Use sudo if necessary.
uninstall +programms:
    {{maybe_sudo}} apt-get remove -y --purge {{programms}}
    {{maybe_sudo}} apt-get autoremove -y --purge

clean:
    {{maybe_sudo}} apt-get autoremove -y --purge
    {{maybe_sudo}} apt-get clean

# BUILD DIRECTORY --------------------------------------------------------------------------------------------------------------
_build_dir:
    mkdir -p {{build_directory}}
    {{maybe_sudo}} chmod -R a+rwx {{build_directory}}

_rm_build_dir:
    {{maybe_sudo}} rm -rf {{build_directory}}

# BUILD NEOVIM --------------------------------------------------------------------------------------------------------------

# Build and install neovim from the specified branch
nvim branch="stable": _build_dir (python "3.8") (install "git") (install nvim_build_deps) pyenv
    {{maybe_sudo}} chmod +x {{justfile_directory()}}/scripts/nvim.sh
    {{scipts_dir}}/nvim.sh {{branch}} {{build_directory}} {{maybe_sudo}}
    mkdir -p $HOME/.config/nvim
    echo "vim.cmd(':source {{justfile_directory()}}/vim/init.lua')" > $HOME/.config/nvim/init.lua

# Configure Ideavim
ideavim:
    echo 'let g:config_dir = "{{justfile_directory()}}/ideavim/"' > $HOME/.ideavimrc
    echo 'execute "source " . g:config_dir . "ideavimrc"' >> $HOME/.ideavimrc

# BUILD PYTHON --------------------------------------------------------------------------------------------------------------

# Maybe install python 3 from source with specified version. But only if no python3 binary is found.
python version="3.10": (install python_build_deps) _build_dir (install "git")
    {{maybe_sudo}} chmod +x {{justfile_directory()}}/scripts/python.sh
    {{scipts_dir}}/python.sh {{version}} {{build_directory}} install true {{maybe_sudo}}

# Install python version alongside existing python versions
altinstall_python version="3.10": (install python_build_deps) _build_dir
    {{maybe_sudo}} chmod +x {{justfile_directory()}}/scripts/python.sh
    {{scipts_dir}}/python.sh {{version}} {{build_directory}} altinstall false {{maybe_sudo}}

pip_conf:
    echo "[global]" >> $HOME/.config/pip/pip.conf
    echo "require-venv = true" >> $HOME/.config/pip/pip.conf

# SETUP SHELL ----------------------------------------------------------------------------
# Install zsh, and setup the zshrc file
zsh: (install "zsh")
    chsh -s /bin/zsh
    echo "export DOTFILES={{justfile_directory()}}" > $HOME/.zshrc
    echo "source {{justfile_directory()}}/zsh/zshrc" >> $HOME/.zshrc

# Setup the bashrc file.
bash:
    rm -rf $HOME/.bashrc
    echo "export DOTFILES={{justfile_directory()}}" > $HOME/.bashrc
    echo "source {{justfile_directory()}}/bash/bashrc" >> $HOME/.bashrc

# SETUP GIT ----------------------------------------------------------------------------
# Install git, and setup the global config file
git: (install "git") (install "pass")
    echo "[include]" > $HOME/.gitconfig
    echo "    path = {{justfile_directory()}}/git/gitconfig" >> $HOME/.gitconfig
    git config --global core.autocrlf {{git_autcrf_option}}
    read -p "Enter git user name: " git_user && git config --global user.name "$git_user"
    read -p "Enter git email: " git_email && git config --global user.email "$git_email"

# RUST TOOLCHAIN --------------------------------------------------------------------------------------
# Install the specified rust-toolchain.
rustc profile="default": (install rust_build_deps)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --profile {{profile}}

rust_analyzer:
    rustup update
    rustup component add rust-src
    rustup component add rust-analyzer

rust: rustc rust_analyzer

# Cargo install a program. If run as root, install to /usr/local/bin
cargo_args := if user_id == "0" {"--root /usr/local"} else { "" }

cargo_install programm:
    cargo install {{programm}} {{cargo_args}}

# Rust CLI-Tools
cli_tools: (cargo_install "ripgrep") (cargo_install "skim") (cargo_install "bat")

# alacritty
alacritty: (install alacritty_build_deps) (cargo_install "alacritty")
    rm -rf $HOME/.alacritty.yml
    echo "import:" > $HOME/.alacritty.yml
    echo "  - {{justfile_directory()}}/term/alacritty.yml" >> $HOME/.alacritty.yml
    echo "  - {{justfile_directory()}}/term/el_light.yml" >> $HOME/.alacritty.yml

# Wezterm -------------------------------------------------------------
wezterm_url := "https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu20.04.deb"

wezterm:
    #!/usr/bin/env sh
    if [ {{os}} == "macos" ]; then
        brew tab wez/wezterm
        brew install --cask wezterm-nightly --no-quarantine
    else
        curl -L -o {{build_directory}}/wezterm.deb {{wezterm_url}}
        sudo apt-get install -y {{build_directory}}/wezterm.deb
        mkdir -p {{home}}/.config/wezterm
        rm {{build_directory}}/wezterm.deb
    fi
    echo "package.path = package.path .. ';{{justfile_directory()}}/term/wezterm/?.lua'" > {{home}}/.config/wezterm/wezterm.lua
    cat {{justfile_directory()}}/term/wezterm.lua >> {{home}}/.config/wezterm/wezterm.lua
    mkdir {{home}}/.config/wezterm/colors
    cp {{justfile_directory()}}/term/el_light.toml {{home}}/.config/wezterm/colors/el_light.toml

# NEOMUTT ----------------------------------------------------
neomutt branch="main": (install "pass")
    {{maybe_sudo}} chmod +x {{scipts_dir}}/neomutt.sh
    {{scipts_dir}}/neomutt.sh {{branch}} {{build_directory}} {{maybe_sudo}}

# TEX-LIVE ---------------------------------------------------
texlive_dir := build_directory + "/texlive"

texlive: _build_dir
    mkdir {{texlive_dir}}
    curl -L -o {{texlive_dir}}/install.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar -xvzf {{texlive_dir}}/install.tar.gz -C {{texlive_dir}}
    {{maybe_sudo}} perl {{texlive_dir}}/install-tl*/install-tl
    rm -rf {{texlive_dir}}

texlab: rustc
    cargo install --git https://github.com/latex-lsp/texlab.git --locked

tex: texlive texlab

# Fonts
robotomono: _build_dir (install "git")
    chmod +x {{scipts_dir}}/robotomono.sh
    {{scipts_dir}}/robotomono.sh {{build_directory}}

private: _fritz_nas packinit nvim zsh bash wezterm tex rust robotomono cli_tools pyenv && _rm_build_dir packupdate

setup: packinit git (python "3.8") nvim zsh bash wezterm tex rust robotomono private cli_tools pyenv neomutt && _rm_build_dir packupdate

# Helper for private setup
_fritz_nas: (install "samba cifs-utils")
    rm -f {{home}}/.smbcredentials
    mkdir -p {{home}}/nas
    bash -c 'read -p "Enter Fritz-NAS user name: " user_name && echo "username=${user_name}" >> {{home}}/.smbcredentials'
    bash -c 'read -s -p "Enter Fritz-NAS password: " password && echo "password=${password}" >> {{home}}/.smbcredentials'
    {{maybe_sudo}} sh -c 'echo "//192.168.42.1/FRITZ.NAS/TOSHIBA-ExternalUSB3-0-01/ {{home}}/nas cifs noserverino,credentials={{home}}/.smbcredentials,vers=3.0,uid={{user_id}},gid={{user_guid}},x-systemd.automount,x-systemd.requires=network-online.target 0 0" >> /etc/fstab'

_no_sudo_shutdown:
    {{maybe_sudo}} echo "%sudo ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/shutdown, /sbin/reboot" >> /etc/sudoers
