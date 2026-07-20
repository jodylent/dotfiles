########################################
# Jody Lent
# ~/.dotfiles/link/shrc.sh
# The individual per-interactive-shell startup file
#
# See https://scinart.github.io/linux/2014/05/01/linux-shell-note.html
# TL;DR:
# - For bash, put stuff in ~/.bashrc, and make ~/.bash_profile source it.
# - For zsh, put stuff in ~/.zshrc, which is always executed.
#
# JL 2026-06-30: only use this file for linking in private dotfiles.
# It's been years since I cared about bash, everything else -> zshrc
#
########################################

########################################
####     ALIAS
########################################


# Alias definitions.
if [ -f "${HOME}/.alias" ]; then
    . "${HOME}/.alias"
fi

# Private aliases, expecting multiple files and folders
if [ -d "${HOME}/.dotfiles/private" ]; then

    PRIVATE_FOLDERS=$(ls -p "${HOME}/.dotfiles/private" | grep -e "/$")

    # Loop folders
    for FOLDER in ${PRIVATE_FOLDERS}; do

        unset PRIVATE_DOTFILES
        PRIVATE_DOTFILES=$(ls -pf "${HOME}/.dotfiles/private/${FOLDER%?}" | grep -v "/")

        # Loop files in folder
        for DOTFILE in ${PRIVATE_DOTFILES}; do
            . "${HOME}/.dotfiles/private/${FOLDER%?}/${DOTFILE}"
        done

        # echo "FOLDER: $FOLDER"
    done
fi
