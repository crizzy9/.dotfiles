#!/usr/bin/env bash
# Setup wezterm terminal
# Author: @crizzy9

# coz running from root dir
source ./helpers.sh
os=
get_os os

# - Install Wezterm terminal
# - Install nerd fonts if not already installed with wezterm

main() {
    # check if wezterm is installed
    if command -v wezterm &> /dev/null; then
        info "Wezterm is installed!"
        apply_symlink "wezterm" "wezterm.lua" "" ".config/wezterm" "wezterm.lua"
    else
        fail "Wezterm is not installed!, please install it first"
    fi
}

main
