#!/usr/bin/env bash
# Setup alacritty terminal
# Author: @crizzy9

#
# coz running from root dir
source ./helpers.sh
os=
get_os os

# - Install Alacritty terminal
# Follow instructions in readme

main() {
    # check if alacritty is installed
    if exists alacritty; then
        info "Alacritty is installed!"
        apply_symlink "alacritty" "alacritty.toml" "" ".config/alacritty" "alacritty.toml"
    else
        fail "Alacitty is not installed!, please install it first"
    fi
}

main
