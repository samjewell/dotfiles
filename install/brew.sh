# Inspired by https://github.com/webpro/dotfiles
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
# mas tool installs apps from the App Store, via the command-line
# OSX python doesn't include pip. brew python does include it
brew install git direnv redis mas python yarn postgresql rmtrash heroku circleci watch

# Install Oh My Zsh, via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install XCode
mas install 497799835