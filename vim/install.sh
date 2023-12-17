#!/usr/bin/env bash
# Setup neovim or minimal vim
# Author: @crizzy9

# coz running from root dir
source ./helpers.sh
os=
get_os os

# Install neovim
install_nvim() {
    if ! exists nvim; then
        user 'Do you want to install Neovim? [y]es, [n]o'
        read -n 1 nvimon
        if [ $nvimon == "y" ]; then
            info 'Installing Neovim'
            if [ "$os" == "Mac" ]; then
                brew install neovim
            elif [ "$os" == "Linux" ]; then
                sudo apt install neovim
            fi
            success 'Neovim installation complete'
        fi
    else
        skip 'Neovim already installed...'
    fi
}

install_ripgrep_fzf() {
    user 'Do you want to install ripgrep and fzf? [y]es, [n]o'
    read -n 1 rgfzf
    if [ $rgfzf == "y" ]; then
        info 'Installing ripgrep and fzf'
        if [ "$os" == "Mac" ]; then
            brew install ripgrep fzf
        elif [ "$os" == "Linux" ]; then
            sudo apt install ripgrep fzf
        fi
        success 'ripgrep and fzf installation complete'
    else
        skip 'ripgrep and fzf'
    fi
}

install_kickstart() {
    info 'Downloading kickstart'
    curl https://raw.githubusercontent.com/nvim-lua/kickstart.nvim/master/init.lua > ./vim/kickstart.lua
    success 'kickstart config downloaded'
    apply_symlink "vim" "kickstart.lua" "" ".config/nvim" "init.lua"
}

install_custom_nvim() {
    skip "Custom nvim is not supported yet"
}

install_minimal_vim() {
    skip "Minimal vim is not supported yet"
}

main() {
    install_nvim
    install_ripgrep_fzf

    if exists nvim; then
        user 'Do you want to install kickstart, custom nvim or minimal vim? [k]ickstart, [c]ustom, [m]inimal'
        read -n 1 vimon
        if [ $vimon == "k" ]; then
            install_kickstart
        elif [ $vimon == "c" ]; then
            install_custom_nvim
        elif [ $vimon == "m" ]; then
            install_minimal_vim
        fi
    else
        skip 'Neovim not installed, cannot install plugins!'
    fi
}

main


