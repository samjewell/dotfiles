# Inspired by https://github.com/webpro/dotfiles

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
arm_packages=(
  # awscli # has a LOT of dependencies, inc Python and SQLite
  cowsay # with Ezra
  derailed/k9s/k9s # K8s dashboard
  duckdb
  figlet # for ASCII art with Ezra
  fortio
  fzf # fuzzy finder
  git # brew version is more recent than Xcode CLI tools! Also get ZSH completions 🙂
  gh # github CLI tool
  go
  gpg # keys
  grafana-cloud-agent
  gron # grep for JSON
  jq
  jsonnet
  jsonnet-bundler
  k3d # lightweight k8s distro
  kubectl # K8s client
  istioctl
  mysql-client@5.7
  node@20 # could install yarn instead, if v14 not needed
  pgrep # will also install pkill
  pipx # for installing Python CLI tools
  python@3.9 # installed by awscli anyway
  ripgrep # fast grep
  ruby@2.7 # system ruby is 2.6
  sl # train animation for Ezra
  trash
  # ansible
  # chromedriver
  # circleci
  # direnv # also autoenv, to automatically load env-vars and python envs when entering/exiting folders
  # git-duet # needs `arch -x86_64 brew install git-duet`, which needs homebrew also to have been installed through rosetta!
  grafana
  # graphviz
  # imagemagick
  # lastpass-cli
  # less
  # mas # installs apps from the App Store, via the command-line
  minikube
  # postgresql # Run through Docker instead?
  # pypy3
  # python # MacOS python doesn't include pip, but this does. But postpone, and use Conda instead?
  # redis # Run through Docker instead?
  # sqlite
  # tanka
  # terraform
  # wget
  # yarn # includes node
)
brew install "${arm_packages[@]}"

# Install Oh My Zsh, via curl (Big Sur includes Zsh by default now)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install XCode
#mas install 497799835

# # Install Heroku as per https://devcenter.heroku.com/articles/heroku-cli
# # In Feb 2021, the command was as follows
# brew tap heroku/brew && brew install heroku
# # Install heroku-accounts
# # heroku plugins:install heroku-accounts

# Install Vault & Terraform
brew tap hashicorp/tap && brew install hashicorp/tap/vault hashicorp/tap/terraform

# Symlink DuckDB to where Grafana expects it
ln -s /opt/homebrew/bin/duckdb /usr/local/bin/duckdb
