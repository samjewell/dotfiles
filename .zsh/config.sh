#!/bin/bash

# # Change npm's default directory for global modules
# # see https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npms-default-directory-to-another-directory
# export PATH=~/.npm-global/bin:$PATH
# export SUPPRESS_DEPRECATION_WARNINGS='true'

# # first `brew install direnv`, then
# eval "$(direnv hook zsh)"

# Add Go to PATH
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

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

# Enable sqlExpressions feature toggle for Grafana local development
# Keys of features to enable, separated by space
# export GF_FEATURE_TOGGLES_ENABLE="sqlExpressions,expressionParser"
export GF_FEATURE_TOGGLES_ENABLE="queryLibrary,sqlExpressions"
# unset GF_FEATURE_TOGGLES_ENABLE

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

