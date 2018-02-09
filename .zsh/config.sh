export EDITOR='subl -w'
# Add psql to PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# Change npm's default directory for global modules
# see https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npms-default-directory-to-another-directory
export PATH=~/.npm-global/bin:$PATH
export SUPPRESS_DEPRECATION_WARNINGS='true'

# first `brew install direnv`, then
eval "$(direnv hook zsh)"