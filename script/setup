#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/setup/install.sh
#
# Clone https://github.com/jodylent/dotfiles/ to ~/.dotfiles
# Run this script to symlink the appropriate files into ~/
########################################

function symlink_dirs() {
    SOURCE_DIR=$1
    TARGET_DIR=$2
    FILES_TO_LINK=`ls ${SOURCE_DIR}`
    for REAL_FILE in ${FILES_TO_LINK}; do
        # Get name, not name.sh
        filename="${REAL_FILE%.*}"
        echo "linking  ${SOURCE_DIR}/${REAL_FILE} to ${TARGET_DIR}/.${filename}"
        # Move existing to backup
        [ -f ~/.${filename} ] && mv ~/.${filename} ~/.dotfiles/backup/${filename}
        # Link it
        ln -sf ${SOURCE_DIR}/${REAL_FILE} ${TARGET_DIR}/.${filename}
    done
}

mkdir -p ~/.dotfiles/backup
mkdir -p ~/.dotfiles/private/{personal,work}

symlink_dirs ~/.dotfiles/link ~
symlink_dirs ~/Dropbox/scripts/private_dotfiles/personal ~/.dotfiles/private/personal
symlink_dirs ~/Dropbox/scripts/private_dotfiles/grubhub ~/.dotfiles/private/work

git config --global url.ssh://git@github.com/.insteadOf https://github.com/
