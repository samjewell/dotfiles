#!/bin/bash
############################
# Inspired by https://github.com/webpro/dotfiles

# Install package
brew install dockutil

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/SourceTree.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Valentina Studio.app"

# Sam's dock items
dockutil --no-restart --add "/Applications/Wunderlist.app"
dockutil --no-restart --add "/Applications/Microsoft Office 2011/Microsoft PowerPoint.app"
dockutil --no-restart --add "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
# end Sam's dock items

dockutil --no-restart --add '/Applications' --view grid --display folder
dockutil --no-restart --add '~/Downloads' --view fan --display stack

killall Dock