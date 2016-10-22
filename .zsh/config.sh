export EDITOR='subl -w'
# Add psql to PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# first `brew install direnv`, then
eval "$(direnv hook zsh)"