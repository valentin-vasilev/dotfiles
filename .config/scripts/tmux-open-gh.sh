#!/usr/bin/env bash

current_dir=$(tmux run "echo #{pane_current_path}")
cd $current_dir

# Check if current directory is inside a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  tmux display-message -d 3000 "Not inside a Git repository."
  exit 0
fi

# Get the remote URL (default: origin)
remote_url="$(git remote get-url origin 2>/dev/null || true)"

if [[ -z "$remote_url" ]]; then
  tmux display-message -d 3000 "No remote 'origin' found."
  sleep 3
  exit 0
fi

# Normalize: if SSH, convert to HTTPS
if [[ "$remote_url" =~ ^https:// ]]; then
  https_url="$remote_url"
else
  https_url="$(echo "$remote_url" |
    sed -E 's#git@([^:]+):#https://\1/#')"
fi

# Strip trailing .git (makes it browser-friendly)
https_url="${https_url%.git}"

# Open in browser
open "$https_url"
exit 0
