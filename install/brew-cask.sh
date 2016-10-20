# Inspired by https://github.com/webpro/dotfiles
# Install Caskroom

brew tap caskroom/cask

# Install packages

apps=(
  dropbox
  flux
  google-chrome
  iterm2
  karabiner
  sketch
  sketch-toolbox
  slack
  sourcetree
  spectacle
  valentina-studio
)

brew cask install "${apps[@]}"

# Then install these manually:

# node
# docker for mac
# Firefox 46
# postgresapp
# sublime-text3
# oh-my-zsh