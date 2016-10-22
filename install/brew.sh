# Inspired by https://github.com/webpro/dotfiles
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install git direnv # postgresql rmtrash

# Install Oh My Zsh, via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"