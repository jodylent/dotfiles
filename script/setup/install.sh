#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/setup/install.sh
#
# Clone https://github.com/jodylent/dotfiles/ to ~/.dotfiles
# Run this script to symlink the appropriate files into ~/
########################################

mkdir -p ~/.dotfiles/backup

FILES_TO_LINK=`ls ~/.dotfiles/link`
for REAL_FILE in ${FILES_TO_LINK}; do
    # Get name, not name.sh
    filename="${REAL_FILE%.*}"
    echo "linking  ~/.dotfiles/link/${REAL_FILE} to ~/.${filename}"
    # Move existing to backup
    [ -f ~/.${filename} ] && mv ~/.${filename} ~/.dotfiles/backup/${filename}
    # Link it
    ln -sf ~/.dotfiles/link/${REAL_FILE} ~/.${filename}
done