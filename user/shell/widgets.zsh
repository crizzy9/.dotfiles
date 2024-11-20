# ======== #
# Vim Mode
# ======== #
# unbinds certain emacs mode keybinds like Ctrl+P and Ctrl+N
bindkey -v

# =========================================== #
# Find files using fd and open them in neovim
# =========================================== #
function fzf-find-and-edit-widget() {
  exec </dev/tty
  exec <&1

  local file=$(fd --type f --hidden --follow --exclude '{.git,node_modules,__pycache__}' | \
    fzf-tmux -p 70%,60% -- --height=60% \
    --layout=reverse \
    --cycle \
    --border \
    --margin=1 \
    --padding=1 \
    --prompt='Files> ' \
    --preview='bat --line-range :500 {}' \
    --bind='ctrl-/:change-preview-window(down|hidden|)' \
    --color=header:italic \
    --header='Ctrl-/: toggle preview')


  zle reset-prompt > /dev/null 2>&1 || true
  [[ -z "$file" ]] && return
  nvim $file
}

zle -N fzf-find-and-edit-widget
# Ctrl+f
bindkey '^f' fzf-find-and-edit-widget

# ======================================= #
# Grep and jump to line using ripgrep+fzf
# ======================================= #
function fzf-live-grep-widget() {
  exec </dev/tty
  exec <&1

  rm -f /tmp/rg-fzf-{r,f}

  local RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case --glob '!{.git,node_modules,__pycache__}/*' "
  local INITIAL_QUERY="${*:-}"

  local selection=$(: | fzf-tmux -p 55%,60% -- --height=60% \
    --layout=reverse \
    --cycle \
    --border \
    --margin=1 \
    --padding=1 \
    --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload($RG_PREFIX {q})+unbind(ctrl-r)" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)" \
    --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)" \
    --color "hl:-1:underline,hl+:-1:underline:reverse" \
    --prompt '1. ripgrep> ' \
    --delimiter : \
    --header '╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱' \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3')

  zle reset-prompt > /dev/null 2>&1 || true
  [[ -z "$selection" ]] && return
  local filename=$(echo $selection | awk -F: '{print $1}')
  local line=$(echo $selection | awk -F: '{print $2}')
  nvim $(printf "+%s %s" $line $filename) +"normal zz"
}

zle -N fzf-live-grep-widget
# TODO: update
# Ctrl+Shift+k (for tmux, for kitty its ctrl k as tmux is using that for navigation)
bindkey '^k' fzf-live-grep-widget

# ======================================================== #
# Find/Create tmux sessions using zoxide and fzf with sesh
# ======================================================== #
function fzf-tmux-sesh-widget() {
  exec </dev/tty
  exec <&1

  local session=$(sesh list | fzf-tmux -p 70%,60% -- --height=60% \
    --layout=reverse \
    --cycle \
    --border \
    --margin=1 \
    --padding=1 \
    --no-sort --border-label ' sesh ' --prompt '⚡  ' \
    --header '  ^a all ^t tmux ^c configs ^x zoxide ^d tmux kill ^f find' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list)' \
    --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t)' \
    --bind 'ctrl-c:change-prompt(⚙️  )+reload(sesh list -c)' \
    --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z)' \
    --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list)')

  zle reset-prompt > /dev/null 2>&1 || true
  [[ -z "$session" ]] && return
  sesh connect $session
}

zle -N fzf-tmux-sesh-widget
# Ctrl-g overriden by the tmux version when in tmux
bindkey '^g' fzf-tmux-sesh-widget

# ================= #
# Other keybindings
# ================= #

bindkey '^y' autosuggest-accept # binds Ctrl+y
# bindkey '^i' yank # binds Ctrl+Shift+i - doesnt work with vi mode paste contents from to Ctrl+U (why yank tho?)

