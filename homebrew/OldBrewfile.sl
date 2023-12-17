# Run using: brew bundle
# brew install & brew bundle also works

# Brew Taps
tap 'homebrew/cask' || true
tap 'caskroom/homebrew-cask' || true
tap 'caskroom/versions' || true
tap 'homebrew/core' || true
tap 'homebrew/cask-fonts' || true
# tap 'homebrew/science' || true
tap 'homebrew/services' || true

# tap 'universal-ctags/universal/ctags' || true
tap 'zegervdv/zathura' || true
tap 'sambadevi/powerlevel9k' || true

# Update Home Brew
# update || true

# Basic Utility brew packages
brew 'neovim'
brew 'nmap'
brew 'nvm'
brew 'wget'
brew 'ranger'
brew 'openssl'
brew 'cmake'
brew 'mplayer'
brew 'tmux'
brew 'ripgrep'
brew 'fzf'
brew 'htop'
brew 'mosh'

# To install useful key bindings and fuzzy completion:
# $(brew --prefix)/opt/fzf/install

# Programming Languages
# If installing anaconda. Install packages from .condarc
# brew 'ipython'
# brew 'python3'
brew 'jupyter'
brew 'go'
brew 'node'

# CONDA
# https://medium.com/ayuth/install-anaconda-on-macos-with-homebrew-c94437d63a37

# CTAGS
brew 'ctags'

# zsh related plugins
# brew 'zsh'
brew 'zsh-completions'

# zathura
brew 'poppler'
cask 'xquartz'
brew 'zathura-pdf-poppler'
brew 'zathura'

# Install powerlevel9k for zsh
brew 'powerlevel9k'

# brew cask install java ==  cask 'java' in Brew File

# Casks
# Casks for other gui based apps (Firefox, iterm2, spotify, virtualbox, slack, dropbox)
cask 'font-hack-nerd-font'
# cask 'iterm2' # only if not installed already

# Health Check
# doctor

