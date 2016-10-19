#!/bin/bash
############################
# Inspired by https://github.com/webpro/dotfiles

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/SourceTree.app"
dockutil --no-restart --add "/Applications/Sublime Text 3.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Valentina Studio.app"

dockutil --no-restart --add "/Applications/Wunderlist.app"
dockutil --no-restart --add "/Applications/Microsoft Office 2011/Microsoft PowerPoint.app"
dockutil --no-restart --add "/Applications/Keynote.app"
dockutil --no-restart --add "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

killall Dock