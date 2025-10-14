#!/usr/bin/env bash

choice=$(find /usr/share/man -type f -name '*.[0-9]*' |
  sed -E 's#.*/([^/]+)\.[0-9]+.*$#\1#' |
  sort -u |
  fzf)

[[ -n "$choice" ]] && exec man "$choice"
