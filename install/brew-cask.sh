# Inspired by https://github.com/webpro/dotfiles
# Install Caskroom

brew tap caskroom/cask
brew install brew-cask

# Install packages

apps=(
  dropbox
  flux
  google-chrome
  iterm2
  karabiner
  sketch
  sketch-toolbox
  sourcetree
  spectacle
  sublime-text3
  valentina-studio
)

brew cask install "${apps[@]}"