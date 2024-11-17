#!/usr/bin/env bash
# Setup lazygit
# Author: @crizzy9

source ./helpers.sh
os=
get_os os

install_lazygit() {
    if ! exists lazygit; then
        user 'Do you want to install lazygit?'
        read -nr 1 lazygiton
        if [[ "$lazygiton" =~ ^[Yy]$ ]]; then
            info "Installing lazygit"
            if [ "$os" == "Mac" ]; then
                brew install lazygit
            elif [ "$os" == "Linux" ]; then
                sudo apt-get install lazygit
            fi
            success "lazygit installation complete"
        fi
    else
        info "lazygit already installed"
    fi
}

main() {
    install_lazygit
    apply_symlink "lazygit" "config.yml" "" ".config/lazygit" "config.yml"
}

main

