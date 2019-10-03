#!/usr/bin/env bash
source ./helpers.sh

nvim_config_file=~/.config/nvim

mkdir -p ~/.config/

# check if dot files installed

# if neovim doesnt work do init.vim symlink again with vimrc
# rm ~/.dotfiles/vim/vim.symlink/init.vim
# ln -s ~/.dotfiles/vim/vimrc.symlink ~/.dotfiles/vim/vim.symlink/init.vim

if [ -L "$nvim_config_file" ]; then
    mv "$nvim_config_file" "${nvim_config_file}.backup"
    success "moved $nvim_config_file to ${nvim_config_file}.backup"
fi
# link nvim config file
ln -s ~/.dotfiles/vim/vim.symlink "$nvim_config_file"

pip install neovim
npm install neovim

# Install vim plugins
nvim +PlugInstall +qall > /dev/null

# might not need also bugged
# nvim typescript install
# https://github.com/mhartington/nvim-typescript/issues/197#issuecomment-469134118

# Fix nerdtree-git-plugin
# https://github.com/vim-syntastic/syntastic/issues/1391#issuecomment-97310854
# sed -i '' 's/call s:FileUpdate/nested call s:FileUpdate/' ~/.dotfiles/vim/vim.symlink/plugged/nerdtree-git-plugin/nerdtree_plugin/git_status.vim

