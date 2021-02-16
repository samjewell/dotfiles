# Inspired by https://github.com/webpro/dotfiles

# Install Caskroom
brew tap caskroom/cask

# Install packages
apps=(
  # anaconda
  dropbox
  flycut # clipboard manager
  google-chrome
  iterm2
  lastpass
  # docker # Get the Apple M1 tech preview build instead
  visual-studio-code # then add the `code` alias to my shell, as per https://code.visualstudio.com/docs/setup/mac
  # karabiner # speed up the keyboard
  # pycharm-ce
  # sketch # use Figma instead!
  # sketch-toolbox
  rectangle
  redisinsight
  slack
  sourcetree
  # spotify
  postico
  # valentina-studio
  zoom
)
brew cask install "${apps[@]}"
