# Now install these manually:
- Arc browser
- ~~VSCode~~ Cursor:
   - Add the `code` and `cursor` symlinks to my path, as per https://code.visualstudio.com/docs/setup/mac
   - Add `export EDITOR='code -w'` to the .zshrc file
   - Add sublime-text keybindings (extension)
   - Log into my Github Account
- iterm2
   - Configure navigating and deleting whole words:
     https://medium.com/@jonnyhaynes/jump-forwards-backwards-and-delete-a-word-in-iterm2-on-mac-os-43821511f0a
- docker for mac:
   - the Apple M1 tech preview build at https://docs.docker.com/docker-for-mac/apple-m1/ 
- Set an unique name for each Mac, in Sys Prefs: Sharing
- Google Cloud SDK: cask or https://cloud.google.com/sdk/docs/install, then:
  - `gcloud auth login`
  - `gcloud auth application-default login`
  - `gcloud auth configure-docker`
- poetry - env manager for Python
  - Via Curl: `curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -`
- Extensions for Chrome?
  - Tree style tab
  - Octotree
  - Refined Github
- yarn: `npm install -g yarn` (once node 14 added to path)
- Set my work email for all commits inside my work folder, as per
   https://stackoverflow.com/questions/4220416/can-i-specify-multiple-users-for-myself-in-gitconfig
- Lastpass
   - Install the Safari/Chrome extension(s)
- GitHub CLI additional scope (interactive browser/device auth)
  - `gh auth refresh -h github.com -s workflow`
  - `gh auth status`


## Later
- nvm (why? see http://stackoverflow.com/a/24404451/1358187)
- node (via nvm)
- postgresapp
- sublime-text3
- oh-my-zsh

# for Sam
- keynote

# For capybara, you'll need these:
See the [notes here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)
- xcode
- qt5
