#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.bash_alias
# Aliases sourced into individual per-interactive-shell startup file
########################################

########################################
####     ALIAS
########################################

#### OS ALIASES ####
alias ll='ls -lGh $@'
alias p4='ping 4.2.2.2'
source ~/.dotfiles/private/*repos*.sh
alias repofresh='~/.dotfiles/script/refresh_repos.sh'
alias resource='source ~/.bash_profile'

#### GIT ALIASES ####
alias gs='git status'
alias gsd='echo; git status; echo; echo; date; echo'
alias gbc="git status | awk '{print \$3}' | head -n 1 | pbcopy"
alias gboth='git checkout master && git pull origin master && git checkout develop && git pull origin develop'

#### APP ALIASES ####
alias veracrypt='/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt --text'
