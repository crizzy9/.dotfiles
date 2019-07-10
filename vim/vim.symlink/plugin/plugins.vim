"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

" call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.vim/plugged')

" Git
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" General
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'

" Autocomplete Suggestions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'

" Use YouCompleteMe with UltiSnips

" Ultisnips
" Plug 'SirVer/ultisnips'

" Snippets seperate from the engine
" Plug 'honza/vim-snippets'

" NeoSnippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Vim Jupyter
" Plug 'szymonmaszke/vimpyter'  " External dependency notedown (install using pip)

" Fast Controls
Plug 'tpope/vim-surround'

" Nerd Plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'  " For sexy commenting

" Comments
Plug 'tpope/vim-commentary'      " For easy commenting

" File icons
Plug 'ryanoasis/vim-devicons'

" Vim Latex PDF Live Preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Vim latex
Plug 'lervag/vimtex'

" File system navigation
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'

" status and powerline
Plug 'vim-airline/vim-airline'

" Tmux Integration
Plug 'christoomey/vim-tmux-navigator'

" Syntax linter
Plug 'vim-syntastic/syntastic'

" Typescript plugins
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins'}    " Needs npm install -g neovim and a :UpdateRemotePlugins

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'
Plug 'morhetz/gruvbox'

" Colorizer
Plug 'chrisbra/Colorizer'

" Colorschemes
Plug 'rakr/vim-one'
" Smooth Scrolling
" Plug 'yuttie/comfortable-motion.vim'

call plug#end()
