# Put mise shims at the front of PATH so mise-managed tools (go, node, ...)
# shadow Homebrew/system duplicates.
#
# Ordering rule: the last writer to the front of PATH wins. `brew shellenv`
# (.zprofile) prepends /opt/homebrew/bin, so this must be (re-)asserted AFTER
# it. Non-interactive shells matter too: `mise run` / `mise x` splice their
# tool paths in at the shims' position in PATH, so if Homebrew sits ahead of
# the shims, Homebrew's go/node/etc silently shadow the project-pinned
# versions (seen as "go1.X does not match go tool version go1.Y" in CI tasks).
#
# Sourced from:
#   - .zshenv   -> every zsh, incl. non-interactive (editors, scripts, agents)
#   - .zprofile -> login shells, where `brew shellenv` runs after .zshenv
#
# No-op on machines without mise (shims dir won't exist).
_mise_shims="${XDG_DATA_HOME:-$HOME/.local/share}/mise/shims"
if [ -d "$_mise_shims" ]; then
  path=("$_mise_shims" ${path:#$_mise_shims})  # prepend; drop any older entry
fi
unset _mise_shims
