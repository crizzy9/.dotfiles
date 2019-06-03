#!/usr/bin/env bash

source ../helpers.sh

# Download and install zsh and powerlevel9k and nerd fonts
if which zsh > /dev/null; then
    info 'ZSH not found... Installing'
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    # Install powerlevel9k
    # Install zsh plugins
    success 'ZSH setup finish'
else
    info 'ZSH already installed... Skipping'
fi

