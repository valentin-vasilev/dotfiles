#!/usr/bin/env bash
set -euo pipefail

# Pick a Go standard library package
packages=$(go list std | sort)
selected_pkg=$(echo "$packages" | fzf --prompt="Go package > ")
[[ -z "$selected_pkg" ]] && exit 0

# Temp file for symbol list + cleanup on exit
symbols_file=$(mktemp /tmp/godoc-symbols.XXXXXX)
trap 'rm -f "$symbols_file"' EXIT

# Extract symbols (func, type, const, var) into the temp file
go doc -short "$selected_pkg" | while IFS= read -r line; do
  # Trim leading whitespace
  line=${line#"${line%%[!$'\t ']*}"}
  case $line in
  func\ *)
    rest=${line#func }
    sym=${rest%%(*}
    sym=${sym%% *}
    echo "$sym"
    ;;
  type\ *)
    rest=${line#type }
    sym=${rest%% *}
    echo "$sym"
    ;;
  const\ *)
    rest=${line#const }
    sym=${rest%% *}
    echo "$sym"
    ;;
  var\ *)
    rest=${line#var }
    sym=${rest%% *}
    echo "$sym"
    ;;
  esac
done >"$symbols_file"

# Build go doc command depending on symbol selection
if [[ -s $symbols_file ]]; then
  symbol=$(sort -u "$symbols_file" | fzf --prompt="Symbol in $selected_pkg (Enter to skip) > ")
  if [[ -n $symbol ]]; then
    godoc_cmd=(go doc "$selected_pkg.$symbol")
  else
    godoc_cmd=(go doc "$selected_pkg")
  fi
else
  godoc_cmd=(go doc "$selected_pkg")
fi

# Temp file for the actual documentation output
doc_file=$(mktemp /tmp/godoc-output.XXXXXX)
trap 'rm -f "$doc_file"' EXIT

# Write docs into the file
"${godoc_cmd[@]}" >"$doc_file"

# Open in Neovim
exec nvim "$doc_file"
