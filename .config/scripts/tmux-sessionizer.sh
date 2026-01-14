#!/usr/bin/env bash

PROJECT_DIRS=("$HOME/code" "$HOME/dotfiles")

set -euo pipefail

selected=$(
  find "${PROJECT_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d | sed -E "s|$HOME/||g" | fzf --prompt="Select project:"
)

# Exit if nothing selected
if [[ -z "$selected" ]]; then
  tmux display-message -d 3000 "No project selected."
  exit 0
fi

selected="$HOME/$selected"

# transform name
selected_name=$(basename "$selected")
selected_name=${selected_name#.}    # Trim leading dot
selected_name=${selected_name//./_} # Replace dots with underscores

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected"
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -n "$selected_name" -c "$selected"
  tmux select-window -t "$selected_name:1"
fi

# switch to the session
tmux switch-client -t "$selected_name"
tmux display-message -d 3000 "Switched to: $selected_name"
