#!/usr/bin/env bash
# Setup kitty terminal
# Author: @crizzy9

# coz running from root dir
source ./helpers.sh
os=
get_os os

# - Install kitty terminal

main() {
    # check if kitty is installed
    # TODO: Does not work if kitty alias is not setup
    if command -v kitty &> /dev/null; then
        info "Kitty is installed!"
        apply_symlink "kitty" "kitty.conf" "" ".config/kitty" "kitty.conf"
    else
        fail "Kitty is not installed!, please install it first"
    fi
}

main
