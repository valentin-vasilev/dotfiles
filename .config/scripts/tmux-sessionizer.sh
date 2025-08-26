#!/usr/bin/env bash

# Use null-delimited output to handle spaces in names
selected=$(
  find "$HOME/code" "$HOME/dotfiles" -mindepth 1 -maxdepth 1 -type d | sed -E "s|$HOME/||g" | fzf --prompt="Select directory:"
)

selected="$HOME/$selected"

# Exit if nothing selected
if [[ -z "$selected" ]]; then
  tmux display-message -d 3000 "No directory selected."
  exit 0
fi

# basename + sanitize
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

tmux switch-client -t "$selected_name"
