#!/usr/bin/env bash

SCRIPT=$(realpath "$0")
current=$(tmux display-message -p '#S' 2>/dev/null)

if [[ "$1" == "--list" ]]; then
  tmux ls 2>/dev/null | cut -d: -f1 | awk -v cur="$current" '{
    print ($0 == cur) ? "* " $0 : "  " $0
  }'
  exit 0
fi

session=$("$SCRIPT" --list | fzf \
  --prompt="Select tmux session: " \
  --bind="ctrl-d:execute-silent(tmux kill-session -t \$(echo {} | awk '{print \$NF}'))+reload($SCRIPT --list)" |
  awk '{print $NF}')

if [[ -n "$session" ]]; then
  tmux switch-client -t "$session"
else
  tmux display-message -d 3000 "No sessions available"
fi
