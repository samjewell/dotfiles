# UTF-8 locale for all shells, including non-interactive ones spawned by tools
# (fixes pbcopy mangling multi-byte chars when no locale is set)
export LANG=en_GB.UTF-8

# mise shims must precede /opt/homebrew/bin in the base PATH so project-pinned
# tools win in non-interactive shells (editors, scripts, agents). See the
# sourced file for the full ordering rule.
[ -f ~/dotfiles/.zsh/mise-shims.sh ] && . ~/dotfiles/.zsh/mise-shims.sh

# Disable zsh's `log` builtin so it doesn't shadow /usr/bin/log (unified
# logging). Apple does this in /etc/zshrc, but that file is interactive-only,
# so scripts and agent tooling still hit the builtin and fail with
# "zsh:log:1: too many arguments" - easily misread as "the log is empty".
disable log
