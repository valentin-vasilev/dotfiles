# ============================================================================
# ZSH Configuration
# ============================================================================

# ============================================================================
# 1. CORE ZSH SETTINGS
# ============================================================================

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# ============================================================================
# 2. ENVIRONMENT VARIABLES
# ============================================================================

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export DICTIONARY_PATH="$HOME/Library/Spelling"
export MANPAGER="nvim +Man!"
export EDITOR=nvim
export GPG_TTY="$TTY"
export GOPATH="$HOME/go"
export DOCKERPATH="/Applications/Docker.app/Contents/Resources/bin"
export HDBCLIENTPATH="/Applications/sap/hdbclient"

export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --no-init --window=-4'

# ============================================================================
# 3. PATH SETUP
# ============================================================================

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="${PATH}:${DOCKERPATH}:${HDBCLIENTPATH}:${GOPATH}/bin"

# ============================================================================
# 4. SHELL INTEGRATIONS
# ============================================================================

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(zoxide init zsh --cmd cd)"

# ============================================================================
# 5. COMPLETION SETUP
# ============================================================================

FPATH="/opt/homebrew/share/zsh-completions:$FPATH"
FPATH="$HOME/.zfunc:$FPATH"

autoload -Uz compinit bashcompinit
bashcompinit
compinit

zstyle ':completion:*' menu select

source <(kubectl completion zsh)
source <(switcher completion zsh)

# ============================================================================
# 6. ZSH PLUGINS - BEFORE FZF (IMPORTANT!)
# ============================================================================

# Syntax highlighting
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Auto-suggestions
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Auto-pair
source "$HOME/.zsh/zsh-autopair/autopair.zsh"
autopair-init

# VI Mode (must be before FZF keybindings!)
source "/opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
zvm_after_init_commands+=(
  'bindkey "^R" fzf-history-widget'
  'bindkey "^T" fzf-file-widget'
)

# Prompt
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# ============================================================================
# 7. KEYBINDINGS (after vi-mode, before FZF)
# ============================================================================

bindkey '^f'   vi-forward-word
bindkey '^b'   backward-word

# ============================================================================
# 8. FZF CONFIGURATION (AFTER plugins and keybindings)
# ============================================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="
  --no-mouse \
  --height 30% \
  --layout=reverse \
  --border=rounded \
  --padding 2% \
  --info=inline \
  --no-separator \
  --multi \
  --scroll-off=2 \
  --no-scrollbar \
  --no-hscroll \
  --pointer=' ' \
  --prompt='   ' \
  --marker='󰥱 ' \
  --gutter=' ' \
  --color=fg:#575279 \
  --color=fg+:#907aa9 \
  --color=hl:#286983 \
  --color=hl+:#286983 \
  --color=bg:-1 \
  --color=bg+:#dfdad9 \
  --color=gutter:-1 \
  --color=query:#286983 \
  --color=border:#6d8f89 \
  --color=info:#575279 \
  --color=prompt:#286983 \
  --color=pointer:#286983 \
  --color=marker:#286983 \
  --color=spinner:#d7827e \
  --color=header:#d7827e \
  --history-size=10000 \
  --preview-window=:hidden \
  --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200' \
  --preview-window=right:50% \
  --preview-label='[ Preview ]' \
  --bind 'ctrl-v:toggle-preview' \
  --bind 'ctrl-a:select-all'"

# FZF Tab (must load after compinit and FZF keybindings)
source "$HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh"

# ============================================================================
# 9. ALIASES
# ============================================================================

alias sz="source ~/.zshrc"
alias c="clear"
alias k="kubectl"
alias ls="ls --color=always"
alias ll="ls -lF -G"
alias lla="ls -lAF -G"
alias lsd="ls -lF -G | grep --color=never '^d'"
alias ~="cd ~"
alias ..="cd .."
alias vim="nvim"
alias chrome="open -a \"Google Chrome\""
alias s="switcher"
alias apps="xargs brew install < $HOME/dotfiles/apps"

# ============================================================================
# 10. FUNCTIONS
# ============================================================================

function ld() { 
  grep "$1" ~/.ssh/config
}

function hgrep() { 
  fc -Dlim "*$@*" 1
}

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function tmux() {
  if [ $# -eq 0 ]; then
    command tmux -f ~/.config/tmux/tmux.conf new-session -A -s tabletop
  else
    command tmux -f ~/.config/tmux/tmux.conf "$@"
  fi
}

# ============================================================================
# 11. INITIALIZATION
# ============================================================================

ssh-add --apple-load-keychain -q
