# Add psql to PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
# Add anaconda to PATH
export PATH=/usr/local/anaconda3/bin:"$PATH"
# Add node 14 to PATH
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# Change npm's default directory for global modules
# see https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npms-default-directory-to-another-directory
export PATH=~/.npm-global/bin:$PATH
# Add vault to PATH
export PATH=$PATH:/Applications/vault
export SUPPRESS_DEPRECATION_WARNINGS='true'
export BULLET_ENABLED='true'
export CAPYBARA_DRIVER='chrome_headless'
export DEBUG='true'

# first `brew install direnv`, then
eval "$(direnv hook zsh)"

# Add Go to PATH
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"