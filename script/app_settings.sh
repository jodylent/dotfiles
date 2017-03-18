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
mkdir -p ~/.config/karabiner
cat > ~/.config/karabiner/karabiner.json << EOF
{
    "global": {
        "check_for_updates_on_startup": true,
        "show_in_menu_bar": true,
        "show_profile_name_in_menu_bar": false
    },
    "profiles": [
        {
            "devices": [
                {
                    "disable_built_in_keyboard_if_exists": false,
                    "identifiers": {
                        "is_keyboard": true,
                        "is_pointing_device": false,
                        "product_id": 628,
                        "vendor_id": 1452
                    },
                    "ignore": true
                }
            ],
            "fn_function_keys": {
                "f1": "display_brightness_decrement",
                "f10": "mute",
                "f11": "volume_decrement",
                "f12": "volume_increment",
                "f2": "display_brightness_increment",
                "f3": "mission_control",
                "f4": "launchpad",
                "f5": "illumination_decrement",
                "f6": "illumination_increment",
                "f7": "rewind",
                "f8": "play_or_pause",
                "f9": "fastforward"
            },
            "name": "MSComfortCurve4000",
            "selected": true,
            "simple_modifications": {
                "application": "right_option",
                "caps_lock": "left_control",
                "left_command": "left_option",
                "left_option": "left_command",
                "right_option": "right_command"
            },
            "virtual_hid_keyboard": {
                "caps_lock_delay_milliseconds": 0,
                "keyboard_type": "ansi"
            }
        }
    ]
}
EOF
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
read -p "ICLOUD_USERNAME: " ICLOUD_USERNAME
read -p "ICLOUD_PASSWORD: " ICLOUD_PASSWORD

if [ -z ${ICLOUD_PASSWORD+x} ]; then
    echo "ICLOUD_PASSWORD is unset"
    exit 1
else
    mas signin ${ICLOUD_USERNAME} "${ICLOUD_PASSWORD}"
    unset ICLOUD_USERNAME ICLOUD_PASSWORD
    mas install 1053031090
    mas install 1055307502
    mas upgrade
fi

####################
# Cleanup
####################
git -C /Users/jlent/.dotfiles remote set-url origin git@github.com:jodylent/dotfiles.git
echo "#### APP SETTINGS COMPLETE #####"
