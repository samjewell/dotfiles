# Inspired by https://github.com/webpro/dotfiles

# Install Caskroom
brew tap caskroom/cask

# Install packages
apps=(
  dropbox
  flycut # clipboard manager
  google-chrome
  iterm2
  kindle
  lastpass
  postico
  rectangle
  redisinsight
  slack
  sourcetree
  # visual-studio-code # Get the Arm64 Insiders build instead
  zoom
  # anaconda
  # docker # Get the Apple M1 tech preview build instead
  # karabiner # speed up the keyboard
  # pycharm-ce
  # sketch # use Figma instead!
  # sketch-toolbox
  # spotify
  # valentina-studio
)
brew cask install "${apps[@]}"
