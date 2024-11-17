#!/usr/bin/env bash
# symlink obsidian vimrc

source ./helpers.sh

main() {
    apply_symlink "obsidian" "obsidian.vimrc" "" "Work/Sesame" ".obsidian.vimrc"
}

main

