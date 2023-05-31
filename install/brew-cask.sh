# Inspired by https://github.com/webpro/dotfiles

# Install Caskroom
brew tap caskroom/cask

# Install packages
apps=(
  dropbox
  flycut # clipboard manager
  google-chrome
  google-cloud-sdk
  iterm2
  keybase
  kindle
  lastpass
  miro
  # postico # Postgres only
  rectangle
  redisinsight
  slack
  sourcetree
  # visual-studio-code # Get the Arm64 Insiders build instead
  valentina-studio # Both Postgres and MySQL I think
  zoom
  # anaconda
  # docker # Get the Apple M1 tech preview build instead
  # karabiner # speed up the keyboard
  # pycharm-ce
  # sketch # use Figma instead!
  # sketch-toolbox
  # spotify
)
brew cask install "${apps[@]}"
