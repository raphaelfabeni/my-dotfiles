apps=(
    appcleaner
    caffeine
    cloudup
    dropbox
    evernote
    filezilla
    firefox
    google-chrome
    opera
    screenflow
    skype
    slack
    spectacle
    spotify
    sublime-text3
    tweetdeck
    virtualbox
    vlc
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql suspicious-package && qlmanage -r
