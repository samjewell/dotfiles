# Inspired by https://github.com/webpro/dotfiles
# Install Caskroom

brew tap caskroom/cask

# Install packages

apps=(
  anaconda
  dropbox
  flux
  google-chrome
  iterm2
  # karabiner
  # sketch
  # sketch-toolbox
  slack
  sourcetree
  spectacle
  spotify
  valentina-studio
  soundflower
  soundcast
)

brew cask install "${apps[@]}"
