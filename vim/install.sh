#!/usr/bin/env bash
source ./helpers.sh

nvim_config_file=~/.config/nvim

mkdir -p ~/.config/

if [ ! -L "$nvim_config_file" ]; then
  ln -s ~/.dotfiles/vim/vim.symlink "$nvim_config_file"
fi

# pip install neovim
# npm install neovim

# Install vim plugins
# nvim +PlugInstall +qall > /dev/null

# nvim typescript install
# https://github.com/mhartington/nvim-typescript/issues/197#issuecomment-469134118

# Fix nerdtree-git-plugin
# https://github.com/vim-syntastic/syntastic/issues/1391#issuecomment-97310854
# sed -i '' 's/call s:FileUpdate/nested call s:FileUpdate/' ~/.dotfiles/vim/vim.symlink/plugged/nerdtree-git-plugin/nerdtree_plugin/git_status.vim
