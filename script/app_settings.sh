#!/usr/bin/env bash
########################################
# Jody Lent
# Script for building a new Mac

# Settings stolen from:
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/lra/mackup/tree/master/doc
########################################


####################
# Karabiner
####################

# Copy Karabiner settings
# I only have one setting. For large files use:
#   export: `/Applications/Karabiner.app/Contents/Library/bin/karabiner export > karabiner-import.sh`
#   import: `bash ${STRAPDIR}/karabiner-import.sh`
/Applications/Karabiner.app/Contents/Library/bin/karabiner set remap.pc_application2optionR 1


####################
# Karabiner-Elements
####################

# Karabiner only works on mac OS 10.9-11, not on Sierra yet, so we use the beta/non-pretty dev product
# https://pqrs.org/osx/karabiner/
mkdir -p ~/.karabiner.d/configuration
cat > ~/.karabiner.d/configuration/karabiner.json << EOF
{
    "profiles": [
        {
            "name": "MS_ComfortCurve4000",
            "selected": true,
            "simple_modifications": {
                "caps_lock": "left_control",
                "left_option": "left_command",
                "left_command": "left_option",
                "right_option": "right_command",
                "application" : "right_option"
            }
        }
    ]
}
EOF
curl https://pqrs.org/latest/karabiner-elements-latest.dmg /tmp/
open /tmp/Karabiner-Elements*dmg
# Installs to:
# /Applications/Karabiner-Elements.app/Contents/MacOS/Karabiner-Elements

####################
# Spectacle
####################

# defaults write com.divisiblebyzero.Spectacle THING -data bighexstring
# pull your existing with the following:
# defaults read com.divisiblebyzero.Spectacle|
# sed -e "s/ \= \</\@\@\@\-data\@\@\@/g"|
# sed -e "s/^    /\@\@\@/g"|
# sed -e "s/[ |\>\;|^{]//g"|
# sed -e "s/\@\@\@/ /g"|
# sed -e "s/^ /defaults write com.divisiblebyzero.Spectacle /g"|pbcopy
# YOU MAY NOT WANT IT ALL

defaults write com.divisiblebyzero.Spectacle MakeLarger -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111a008002107c80035a4d616b654c6172676572d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70727d828d96aaadc1cadcdfe40000000000000101000000000000001d000000000000000000000000000000e6
defaults write com.divisiblebyzero.Spectacle MakeSmaller -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111a008002107b80035b4d616b65536d616c6c6572d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70727e838e97abaec2cbdde0e50000000000000101000000000000001d000000000000000000000000000000e7
defaults write com.divisiblebyzero.Spectacle MoveToBottomHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002107d80035f10104d6f7665546f426f74746f6d48616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072858a959eb2b5c9d2e4e7ec0000000000000101000000000000001d000000000000000000000000000000ee
defaults write com.divisiblebyzero.Spectacle MoveToCenter -data 62706c6973743030d40102030405061819582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708101155246e756c6cd4090a0b0c0d0e0d0f596d6f64696669657273546e616d65576b6579436f64655624636c6173731000800280035c4d6f7665546f43656e746572d2121314155a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a216175f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11a1b54726f6f74800108111a232d32373c424b555a62696b6d6f7c818c95a9acc0c9dbdee30000000000000101000000000000001c000000000000000000000000000000e5
defaults write com.divisiblebyzero.Spectacle MoveToFullscreen -data 62706c6973743030d40102030405061819582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708101155246e756c6cd4090a0b0c0d0e0d0f596d6f64696669657273546e616d65576b6579436f64655624636c6173731000800280035f10104d6f7665546f46756c6c73637265656ed2121314155a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a216175f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11a1b54726f6f74800108111a232d32373c424b555a62696b6d6f8287929bafb2c6cfe1e4e90000000000000101000000000000001c000000000000000000000000000000eb
defaults write com.divisiblebyzero.Spectacle MoveToLeftHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002107b80035e4d6f7665546f4c65667448616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728186919aaeb1c5cee0e3e80000000000000101000000000000001d000000000000000000000000000000ea
defaults write com.divisiblebyzero.Spectacle MoveToLowerLeft -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731113008002107b80035f100f4d6f7665546f4c6f7765724c656674d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728489949db1b4c8d1e3e6eb0000000000000101000000000000001d000000000000000000000000000000ed
defaults write com.divisiblebyzero.Spectacle MoveToLowerRight -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731113008002107c80035f10104d6f7665546f4c6f7765725269676874d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072858a959eb2b5c9d2e4e7ec0000000000000101000000000000001d000000000000000000000000000000ee
defaults write com.divisiblebyzero.Spectacle MoveToNextDisplay -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731119008002107b80035f10114d6f7665546f4e657874446973706c6179d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072868b969fb3b6cad3e5e8ed0000000000000101000000000000001d000000000000000000000000000000ef
defaults write com.divisiblebyzero.Spectacle MoveToNextThird -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731118008002107c80035f100f4d6f7665546f4e6578745468697264d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728489949db1b4c8d1e3e6eb0000000000000101000000000000001d000000000000000000000000000000ed
defaults write com.divisiblebyzero.Spectacle MoveToPreviousDisplay -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731119008002107c80035f10154d6f7665546f50726576696f7573446973706c6179d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728a8f9aa3b7baced7e9ecf10000000000000101000000000000001d000000000000000000000000000000f3
defaults write com.divisiblebyzero.Spectacle MoveToPreviousThird -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731118008002107b80035f10134d6f7665546f50726576696f75735468697264d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072888d98a1b5b8ccd5e7eaef0000000000000101000000000000001d000000000000000000000000000000f1
defaults write com.divisiblebyzero.Spectacle MoveToRightHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002107c80035f100f4d6f7665546f526967687448616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728489949db1b4c8d1e3e6eb0000000000000101000000000000001d000000000000000000000000000000ed
defaults write com.divisiblebyzero.Spectacle MoveToTopHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002107e80035d4d6f7665546f546f7048616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e707280859099adb0c4cddfe2e70000000000000101000000000000001d000000000000000000000000000000e9
defaults write com.divisiblebyzero.Spectacle MoveToUpperLeft -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731111008002107b80035f100f4d6f7665546f55707065724c656674d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728489949db1b4c8d1e3e6eb0000000000000101000000000000001d000000000000000000000000000000ed
defaults write com.divisiblebyzero.Spectacle MoveToUpperRight -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731111008002107c80035f10104d6f7665546f55707065725269676874d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072858a959eb2b5c9d2e4e7ec0000000000000101000000000000001d000000000000000000000000000000ee
defaults write com.divisiblebyzero.Spectacle RedoLastMove -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373110b008002100680035c5265646f4c6173744d6f7665d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70727f848f98acafc3ccdee1e60000000000000101000000000000001d000000000000000000000000000000e8
defaults write com.divisiblebyzero.Spectacle SUEnableAutomaticChecks=1
defaults write com.divisiblebyzero.Spectacle UndoLastMove -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002100680035c556e646f4c6173744d6f7665d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70727f848f98acafc3ccdee1e60000000000000101000000000000001d000000000000000000000000000000e8


####################
# SublimeText
####################

# Install Sublime Text settings
if [ -z ${SUBLIME_SETTINGS_PATH+x} ]; then echo "SUBLIME_SETTINGS_PATH is unset"; exit 0; else echo "SUBLIME_SETTINGS_PATH is set to '$SUBLIME_SETTINGS_PATH'"; fi
cp ${SUBLIME_SETTINGS_PATH} ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null
