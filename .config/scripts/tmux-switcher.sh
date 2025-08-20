#!/usr/bin/env bash

session=$(tmux ls 2>/dev/null | cut -d: -f1 | fzf --prompt="Select tmux session: ")

# If a session was selected, switch to it
if [[ -n "$session" ]]; then
  tmux switch-client -t "$session"
  exit 0
else
  tmux display-message -d 3000 "No sessions available"
  exit 0
fi
