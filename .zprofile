# Login-shell setup. Ordering here is load-bearing: `brew shellenv` prepends
# /opt/homebrew/bin to PATH, so mise shims are re-asserted at the end of this
# file - the last writer to the front of PATH wins.

# Homebrew (no-op on machines without it)
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2021-04-01 13:24:40
export PATH="$PATH:$HOME/.local/bin"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# mise shims back in front of Homebrew (see file for the ordering rule)
[ -f ~/dotfiles/.zsh/mise-shims.sh ] && . ~/dotfiles/.zsh/mise-shims.sh
