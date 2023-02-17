########################################
# Jody Lent
# Script for building a new Mac

# Settings stolen from:
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/lra/mackup/tree/master/doc
########################################

echo "#### APP SETTINGS BEGINNING #####"


# BRAVE -- enable "Warn Before Quitting"


####################
# Python
####################

pyenv install 3.8.16
pyenv install 3.9
pyenv install 3.10
pyenv install 3.11


####################
# Login items
####################

# Add items (commented but left for future use)
# osascript -e 'tell application "System Events" to make login item at end with properties {path:"/path/to/itemname", hidden:false}'
# Delete items (commented but left for future use)
# osascript -e 'tell application "System Events" to delete login item "itemname"'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Dropbox.app", hidden:false}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Flux.app", hidden:false}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Karabiner-Elements", hidden:false}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/KeepingYouAwake.app", hidden:false}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Spectacle", hidden:false}'


####################
# Karabiner-Elements
####################

# macos 13.2 -- SIP & friends have wrecked most of these ~/.config hacks
# Try importing manually from ~/Dropbox/scripts/sync/karabiner/karabiner.json
# Otherwise, hand map:
# caps_lock       -> left_control
# application     -> right_option
# left_command    -> left_option
# left_option     -> left_command
# right_option    -> right_command

####################
# Spectacle
####################

# macos 13.2 -- SIP & friends have wrecked most of these ~/.config hacks

# test/ensure windows move as expected
# 2023: had to adjust prev/next window directions

####################
# SublimeText
####################

# https://packagecontrol.io/docs/syncing

SUBLIME_SETTINGS_PATH="${HOME}/Dropbox/sublime/User"
killall "Sublime Text"
cd "${HOME}/Library/Application Support/Sublime Text/Packages/"
rm -r "./User"
ln -s "${SUBLIME_SETTINGS_PATH}"

# subl command comes in Brew these days

####################
# Cleanup
####################
git -C "${HOME}/.dotfiles" remote set-url origin git@github.com:jodylent/dotfiles.git

echo "#### APP SETTINGS COMPLETE #####"
