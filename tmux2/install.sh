#!/usr/bin/env bash
# Setup tmux and tmux plugin manager
# Author: @crizzy9

# coz running from root dir
source ./helpers.sh
os=
get_os os

# install tmux
install_tmux() {
    if ! exists tmux; then
        user 'Do you want to install Tmux?'
        read -nr 1 tmuxon
        if [[ "$tmuxon" =~ ^[Yy]$ ]]; then
            info "Installing Tmux"
            if [ "$os" == "Mac" ]; then
                brew install tmux
            elif [ "$os" == "Linux" ]; then
                sudo apt-get install tmux
            fi
            success "Tmux installation complete"
        fi
    else
        info "Tmux already installed"
    fi

}

# install tmux plugin manager
# check if tmux plugin manager already installed
# if not, install it
install_tmux_plugin_manager() {
    TPM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/plugins/tpm"
    if ! [ -d "$TPM_DIR" ]; then
        info "Installing Tmux Plugin Manager"
        git clone https://github.com/tmux-plugins/tpm.git "$TPM_DIR"
    fi
}

# install tmux plugins
# tpm update

main() {
    install_tmux
    apply_symlink "tmux" "tmux.conf" "" ".config/tmux" "tmux.conf"
    install_tmux_plugin_manager
}

main
