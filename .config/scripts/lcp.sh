#!/usr/bin/env bash

set -euo pipefail

DOWNLOAD_DIR="$HOME/Downloads"
ARCHIVE_NAME="archive.zip"
DEST_DIR="$HOME/code/landscape/generated"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
  rm -f "$DOWNLOAD_DIR/$ARCHIVE_NAME"
}
trap cleanup EXIT

ARCHIVE_PATH="$DOWNLOAD_DIR/$ARCHIVE_NAME"

if [[ ! -f "$ARCHIVE_PATH" ]]; then
  echo "Error: Archive not found at $ARCHIVE_PATH" >&2
  exit 1
fi

if ! unzip -q "$ARCHIVE_PATH" -d "$TMP_DIR"; then
  echo "Error: Failed to unzip archive" >&2
  exit 1
fi

if [[ ! -d "$DEST_DIR" ]]; then
  echo "Error: Destination directory does not exist: $DEST_DIR" >&2
  exit 1
fi

if ! cp -a "$TMP_DIR"/archive/landscape/generated/. "$DEST_DIR"/; then
  echo "Error: Failed to copy files to destination" >&2
  exit 1
fi

exit 0
