#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/link/bashrc.sh
#
# See https://scinart.github.io/linux/2014/05/01/linux-shell-note.html
# TL;DR:
# - For bash, put stuff in ~/.bashrc, and make ~/.bash_profile source it.
# - For zsh, put stuff in ~/.zshrc, which is always executed.
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
####     SOURCE
########################################

# include .shrc if it exists -- settings common to zsh + bash
if [ -f "${HOME}/.shrc" ]; then
. "${HOME}/.shrc"
fi
