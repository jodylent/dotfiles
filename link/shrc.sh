########################################
# Jody Lent
# ~/.dotfiles/link/shrc.sh
# The individual per-interactive-shell startup file
########################################

########################################
####     ENV
########################################
export EDITOR='subl -w'
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1
export HISTTIMEFORMAT="%D %T "
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
# Handle Homebrew: Refusing to link macOS provided/shadowed software: curl
export PATH="/usr/local/opt/curl/bin:$PATH"
export REPODIR=~/dev

########################################
####     ALIAS
########################################

# Alias definitions.
if [ -f ~/.alias ]; then
    . ~/.alias
fi

# Private aliases, expecting multiple files and folders
if [ -d ~/.dotfiles/private ]; then
    # Loop folders
    PRIVATE_FOLDERS=`ls -p ~/.dotfiles/private | grep -e "/$"`
    for FOLDER in ${PRIVATE_FOLDERS}; do
        # # Loop files in folder
        unset PRIVATE_DOTFILES
        PRIVATE_DOTFILES=`ls -pf ~/.dotfiles/private/${FOLDER%?} | grep -v "/"`
        for DOTFILE in ${PRIVATE_DOTFILES}; do
            . ~/.dotfiles/private/${FOLDER%?}/${DOTFILE}
        done
        # echo "FOLDER: $FOLDER"
    done
fi
