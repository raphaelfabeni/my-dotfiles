#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Mail.app"
dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Notes.app"
dockutil --no-restart --add "~/Applications/Dropbox.app"
dockutil --no-restart --add "~/Applications/Evernote.app"
dockutil --no-restart --add "~/Applications/Filezilla.app"
dockutil --no-restart --add "~/Applications/Firefox.app"
dockutil --no-restart --add "~/Applications/Google Chrome.app"
dockutil --no-restart --add "~/Applications/Spotify.app"
dockutil --no-restart --add "~/Applications/Sublime Text.app"

killall Dock
