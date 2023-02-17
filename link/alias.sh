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


#### GIT ALIASES ####
alias gs='git status'
alias gsd='echo; git --no-pager branch; echo; git status; echo; git --no-pager log -1; echo; echo "CURRENT TIME: `date`"; echo'
alias gbc="git status | awk '{print \$3}' | head -n 1 | pbcopy"
alias fthisbranch='gbc && git checkout master && git pull && git branch -D $(pbpaste)'
alias vader="git push --force --no-verify"

# Duplicating network view without needing a UI
# git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all

function remaster(){
    BRANCH=$(git status | awk '{print $3}' | head -n 1)
    git checkout master
    git pull --prune
    git checkout "${BRANCH}"
    git rebase $1 master
}

alias reupstream='gbc && git branch --set-upstream-to=origin/$(pbpaste) $(pbpaste)'

function gbranches(){
    echo
    for REPO in $(ls "${REPODIR}"); do
        BRANCH_CNT=$(git -C "${REPODIR}/${REPO}" --no-pager branch 2>/dev/null | wc -l | tr -d '[:space:]')
        if [[ "${BRANCH_CNT}" != "1" ]] && [[ "${BRANCH_CNT}" != "0" ]] ; then
            echo "${REPO}" | tr '[a-z]' '[A-Z]' 2>/dev/null ;
            git -C "${REPODIR}/${REPO}" --no-pager branch;
            echo;
        fi;
    done
}
alias gbr=gbranches


#### APP ALIASES ####
function dockerlogfile (){
    docker inspect --format='{{.LogPath}}' $1
}

function spj(){
    PROJ_PATH="${HOME}/Dropbox/sublime/User/projects/"
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


#### VIRTUALENV HANDLING ####
# export WORKON_HOME=~/virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
