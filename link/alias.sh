#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/link/alias.sh
# Aliases sourced into individual per-interactive-shell startup file
########################################

########################################
####     ALIAS
########################################

#### OS ALIASES ####
alias ll="ls -lGh $@"
alias p4="ping 4.2.2.2"
# Addressed in shrc.sh, as this doesn't load properly
# source ~/.dotfiles/private/*repos*.sh
alias repofresh='~/.dotfiles/script/refresh_repos.sh'
alias resource='source ~/.zshrc'
# alias resource='source ~/.bash_profile'

# function enable_ntfs() {
#     VOLUME_NAME=$1
#     VOLUME_UUID=`diskutil info \`diskutil list|grep -e "${VOLUME_NAME}"|awk '{print $NF}'\`|grep UUID|awk '{print $NF}'`
#     FSTAB_STR="UUID=${VOLUME_UUID} none ntfs rw,auto,nobrowse"
#     sudo cat ${FSTAB_STR} > /etc/fstab
#     diskutil umount "${VOLUME_NAME}"
#     diskutil mount "${VOLUME_NAME}"
# }

# Stupid Homebrew 1.3.2
# cp /usr/local/bin/python2 /usr/local/bin/python
# cp /usr/local/bin/pip2 /usr/local/bin/pip
# unalias python
# unalias pip

#### GIT ALIASES ####
alias gs='git status'
alias gsd='echo; git --no-pager branch; echo; git status; echo; git --no-pager log -1; echo; echo "CURRENT TIME: `date`"; echo'
alias gbc="git status | awk '{print \$3}' | head -n 1 | pbcopy"
# alias gbranches='echo; for REPO in `ls ${REPODIR}`; do unset BRANCH_CNT; BRANCH_CNT=`git -C ${REPODIR}/${REPO} --no-pager branch 2>/dev/null | wc -l | tr -d '[:space:]'`; if [[ ${BRANCH_CNT} != "1" ]] && [[ ${BRANCH_CNT} != "0" ]] ; then echo "${REPO}" | tr [:lower:] [:upper:]; git -C ${REPODIR}/${REPO} --no-pager branch; echo; fi; done'
alias fthisbranch='gbc && git checkout master && git pull && git branch -d $(pbpaste)'

function remaster(){
    BRANCH=$(git status | awk '{print $3}' | head -n 1)
    git checkout master
    git pull --prune
    git checkout ${BRANCH}
    git rebase $1 master
}

alias reupstream='gbc && git branch --set-upstream-to=origin/$(pbpaste) $(pbpaste)'

function gbranches(){
    echo
    for REPO in $(ls ${REPODIR}); do
        BRANCH_CNT=$(git -C ${REPODIR}/${REPO} --no-pager branch 2>/dev/null | wc -l | tr -d '[:space:]')
        if [[ ${BRANCH_CNT} != "1" ]] && [[ ${BRANCH_CNT} != "0" ]] ; then
            echo "${REPO}" | tr '[a-z]' '[A-Z]' 2>/dev/null ;
            git -C ${REPODIR}/${REPO} --no-pager branch;
            echo;
        fi;
    done
}


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


#### VIRTUALENV HANDLING ####
# export WORKON_HOME=~/virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
