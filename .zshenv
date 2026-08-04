# UTF-8 locale for all shells, including non-interactive ones spawned by tools
# (fixes pbcopy mangling multi-byte chars when no locale is set)
export LANG=en_GB.UTF-8

# mise shims must precede /opt/homebrew/bin in the base PATH so project-pinned
# tools win in non-interactive shells (editors, scripts, agents). See the
# sourced file for the full ordering rule.
[ -f ~/dotfiles/.zsh/mise-shims.sh ] && . ~/dotfiles/.zsh/mise-shims.sh
