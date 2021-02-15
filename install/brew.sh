# Inspired by https://github.com/webpro/dotfiles
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
packages=(
  git
  rmtrash
  heroku
  # mas # installs apps from the App Store, via the command-line
  # python # MacOS python doesn't include pip, but this does. But postpone, and use Conda instead?
  # yarn
  # direnv # also autoenv, to automatically load env-vars and python envs when entering/exiting folders
  # redis # Run through Docker instead?
  # postgresql # Run through Docker instead?
)
brew install "${packages[@]}"

# Install Oh My Zsh, via curl
# Big Sur includes ZSH by default now
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install XCode
#mas install 497799835

# Install heroku-accounts
# heroku plugins:install heroku-accounts
