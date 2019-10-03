############
# OTHERS
# INVENV=$(python -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')
############

# HOME BREW STUFF
export PATH="/usr/local/sbin:$PATH"

############
# conda stuff
export PATH="$HOME/anaconda3/bin:$PATH"

# Mosh stuff
export PATH="$PATH:/usr/local/bin"

#sh /Users/exmachina/anaconda3/etc/profile.d/conda.sh
#conda activate

# EXPORTS
# set -x PATH ~/anaconda3/bin $PATH
# set -x PATH /usr/local/mysql/bin/ $PATH
# set -x CLASSPATH ~/Northeastern/classes/NLP/Shyam_Padia_Assignment2/stanford-parser-full-2017-06-09/stanford-parser.jar $CLASSPATH
############

############
#NeoVim stuff
export XDG_CONFIG_HOME="$HOME/.config"

############
# ZSH Stuff
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/exmachina/.dotfiles/oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

# Rifle conf env variable


 #Set name of the theme to load. Optionally, if you set this to "random"
export RANGER_LOAD_DEFAULT_RC=FALSE

# Default editor for Ranger
export EDITOR='nvim'

# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#######
# POWERLEVEL, POWERLINE Options
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda virtualenv dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vi_mode background_jobs history time)
# POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='dodgerblue1'

############
# ZSH Options
setopt menu_complete
ZSH_DISABLE_COMPFIX=true
############

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$ZSH/custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    cp
    osx
    python
    virtualenv
    # virtualenv-wrapper
    iterm2
    ripgrep
    nmap
    npm
    nvm
    spring
    # ssh-agent
    sudo
    ng
    pylint
    pyenv
    docker
    vi-mode
    fzf
    # Custom Plugins
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-apple-touchbar
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh
# source ~/.fonts/*.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/exmachina/Northeastern/projects/STAI_Project/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/exmachina/Northeastern/projects/STAI_Project/google-cloud-sdk/path.zsh.inc'; fi
# source '/Users/exmachina/Northeastern/projects/STAI_Project/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/exmachina/Northeastern/projects/STAI_Project/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/exmachina/Northeastern/projects/STAI_Project/google-cloud-sdk/completion.zsh.inc'; fi
# source '/Users/exmachina/Northeastern/projects/STAI_Project/google-cloud-sdk/completion.zsh.inc'

# export GOOGLE_APPLICATION_CREDENTIALS="~/Northeastern/projects/STAI_Project/Magenta Transformer-adb81ed3f7bf.json"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion



############
# Alias
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias resrc='source ~/.zshrc'
alias jupyter-bg='jupyter notebook > /dev/null 2>&1 &'
alias jupyter-lab-bg='jupyter-lab > /dev/null 2>&1 &'
# alias pip3='pip3.7'
# alias connect-gc='gcloud compute ssh padia_shyam9@magenta-instance-1'
############

############
#Key Bindings
bindkey "[D" backward-word # option + left
bindkey "[C" forward-word # option + right
bindkey -s '^v' 'nvim $(rg --files | fzf --reverse)\n'
#############
