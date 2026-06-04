#!/bin/bash

gdoc2md() {
  local tool="${GDOC2MD_TOOL:-$HOME/dotfiles/tools/gdoc2md}"

  if [[ ! -d "$tool" ]]; then
    echo "gdoc2md: Go tool directory not found: $tool" >&2
    return 1
  fi

  (cd "$tool" && command go run . "$@")
}
