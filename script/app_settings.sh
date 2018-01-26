#!/usr/bin/env bash
########################################
# Jody Lent
# Script for building a new Mac

# Settings stolen from:
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/lra/mackup/tree/master/doc
########################################

echo "#### APP SETTINGS BEGINNING #####"


####################
# Python
####################
# Stupid Homebrew 1.3.2
cp /usr/local/bin/python2 /usr/local/bin/python
cp /usr/local/bin/pip2 /usr/local/bin/pip


####################
# Login items
####################

osascript -e 'tell application "System Events" to make login item at end with properties {path:"/path/to/itemname", hidden:false}' > ~/.dotfiles/backup/list_loginitems.txt
# Add items (commented but left for future use)
# osascript -e 'tell application "System Events" to make login item at end with properties {path:"/path/to/itemname", hidden:false}'
# Delete items (commented but left for future use)
# osascript -e 'tell application "System Events" to delete login item "itemname"'

osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/BeardedSpice.app", hidden:false}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Caffeine.app", hidden:false}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Dropbox.app", hidden:false}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Flux.app", hidden:false}'


####################
# Karabiner
####################

# Copy Karabiner settings


####################
# Karabiner-Elements
####################

# Karabiner only works on mac OS 10.9-11, not on Sierra yet, so we use the beta/non-pretty dev product
# https://pqrs.org/osx/karabiner/
killall Karabiner-Elements
mkdir -p ~/.config/karabiner
rm -f  ~/.config/karabiner/karabiner.json
ln -sf ~/Dropbox/scripts/sync/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Karabiner-Elements", hidden:false}'


####################
# MacID
####################

defaults write com.kanechesire.MacIDOSX MIDGlobalLockScreenShortcut    -data 62706c6973743030d40102030405061617582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a307080f55246e756c6cd3090a0b0c0d0e574b6579436f64655624636c6173735d4d6f646966696572466c616773102580021200100000d2101112135a24636c6173736e616d655824636c61737365735b4d415353686f7274637574a214155b4d415353686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d1181954726f6f74800108111a232d32373b414850576567696e737e879396a2abbdc0c50000000000000101000000000000001a000000000000000000000000000000c7
defaults write com.kanechesire.MacIDOSX MIDGlobalSendClipboardShortcut -data 62706c6973743030d40102030405061617582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a307080f55246e756c6cd3090a0b0c0d0e574b6579436f64655624636c6173735d4d6f646966696572466c6167731009800212001c0000d2101112135a24636c6173736e616d655824636c61737365735b4d415353686f7274637574a214155b4d415353686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d1181954726f6f74800108111a232d32373b414850576567696e737e879396a2abbdc0c50000000000000101000000000000001a000000000000000000000000000000c7
defaults write com.kanechesire.MacIDOSX SUHasLaunchedBefore -bool true

osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MacID.app", hidden:false}'


####################
# Spectacle
####################

killall Spectacle
rm -f ~/Library/Application\ Support/Spectacle/Shortcuts.json
ln -sf  ~/Dropbox/scripts/sync/spectacle/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

defaults write com.divisiblebyzero.Spectacle SUEnableAutomaticChecks -bool true

osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Spectacle", hidden:false}'


####################
# SublimeText
####################

SUBLIME_SETTINGS_PATH=~/Dropbox/scripts/sync/sublime
killall Sublime\ Text

# Install Sublime Text settings
if [ -z ${SUBLIME_SETTINGS_PATH+x} ]; then
    echo "SUBLIME_SETTINGS_PATH is unset"
    exit 0
else
    # Packages and settings live in:
    # ~/Library/Application\ Support/Sublime\ Text*/Packages/{,User}
    echo "SUBLIME_SETTINGS_PATH is set to '$SUBLIME_SETTINGS_PATH'"
    if [ -d ${SUBLIME_SETTINGS_PATH} ]; then
        rm -r ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
        ln -sf ${SUBLIME_SETTINGS_PATH}/Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
    else
        echo "SUBLIME_SETTINGS_PATH is set but does not exist."
        exit 1
    fi
fi

# Symlink `subl` into /usr/local/bin
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl


########################################
# Install from Mac App Store via `mas`
# 1053031090 Boxy (1.2.1)
# 1055307502 2STP Companion (2.0.0)
########################################
mas install 1053031090
mas install 1055307502
mas upgrade

####################
# Cleanup
####################
git -C /Users/jlent/.dotfiles remote set-url origin git@github.com:jodylent/dotfiles.git
echo "#### APP SETTINGS COMPLETE #####"
