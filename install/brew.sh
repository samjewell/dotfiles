# Inspired by https://github.com/webpro/dotfiles
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
# mas tool installs apps from the App Store, via the command-line
# OSX python doesn't include pip. brew python does include it
brew install git python yarn rmtrash heroku # mas
# Consider getting direnv or autoenv, to automatically load env-vars and python
# environments when entering/exiting folders
# Consider running Redis and Postgres via Docker only

# Install Oh My Zsh, via curl
# Big Sur includes ZSH by default now
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install XCode
#mas install 497799835

# Install heroku-accounts
heroku plugins:install heroku-accounts
