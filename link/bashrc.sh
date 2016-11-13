#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/link/bashrc.sh
# The individual per-interactive-shell startup file
########################################

########################################
####     BASHOPTS
########################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


########################################
####     ENV
########################################
export EDITOR='subl -w'
export HISTTIMEFORMAT="%D %T "
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
export REPODIR=~/dev

########################################
####     ALIAS
########################################

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_alias, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

# Private aliases, possibly more than one file
if [ -d ~/.dotfiles/private ]; then
    PRIVATE_DOTFILES=`ls -pf ~/.dotfiles/private/ | grep -v "/"`
    for DOTFILE in $PRIVATE_DOTFILES; do
        . ~/.dotfiles/private/${DOTFILE}
    done
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
