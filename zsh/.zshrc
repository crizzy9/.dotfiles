pokemon-colorscripts --no-title -s -r

# =============== #
# ZSH Snap - Znap #
# =============== #

[[ -r ~/zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/zsh-plugins/znap
source ~/zsh-plugins/znap/znap.zsh  # Start Znap

# ============= #
# Powerlevel10k #
# ============= #
() { [[ -r $1 ]] && source $1 } ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$USERNAME.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_TERM_SHELL_INTEGRATION=true
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=1
znap source romkatv/powerlevel10k powerlevel10k.zsh-theme

# ========= #
# Oh my zsh #
# ========= #
zstyle ':omz:plugins:nvm' lazy yes
znap source ohmyzsh/ohmyzsh lib/{git,directories,completion} plugins/{git,zoxide,archlinux}

# =================== #
# ZSH Autosuggestions #
# =================== #
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=( history completion )
znap source zsh-users/zsh-autosuggestions

# ================ #
# ZSH Autocomplete #
# ================ #
znap source marlonrichert/zsh-autocomplete

# ======================= #
# ZSH Syntax Highlighting #
# ======================= #
typeset -A ZSH_HIGHLIGHT_STYLES

# change highlights as per https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=blue
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[alias]=fg=blue,bold,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=#f59042,bold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=#f59042,bold
ZSH_HIGHLIGHT_STYLES[path]=fg=magenta
ZSH_HIGHLIGHT_STYLES[globbing]='none'
export ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

# ZSH COMPLETIONS #
znap source zsh-users/zsh-completions
fpath=(~/zsh-plugins/zsh-users/zsh-completions/src $fpath)

# ======= #
# FZF Tab #
# ======= #
# znap source Aloxaf/fzf-tab
# # disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# # don't use escape sequences here, fzf-tab will ignore them
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# zstyle ':completion:*' menu no
# # preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# # switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'
#
# # zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# # disable sort when completing `git checkout`
# # zstyle ':completion:*:git-checkout:*' sort false
# zstyle ':completion:complete:git-checkout:argument-rest' sort false
# # zstyle ':completion:complete:git-revert:argument-rest' sort false
# # no sort for all git commands
# # zstyle ':completion:*:git:*' sort false
# # set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# # zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# zstyle ':completion:*' menu no
# # preview directory's content with exa when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 -a --icons=auto --color=always $realpath'
# # switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'
# # preview file content with bat when completing with fzf-tab
# # zstyle ':fzf-tab:complete:*' fzf-preview 'bat --color=always --style=header,grid --line-range :600 {}'
#
# # change continous trigger
# # zstyle ':fzf-tab:*' continous-trigger '/'
#
# # enable fzf tmux popup with fzf-tab
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# zstyle ':fzf-tab:complete:cd*' popup-min-size 50 8
#
# # fix needed for if scrolled with ^N or ^P
# my-fzf-tab() {
#   functions[compadd]=$functions[-ftb-compadd]
#   zle fzf-tab-complete
# }
# zle -N my-fzf-tab

# ============= #
# Znap Settings #
# ============= #

znap eval kitty 'curl -fsSL https://raw.githubusercontent.com/kovidgoyal/kitty/master/shell-integration/zsh/kitty-integration'

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _conda conda              'eval "$( "${HOME}/anaconda3/bin/conda" shell.zsh hook 2> /dev/null)"'
compctl -K    _conda conda

znap function _pip_completion pip3       'eval "$( pip3 completion --zsh )"'
compctl -K    _pip_completion pip3

znap function _fzf fzf		  'source <(fzf --zsh)'
compctl -K    _fzf fzf

# ============ #
# FZF Settings #
# ============ #

export FZF_DEFAULT_COMMAND='fd -u .'

# live grep
function fzfLiveGrepRg {
    rm -f /tmp/rg-fzf-{r,f}
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case --glob '!{.git,node_modules,__pycache__}/*' "
    INITIAL_QUERY="${*:-}"
    : | fzf-tmux -p 55%,60% -- --height=60% --layout=reverse --ansi --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload($RG_PREFIX {q})+unbind(ctrl-r)" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)" \
        --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)" \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --prompt '1. ripgrep> ' \
        --delimiter : \
        --header '╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱' \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        # --bind 'enter:become(nvim {1} +{2})'
}

function nvimGoToLine {
    selection=$(fzfLiveGrepRg)
    if [ -z "$selection" ]; then
        echo "No file selected"
    else
        filename=$(echo $selection | awk -F: '{print $1}')
        line=$(echo $selection | awk -F: '{print $2}')
        nvim $(printf "+%s %s" $line $filename) +"normal zz";
    fi
}

# find files and open in nvim
function fzfFindFileFd {
    # uses fzf-tmux to display files in preview window
    echo $(fd --type f --hidden --follow --exclude '{.git,node_modules,__pycache__}' | fzf-tmux -p 70%,60% -- --height=60% --layout=reverse --cycle --border --margin=1 --padding=1 --prompt='Files> ' --preview='bat --line-range :500 {}' --bind='ctrl-/:change-preview-window(down|hidden|)' --color=header:italic --header='Ctrl-/: toggle preview')
}

function nvimGoToFile {
    selection=$(fzfFindFileFd)
    if [ -z "$selection" ]; then
        echo "No file selected"
    else
        nvim $selection
    fi
}

# ==== #
# Sesh #
# ==== #

function tmuxSeshList {
    echo $(sesh list -tz | fzf-tmux -p 55%,60% --no-sort --border-label ' sesh ' --prompt '⚡  ' --header '  ^a all ^t tmux ^x zoxide ^f find' --bind 'tab:down,btab:up' --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list)' --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t)' --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z)' --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)')
}

function tmuxSeshConnect {
    selection=$(tmuxSeshList)
    if [ -z "$selection" ]; then
        echo "No session selected"
    else
        sesh connect $selection
    fi
}

# ================== #
# Essential settings #
# ================== #

# hidden files setting
setopt globdots

# setup history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# ===== #
# Atuin #
# ===== #
znap eval atuin 'atuin init zsh'

# =========== #
# Keybindings #
# =========== #

# enable vim mode
bindkey -v

# keymap overrides
bindkey '^ ' autosuggest-accept
bindkey '^N' down-line-or-select
bindkey '^P' up-line-or-search

# custom functions
# bindkey "^I" my-fzf-tab
bindkey -s '^f' 'nvimGoToFile\n'
bindkey -s '^g' 'tmuxSeshConnect\n'
# bindkey -s '^i' 'nvimGoToLine\n'

# ========================= #
# Custom alias and settings #
# ========================= #

# path updates
export PATH="$PATH:$HOME/go/bin:$HOME/.cargo/bin"

# bat settings
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

# set default editor
export NVIM_APPNAME=nvim-lazyvim
export EDITOR=nvim

alias vc="NVIM_APPNAME=nvim-custom nvim"
alias v="nvim"

# list files alternatives
alias lss='eza --icons auto --group-directories-first'
alias lsa='eza -la --icons auto --group-directories-first'
alias lsag='eza -la --icons auto --git --header --group-directories-first'
alias lsat='eza -la --icons auto --git --header --tree -L 2 --git-ignore'

# Json aliases
## copy formatted json to clipboard
alias jj='pbpaste | jq . | pbcopy'
## copy formatted json to clipboard and paste in neovim
alias jjn='pbpaste | jq . | nvim - +"set syntax=json"'
alias jjj='pbpaste | jq .'

# lazygit
alias lg='lazygit'

# jupyter
alias jupyter-bg='jupyter notebook > /dev/null 2>&1 &'
alias jupyter-lab-bg='jupyter-lab > /dev/null 2>&1 &'

# yazi
alias y='yazi'

# grub theme archive
alias grub-archive='tar -cvf Sekiro.tar Sekiro'

# electron support wayland
export ELECTRON_ENABLE_WAYLAND=1
export ELECTRON_OZONE_PLATFORM_HINT=auto

