#!/usr/bin/env bash
# Setup bat for fzf preview
# Author: @crizzy9

# coz running from root dir
source ./helpers.sh
os=
get_os os


install_bat() {
    user "Do you want to download bat? [y/n]"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    # if [ $response == "y" ]; then
        info "Installing bat..."
        if [[ "$os" == "linux" ]]; then
            sudo apt install bat
        elif [[ "$os" == "macos" ]]; then
            brew install bat
        fi
    fi
}

main() {
    # local conf_path=$(bat --config-file)
    install_bat
    apply_symlink "bat" "bat.conf" "" ".config/bat" "bat.conf"
}

main
