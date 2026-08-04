#!/bin/bash

# Tool PATH / activations. Source this LAST from ~/.zshrc so mise wins
# over Volta/yarn/bun globals for project-pinned tools.
# See https://mise.jdx.dev/getting-started.html

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Activate mise last so project-pinned tools (go, node, corepack yarn) take
# precedence over Volta/yarn/bun global installs prepended above (and over
# Homebrew, prepended by `brew shellenv` in .zprofile). Guarded so these
# dotfiles still work on a machine without mise.
if [ -x "$HOME/.local/bin/mise" ]; then
  eval "$("$HOME/.local/bin/mise" activate zsh)"
elif command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
