# SHELL INTEGRATIONS
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export PYENV_ROOT="$HOME/.pyenv"
export BREW_PREFIX="$(brew --prefix)"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"

# Homebrew bash-completion
if [[ -r "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
  . "$BREW_PREFIX/etc/profile.d/bash_completion.sh"
fi

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

# KEYBINDS
bind '"\C-p": previous-history'
bind '"\C-n": next-history'

# ALIASES
k() {
  command kubectl "$@"
}
alias c="clear"
alias ls="ls --color=always"
alias ll="ls -lF -G"
alias lla="ls -lAF -G"
alias lsd="ls -lF -G | grep --color=never '^d'"
alias ~="cd ~"
alias ..="cd .."
alias vim="nvim"
alias sb="source ~/.bashrc"

# COMPLETIONS
complete -o default -o nospace -F __start_kubectl k

# OPTIONS
set -o vi
