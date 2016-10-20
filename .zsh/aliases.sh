alias gcleanup='git branch --merged | grep -v "\*"'
alias gcleanupgo='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias ghist="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO'

# BU stuff here
alias reset_test_db="RAILS_ENV=test rake db:drop db:create db:structure:load db:schema:load"
alias branchdb="branchy --enable; rake db:create db:migrate"
alias tail_action="tail -f log/development.log | grep 'Processing by'"

# Other
# alias browsync='browser-sync start --proxy localhost:3000 --files "app/assets/stylesheets/**/*.scss, app/views/**/*.html.haml"'
