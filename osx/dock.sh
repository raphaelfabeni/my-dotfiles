#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Mail.app"
dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Utilities/Console.app"

killall Dock
