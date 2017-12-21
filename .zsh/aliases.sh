alias gcleanup='git branch --merged | grep -v "\*"'
alias gcleanupgo='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias ghist="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO'
alias zshconfig="subl ~/dotfiles"

# Stay safe out there
alias trash="rmtrash"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
alias cp="echo won’t clobber && cp -n"
alias mv="echo won’t clobber && mv -n"

# BU stuff here
alias reset_test_db="RAILS_ENV=test rake db:drop db:create db:schema:load db:structure:load"
alias branchdb="branchy --enable; rake db:create db:migrate"
alias tail_action="tail -f log/development.log | grep 'Processing by'"

alias retro="subl /Users/samjewell/Library/Mobile\ Documents/com~apple~CloudDocs/markdown-notes"
alias start_review="open https://docs.google.com/spreadsheets/d/1Os-8dbuUqR7-YRAz1BBPnC34pqhZUWZEYeJhmro4hsU/edit"

# Other
# alias browsync='browser-sync start --proxy localhost:3000 --files "app/assets/stylesheets/**/*.scss, app/views/**/*.html.haml"'
alias list_flippers='grep -hoR "\$flipper\[:\(\w\+\)]" --exclude-dir=node_modules --color=none * | sort -u | cut -d "[" -f2 | cut -d "]" -f1'
