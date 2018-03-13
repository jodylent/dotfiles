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

function snek () {
    python -c "import re
_underscorer1 = re.compile(r'(.)([A-Z][a-z]+)')
_underscorer2 = re.compile('([a-z0-9])([A-Z])')
subbed = _underscorer1.sub(r'\1_\2', '$1')
print(_underscorer2.sub(r'\1_\2', subbed).lower())"
}

# Stupid Homebrew 1.3.2
# cp /usr/local/bin/python2 /usr/local/bin/python
# cp /usr/local/bin/pip2 /usr/local/bin/pip
# unalias python
# unalias pip

#### GIT ALIASES ####
alias gs='git status'
alias gsd='echo; git branch; echo; git status; echo; git log -1; echo; echo "CURRENT TIME: `date`"; echo'
alias gbc="git status | awk '{print \$3}' | head -n 1 | pbcopy"
alias gbranches='echo; for REPO in `ls ${REPODIR}`; do unset BRANCH_CNT; BRANCH_CNT=`git -C ${REPODIR}/${REPO} branch 2>/dev/null | wc -l | tr -d '[:space:]'`; if [[ ${BRANCH_CNT} != "1" ]] && [[ ${BRANCH_CNT} != "0" ]] ; then echo "${REPO}" | tr [:lower:] [:upper:]; git -C ${REPODIR}/${REPO} branch; echo; fi; done'
alias fthisbranch='gbc && git checkout master && git pull && git branch -d $(pbpaste)'
alias reupstream='gbc && git branch --set-upstream-to=origin/$(pbpaste) $(pbpaste)'

#### APP ALIASES ####
alias pep8='pep8 --max-line-length=240'
alias subldot='/usr/local/bin/subl --project ~/Dropbox/scripts/sync/sublime/dotfiles.sublime-project'
function spj(){
    PROJ_PATH=~/Dropbox/scripts/sync/sublime/
    PROJ=$1
    if [[ "${PROJ}" == "" ]]; then
        PROJ=$(basename `pwd`)
    fi
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
