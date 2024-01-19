#!/usr/bin/env bash
# Setup ranger and rifle
# Author: @crizzy9

source ./helpers.sh
os=
get_os os

# install ranger
install_ranger() {
    if ! exists ranger; then
        user 'Do you want to install ranger?'
        read -nr 1 rangeron
        if [[ "$rangeron" =~ ^[Yy]$ ]]; then
            info "Installing ranger"
            if [ "$os" == "Mac" ]; then
                brew install ranger
            elif [ "$os" == "Linux" ]; then
                sudo apt-get install ranger
            fi
            success "ranger installation complete"
        fi
    else
        info "ranger already installed"
    fi
}

main () {
    install_ranger
    apply_symlink "ranger" "rc.conf" "" ".config/ranger" "rc.conf"
}

main
