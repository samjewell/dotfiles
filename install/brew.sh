# Inspired by https://github.com/webpro/dotfiles

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
packages=(
  awscli # has a LOT of dependencies, inc Python and SQLite
  hub # github CLI tool
  trash
  # ansible
  # chromedriver
  # circleci
  # direnv # also autoenv, to automatically load env-vars and python envs when entering/exiting folders
  # git # Type `git`, then install XCode CLI tools via macOS. But consider brew for ZSH completions?
  # git-duet # "The x86_64 architecture is required" but `arch -x86_64` also fails rn
  # graphviz
  # imagemagick
  # jq
  # lastpass-cli
  # less
  # mas # installs apps from the App Store, via the command-line
  # node@14
  # postgresql # Run through Docker instead?
  # pypy3
  # python # MacOS python doesn't include pip, but this does. But postpone, and use Conda instead?
  # redis # Run through Docker instead?
  # sqlite
  # terraform
  # wget
  # yarn
)
brew install "${packages[@]}"

# Install Oh My Zsh, via curl
# Big Sur includes ZSH by default now
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install XCode
#mas install 497799835

# Install Heroku as per https://devcenter.heroku.com/articles/heroku-cli
# In Feb 2021, the command was as follows
brew tap heroku/brew && brew install heroku
# Install heroku-accounts
# heroku plugins:install heroku-accounts
