#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/link/bash_alias.sh
# Aliases sourced into individual per-interactive-shell startup file
########################################

########################################
####     ALIAS
########################################

#### OS ALIASES ####
alias ll='ls -lGh $@'
alias p4='ping 4.2.2.2'
# Addressed in bashrch.sh, as this doesn't load properly
# source ~/.dotfiles/private/*repos*.sh
alias repofresh='~/.dotfiles/script/refresh_repos.sh'
alias resource='source ~/.bash_profile'

function enable_ntfs() {
    VOLUME_NAME=$1
    VOLUME_UUID=`diskutil info \`diskutil list|grep -e "${VOLUME_NAME}"|awk '{print $NF}'\`|grep UUID|awk '{print $NF}'`
    FSTAB_STR="UUID=${VOLUME_UUID} none ntfs rw,auto,nobrowse"
    sudo cat ${FSTAB_STR} > /etc/fstab
    diskutil umount "${VOLUME_NAME}"
    diskutil mount "${VOLUME_NAME}"
}

#### GIT ALIASES ####
alias gs='git status'
alias gsd='echo; git branch; echo; git status; echo; git log -1; echo; echo "CURRENT TIME: `date`"; echo'
alias gbc="git status | awk '{print \$3}' | head -n 1 | pbcopy"
alias gboth='git checkout master && git pull origin master && git checkout develop && git pull origin develop'

#### APP ALIASES ####
alias pep8='pep8 --max-line-length=240'
alias subldot='/usr/local/bin/subl --project ~/Dropbox/scripts/sync/sublime/dotfiles.sublime-project'
function sublproj(){
    PROJ_PATH=~/Dropbox/scripts/sync/sublime/
    PROJ=$1
    if [[ -f ${PROJ_PATH}/${PROJ}.sublime-project ]]; then
        subl -n --project ${PROJ_PATH}/${PROJ}.sublime-project
    else
        echo "Project: '${PROJ}' does not exist in PROJ_PATH: '${PROJ_PATH}'"
        if [[ -d ${REPODIR}/${PROJ} ]]; then
            subl -n ${REPODIR}/${PROJ}
        else
            echo "Project: '${PROJ}' does not exist in REPODIR: '${REPODIR}'"
        fi
    fi
}
alias veracrypt='/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt --text'
