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
`. ~/dotfiles/.zsh/functions.sh`
`. ~/dotfiles/.zsh/init.sh`
`. ~/dotfiles/.zsh/path.sh` (must be last — mise should win over Volta/yarn/bun)

Check to make sure you aren't going to overwrite (clobber) anything, then add symlinks as follows:
`ln -s dotfiles/.hushlogin .hushlogin`
`ln -s dotfiles/.irbrc .irbrc`
`ln -s dotfiles/.pryrc .pryrc`
`ln -s dotfiles/.gitignore_global .gitignore_global`
`ln -s dotfiles/.npmrc .npmrc`
`ln -s dotfiles/.zshenv .zshenv`
`mkdir -p ~/Library/Preferences/pnpm && ln -s ~/dotfiles/pnpm/rc ~/Library/Preferences/pnpm/rc`

If you want Ghostty to pick up the colour scheme exported from iTerm, symlink the whole `ghostty` directory into `~/.config`:
`mkdir -p ~/.config && ln -s ~/dotfiles/ghostty ~/.config/ghostty`
The theme file lives at `ghostty/themes/sj-iterm-2026` and is activated by the single `theme = sj-iterm-2026` line in `ghostty/config`. Note that the colours are Display P3 values, so they require `window-colorspace = display-p3` (set in the theme) to render identically to iTerm — this is macOS-only.

Launch Sourcetree by right-clicking, and then choose "Open"
That way you can open it, even when Apple doesn't trust it.

Sync the settings for VSCode with my github account

Now you're done! Welcome 😉