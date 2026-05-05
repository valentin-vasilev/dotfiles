#!/usr/bin/env bash

set -euo pipefail

KUBECONFIG_DIR="$HOME/.kubeconfigs"

selected=$(find "$KUBECONFIG_DIR" -type f -name "*.yaml" |
  sed "s|$KUBECONFIG_DIR/||" |
  fzf --header 'Select Kubeconfig')

if [[ -z "$selected" ]]; then
  echo "No kubeconfig selected." >&2
  exit 1
fi

# transform name
selected_name="$(basename "$selected")"
selected_name="${selected_name#*kubeconfig-}"
selected_name="${selected_name%-oidc.yaml}"

kubeconfig_path="$KUBECONFIG_DIR/$selected"

# not in tmux - start a new session
if [[ -z "${TMUX:-}" ]]; then
  tmux new-session -s "$selected_name" \
    -e "KUBECONFIG=$kubeconfig_path" \
    bash -c "export KUBECONFIG='$kubeconfig_path'; exec bash"
  exit 0
fi

# in tmux - create/switch to session

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" \
    -n "$selected_name" \
    -c "$HOME" \
    -e "KUBECONFIG=$kubeconfig_path"

  # set the environment variable for the session
  tmux set-environment -t "$selected_name" KUBECONFIG "$kubeconfig_path"
fi

# switch to the session
tmux switch-client -t "$selected_name"
tmux display-message -d 3000 "Switched to: $selected_name"
