alias gcleanup='git branch --merged | grep -v "\*"'
alias gcleanupgo='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias ghist="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO'
alias zshconfig="code ~/dotfiles"

# Stay safe out there
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
alias cp="echo won’t clobber && cp -n"
alias mv="echo won’t clobber && mv -n"

# Rails stuff here
alias reset_test_db="RAILS_ENV=test rails db:drop db:create db:schema:load db:structure:load"
alias branchdb="branchy --enable; rake db:create db:migrate"
alias tail_action="tail -f log/development.log | grep -E 'Processing by|Parameters:'"

alias retro="code /Users/samjewell/Library/Mobile\ Documents/com~apple~CloudDocs/markdown-notes"
alias start_review="open https://docs.google.com/spreadsheets/d/1Os-8dbuUqR7-YRAz1BBPnC34pqhZUWZEYeJhmro4hsU/edit"

# Other
alias list_flippers='grep -hoR "\$flipper\[:\(\w\+\)]" --exclude-dir=tmp --exclude-dir=log --exclude-dir=node_modules --exclude-dir=coverage --color=none * | sort -u | cut -d "[" -f2 | cut -d "]" -f1'
