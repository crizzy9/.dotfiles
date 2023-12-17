#!/usr/bin/env bash

# coz running from root dir
source ./helpers.sh

# TODO:Enable unicode fonts
# Download and install zsh
if ! exists zsh; then
    user 'Do you want to install ZSH? [y]es, [n]o'
    read -n 1 zshon
    if [ $zshon == "y" ]; then
        info 'Installing ZSH'
        if [ "$(uname)" == "Darwin" ]; then
            # Do something under Mac OS X platform
            brew install zsh
        elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
            # Do something under GNU/Linux platform
            sudo apt install zsh
        fi
        success 'ZSH installation complete'
    fi
else
    info 'ZSH already installed... Skipping'
fi

# Install oh-my-zsh
# Check if oh-my-zsh is installed
if [ ! -d ~/.oh-my-zsh ]; then
    user 'Do you want to install Oh My Zsh? [y]es, [n]o'
    read -n 1 ozshon
    if [ $ozshon == "y" ]; then
        info 'Installing Oh My Zsh'
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        success 'Oh My Zsh installation complete'
    fi
else
    info 'Oh My Zsh already installed... Skipping'
fi

INSTALL_DIR="${ZSH_CUSTOM:=/Users/${USER}/.oh-my-zsh/custom}"

# Check if user wants to try install with znap (not supported on raspberry pi)
user 'Do you want to install znap? [y]es, [n]o'
read -n 1 znapon
if [ $znapon == "n" ]; then

    # Install powerelvel10k
    if [ ! -L "${HOME}/.p10k.zsh" ]; then
        user 'Do you want to install Powerlevel10k? [y]es, [n]o'
        read -n 1 pl10k
        if [ $pl10k == "y" ]; then
            info 'Installing Powerlevel10k'
            git clone --depth=1
        else
            skip 'Powerlevel10k'
        fi
    else
        skip 'Powerlevel10k already installed...'
    fi

    # Install zsh plugins
    if [ ! -d "${INSTALL_DIR}/plugins/zsh-autosuggestions" ]; then
        user 'Do you want to install (fish like) ZSH Plugins? [y]es, [n]o'
        read -n 1 plugins
        if [ $plugins == "y" ]; then
            # Install zsh plugins
            info 'Installing Zsh Plugins'
            git clone https://github.com/zsh-users/zsh-autosuggestions ${INSTALL_DIR}/plugins/zsh-autosuggestions
            git clone https://github.com/zsh-users/zsh-syntax-highlighting ${INSTALL_DIR}/plugins/zsh-syntax-highlighting
            git clone https://github.com/marlonrichert/zsh-autocomplete.git ${INSTALL_DIR}/plugins/zsh-autocomplete
            success 'ZSH plugins have been installed'
        else
            skip 'ZSH plugins'
        fi
    else
        skip 'ZSH plugins already installed...'
    fi

    apply_symlink "oh-my-zsh" "old"
else
    skip 'Installing with Znap directly from zshrc'
    apply_symlink "oh-my-zsh" "new"
fi

# Make zsh default shell
if [ $SHELL != $(which zsh) ]; then
    user 'Do you want to make zsh your default shell? [y]es, [n]o'
    read -n 1 def
    if [ $def == "y" ]; then
        chsh -s $(which zsh)
        success 'ZSH is now your default shell'
    fi
else
    skip 'ZSH is already your default shell...'
fi

# change git aliases to better ones gopull, gopush, gs
skip 'Git aliases change currently not supported...'
# sed -i.backup 's/ggpush/gopush/;s/ggpull/gopull/;s/gst/gs/' ~/.oh-my-zsh/plugins/git/git.plugin.zsh
