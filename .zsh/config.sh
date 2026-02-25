#!/bin/bash

# # Change npm's default directory for global modules
# # see https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npms-default-directory-to-another-directory
# export PATH=~/.npm-global/bin:$PATH
# export SUPPRESS_DEPRECATION_WARNINGS='true'

# # first `brew install direnv`, then
# eval "$(direnv hook zsh)"

# Activate mise (tool version manager)
eval "$(/Users/samjewell/.local/bin/mise activate zsh)"

# Add Go to PATH
export GOPATH=$HOME/go
# Note: GOROOT should not be set manually - Go handles this automatically
# I was previously setting it, but no need since Go 1.21
# Check the git commit history for the previous version of this file
export PATH="$PATH:${GOPATH}/bin"

# Add Ruby to PATH
# export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
# export PATH="/opt/homebrew/opt/ruby@3.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Put native Arm arch. homebrew at the front of the path:
# export PATH="/opt/homebrew/bin:/opt/homebrew/opt:$PATH"

# Increase number of open allowed files, for: 
# https://github.com/grafana/grafana/blob/master/contribute/developer-guide.md#too-many-open-files-when-running-make-run
ulimit -S -n 8192

# Add MySQL client to PATH
export PATH="$PATH:/opt/homebrew/opt/mysql-client@5.7/bin"

# Add bash 5.2 to PATH
export PATH="$PATH:/opt/homebrew/Cellar/bash/5.2.15/bin"

# Run kubectl with the new plugin prior to the release of v1.26
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Use Rustanka (rtk) instead of Tanka
export USE_RTK=true

# Enable feature toggles for Grafana local development
export GF_FEATURE_TOGGLES_ENABLE="tableNextGen,queryLibrary,sqlExpressions,sqlExpressionsColumnAutoComplete,queryService,transformationsEmptyPlaceholder"
# Enable console logging for analytics events
export GF_ANALYTICS_BROWSER_CONSOLE_REPORTER=true

# Keep GPG signing stable across terminal/context changes.
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1

PROMPT='%{$fg[yellow]%}%D{%L:%M:%S} '$PROMPT

# # Switch off spotlight indexing
# sudo mdutil -a -i off

# # Switch it back on
# sudo mdutil -a -i on

# # Rebuild the index
# sudo mdutil -E

# # Disable Spotlight indexing for external drives
# sudo mdutil -i off /Volumes/EXTERNAL_DRIVE_NAME

# # Switch it back on
# sudo mdutil -i on /Volumes/EXTERNAL_DRIVE_NAME

# Have `fzf` search local files only by default, when using loki-shell
# See https://github.com/slim-bean/loki-shell?tab=readme-ov-file#loki-shell
export LS_LOCAL=true

# Hide command line numbers in fzf history search (Ctrl+R)
# --with-nth 2.. tells fzf to only display fields 2 and onwards, hiding the line numbers
export FZF_CTRL_R_OPTS="--with-nth 2.."
