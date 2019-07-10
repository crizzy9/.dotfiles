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

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k" ]; then
    user 'Do you want to install Powerlevel9k? [y]es, [n]o'
    read -n 1 pl9
    if [ $pl9 == "y" ]; then
        # Install powerlevel9k
        info 'Installing Powerlevel9k'
        git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
        success 'Powelevel9k has ben setup'
    fi
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k" ]; then
    user 'Do you want to install (fish like) ZSH Plugins? [y]es, [n]o'
    read -n 1 plugins
    if [ $plugins == "y" ]; then
        # Install zsh plugins
        info 'Installing Zsh Plugins'
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-apple-touchbar ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-apple-touchbar
        git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
        success 'ZSH plugins have been installed'
    fi
fi

# Make zsh default shell
# chsh -s $(which zsh)
