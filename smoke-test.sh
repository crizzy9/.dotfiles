#!/usr/bin/env bash
# Script to test nerd fonts in terminal
# taken from https://gist.github.com/elijahmanor/c10e5787bf9ac6b8c276e47e6745826c

printf "Normal:"
normal="
    \033[1mBold\033[22m
    \033[3mItalic\033[23m
    \033[3;1mBold Italic\033[0m
    \033[4mUnderline\033[24m
    \033[9mStrikethrough\033[0m"
printf "%b" "${normal}\n\n"

printf "Ansi Colors:"
colors="
    \033[00;31mRed\033[0m
    \033[00;32mGreen\033[0m
    \033[00;33mYellow\033[0m
    \033[00;34mBlue\033[0m
    \033[00;35mPink\033[0m"
printf "%b" "${colors}\n\n"

printf "Ligatures:\n\t"
ligatures="== === !== >= <= =>"
printf "%b" "${ligatures}\n\n"

printf "Icons V1-V2:\n\t"
icons_old="契          勒 鈴  "
printf "%b" "${icons_old}\n\n"

printf "Icons V3:\n\t"
icons_new="󰐊     󰄉      󰑓  󰒲   "
printf "%b" "${icons_new}\n\n"

