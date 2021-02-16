# SammyJ's dotfiles

These dotfiles are made with love, with these aims:
- Share tips and shortcuts
- Make dev environments more similar, to make pairing easier
- Make setting up the dev environment from scratch more straightforward
- Get them (dotfiles) under version-control

As a result they are opinionated (macOS running Big Sur is assumed) - remove anything you don't want installed before running any of these scripts, if you have opinions!

To get a working dev environment, first run these files in sequence:
`install/brew.sh`
`install/brew-cask.sh`
Navigate into a git repo (or initialise one), and then run
`install/git-install-config.sh`

Then manually download and install the items in `install/manual-installs.md`

Move the `dotfiles` folder to your home directory, so it lives at `~/dotfiles`

Add these to the end of your `.zshrc` file:
`. ~/dotfiles/.zsh/config.sh`
`. ~/dotfiles/.zsh/aliases.sh`
`. ~/dotfiles/.zsh/scripts.sh`
`. ~/dotfiles/.zsh/init.sh`

Check to make sure you aren't going to overwrite (clobber) anything, then add symlinks as follows:
`ln -s dotfiles/.hushlogin .hushlogin`
`ln -s dotfiles/.irbrc .irbrc`
`ln -s dotfiles/.pryrc .pryrc`
`ln -s dotfiles/.gitignore_global .gitignore_global`

Now you're done! Welcome 😉