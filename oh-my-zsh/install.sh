#!/usr/bin/env bash

# coz running from root dir
source ./helpers.sh

# Download and install zsh and powerlevel9k and nerd fonts
if ! exists zsh; then
    info 'ZSH not found... Installing'
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    success 'ZSH setup finish'
else
    info 'ZSH already installed... Skipping'
fi

INSTALL_DIR="${ZSH_CUSTOM:=/Users/exmachina/.oh-my-zsh/custom}"

if [ ! -d "${INSTALL_DIR}/themes/powerlevel9k" ]; then
    user 'Do you want to install Powerlevel9k? [y]es, [n]o'
    read -n 1 pl9
    if [ $pl9 == "y" ]; then
        # Install powerlevel9k
        info 'Installing Powerlevel9k'
        git clone https://github.com/bhilburn/powerlevel9k.git ${INSTALL_DIR}/themes/powerlevel9k
        success 'Powelevel9k has ben setup'
    fi
fi

if [ ! -d "${INSTALL_DIR}/plugins/zsh-autosuggestions" ]; then
    user 'Do you want to install (fish like) ZSH Plugins? [y]es, [n]o'
    read -n 1 plugins
    if [ $plugins == "y" ]; then
        # Install zsh plugins
        info 'Installing Zsh Plugins'
        git clone https://github.com/zsh-users/zsh-autosuggestions ${INSTALL_DIR}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting ${INSTALL_DIR}/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-apple-touchbar ${INSTALL_DIR}/plugins/zsh-apple-touchbar
        git clone https://github.com/zsh-users/zsh-history-substring-search ${INSTALL_DIR}/plugins/zsh-history-substring-search
        success 'ZSH plugins have been installed'
    fi
fi

# Make zsh default shell
chsh -s $(which zsh)

# change git aliases
sed -i.backup 's/ggpush/gopush/;s/ggpull/gopull/;s/gst/gs/' ~/.oh-my-zsh/plugins/git/git.plugin.zsh

