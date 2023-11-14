# # Add psql to PATH
# export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
# # Add anaconda to PATH
# export PATH=/usr/local/anaconda3/bin:"$PATH"
# # Add node 12 to PATH
export PATH="/opt/homebrew/opt/node@12/bin:$PATH"
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# # Change npm's default directory for global modules
# # see https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npms-default-directory-to-another-directory
# export PATH=~/.npm-global/bin:$PATH
# # Add vault to PATH
# export PATH=$PATH:/Applications/vault
# export SUPPRESS_DEPRECATION_WARNINGS='true'
# export BULLET_ENABLED='true'
# export CAPYBARA_DRIVER='chrome_headless'
# export DEBUG='true'

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
export PATH="/opt/homebrew/bin:/opt/homebrew/opt:$PATH"

# Increase number of open allowed files, for: 
# https://github.com/grafana/grafana/blob/master/contribute/developer-guide.md#too-many-open-files-when-running-make-run
ulimit -S -n 2048

# Add git-crypt to PATH
export PATH="$PATH:/Users/samjewell/fana/git-crypt"

# Add MySQL client to PATH
export PATH="$PATH:/opt/homebrew/opt/mysql-client@5.7/bin"

# Add bash 5.2 to PATH
export PATH="$PATH:/opt/homebrew/Cellar/bash/5.2.15/bin"

# Run kubectl with the new plugin prior to the release of v1.26
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

PROMPT='%{$fg[yellow]%}%D{%L:%M:%S} '$PROMPT
