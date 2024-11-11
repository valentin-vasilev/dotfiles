# zsh enable autocompletion
if type brew &>/dev/null;
then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# aws autocompletion
complete -C $(which aws_completer) aws

# az autocompletion
complete -C '/opt/homebrew/etc/bash_completion.d/az' az

# kubectl autocompletion
source <(kubectl completion zsh)

# k9s config dir
export K9S_CONFIG_DIR="$HOME/.config/k9s"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# zsh fzf tab completion
# NOTE: fzf-tab needs to be loaded after compinit, but before plugins which will wrap 
# widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
source $HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh

# zsh syntax highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggesstions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh zshautopair
source $HOME/.zsh/zsh-autopair/autopair.zsh
autopair-init

# zsh vi mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# spaceship prompt
source $(brew --prefix)/opt/spaceship/spaceship.zsh

#bindkey
bindkey '^f'   vi-forward-word
bindkey '^b'   backward-word

# zsh 
## set zsh history file and size
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
## setting the extended_history records the timestamp of each command in HISTFILE
setopt EXTENDED_HISTORY
## append commands to zsh history immediately after execution
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
## skip duplicates and show each command only once.
setopt HIST_FIND_NO_DUPS

# aliases

## source .zshrc
alias sz="source ~/.zshrc"

## clear screen
alias c="clear"

## kubectl
alias k="kubectl"

# homebrew install apps
alias apps="xargs brew install < $HOME/dotfiles/apps"

## file listing
alias ls="ls --color=always"
alias ll="ls -lF -G"
alias lla="ls -lAF -G"
## list directories only
alias lsd="ls -lF -G | grep --color=never '^d'"

## directory navigation
alias ~="cd ~"
alias ..="cd .."

## use nvim instead of vim
alias vim="nvim"

## chrome
alias chrome="open -a \"Google Chrome\""

## tmux
alias tmat="tmux attach"
alias tmls="tmux ls"

# functions
function ld() { grep "$1" ~/.ssh/config; } # search hosts in ssh config file
export -f ld >/dev/null
function hgrep() { fc -Dlim "*$@*" 1 } # search zsh history
export -f hgrep >/dev/null

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add docker cli to $PATH
export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

# Add SAP hdbsql to $PATH
export PATH=$PATH:/Applications/sap/hdbclient

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# dictionary path
export DICTIONARY_PATH=$HOME/Library/Spelling

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8

# fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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
  --info=inline \
  --pointer=' ' \
  --prompt='   ' \
  --marker='󰥱 ' \
  --color=fg:#575279 \
  --color=fg+:#f2e9e1 \
  --color=hl:#286983 \
  --color=hl+:#286983 \
  --color=bg:-1 \
  --color=bg+:#907aa9 \
  --color=gutter:-1 \
  --color=query:#286983 \
  --color=border:#575279 \
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
  --preview-label='[ Preview ]'
  --bind 'ctrl-v:toggle-preview'
  --bind 'ctrl-a:select-all'"

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --no-init --window=-4'

# EDITOR
export EDITOR=$(which nvim)

# GPG TTY
export GPG_TTY=$TTY
