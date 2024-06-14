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

# na autocompletion
source ~/.na-complete.zsh

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

# spaceship prompt
source /opt/homebrew/opt/spaceship/spaceship.zsh

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
## spawn ssh sessions with ChromaTerm
alias ssh="ct ssh"

## source .zshrc
alias sz="source ~/.zshrc"

## clear screen
alias c="clear"

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

## suffix aliases
alias -s {json,yml,yaml}=emacs

## git
alias ga="git add"
alias gp="git push"
alias gc="git commit -s -S"
alias gs="git status"


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

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add spicetify to $PATH
export PATH=$PATH:/Users/vsvasilev/.spicetify

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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
  --no-info \
  --no-separator \
  --multi \
  --scroll-off=2 \
  --no-scrollbar \
  --no-hscroll \
  --info=inline \
  --pointer=' ' \
  --prompt='   ' \
  --marker=' ' \
  --color=fg:#575279 \
  --color=fg+:#575279 \
  --color=hl:#b4637a \
  --color=hl+:#b4637a \
  --color=bg:-1 \
  --color=bg+:-1 \
  --color=gutter:-1 \
  --color=border:#575279 \
  --color=info:#d7827e \
  --color=prompt:#d7827e \
  --color=pointer:#d7827e \
  --color=marker:#d7827e \
  --color=spinner:#d7827e \
  --color=header:#d7827e \
  --history-size=10000"

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --no-init --window=-4'

# set ansible to use bastion as ssh proxy
export ANSIBLE_SSH_ARGS='-o ProxyCommand="ssh -q -W %h:%p vsvasilev@lxsofpbastion01.bedford.progress.com"'

# set projects dir
export PROJECT_DIR=$HOME/code

# zsh vi mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# gpg

# if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
#    source ~/.gnupg/.gpg-agent-info
#    export GPG_AGENT_INFO
# else
#     eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
# fi

# EDITOR
export EDITOR=$(which nvim)

# GPG TTY
export GPG_TTY=$TTY


complete -o nospace -C /opt/homebrew/Cellar/tfenv/3.0.0/versions/1.7.0/terraform terraform
