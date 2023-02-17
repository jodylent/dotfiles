########################################
# Jody Lent
# ~/.dotfiles/link/shrc.sh
# The individual per-interactive-shell startup file
#
# See https://scinart.github.io/linux/2014/05/01/linux-shell-note.html
# TL;DR:
# - For bash, put stuff in ~/.bashrc, and make ~/.bash_profile source it.
# - For zsh, put stuff in ~/.zshrc, which is always executed.
########################################

########################################
####     ENV
########################################
export EDITOR='subl -w'
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1
export HISTTIMEFORMAT="%D %T "
export REPODIR="${HOME}/dev"

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
# Handle Homebrew: Refusing to link macOS provided/shadowed software: curl
export PATH="/usr/local/opt/curl/bin:$PATH"

eval $($(which brew) shellenv)

# Add pyenv executable to PATH and
# enable shims by adding the following
# to ~/.profile and ~/.zprofile:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


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
