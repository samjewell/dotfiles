# Inspired by https://github.com/webpro/dotfiles
# Install Caskroom

brew tap caskroom/cask

# Install packages

apps=(
  # anaconda
  dropbox
  google-chrome
  iterm2
  # karabiner
  # pycharm-ce
  # sketch
  # sketch-toolbox
  slack
  sourcetree
  # spectacle
  # spotify
  # valentina-studio
  # soundflower
  # soundcast
)

brew cask install "${apps[@]}"
