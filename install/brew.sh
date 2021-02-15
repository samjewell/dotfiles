# Inspired by https://github.com/webpro/dotfiles
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
packages=(
  git
  git-duet # commit with your pair-programmer
  hub # github CLI tool
  rmtrash
  heroku
  awscli
  # jq
  # less
  # chromedriver
  # ansible
  # circleci
  # graphviz
  # imagemagick
  # mas # installs apps from the App Store, via the command-line
  # pypy3
  # python # MacOS python doesn't include pip, but this does. But postpone, and use Conda instead?
  # node@14
  # yarn
  # direnv # also autoenv, to automatically load env-vars and python envs when entering/exiting folders
  # sqlite
  # redis # Run through Docker instead?
  # postgresql # Run through Docker instead?
  # terraform
  # wget
)
brew install "${packages[@]}"

# Install Oh My Zsh, via curl
# Big Sur includes ZSH by default now
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install XCode
#mas install 497799835

# Install heroku-accounts
# heroku plugins:install heroku-accounts
