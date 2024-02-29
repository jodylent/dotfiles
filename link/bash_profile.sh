#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/link/bash_profile.sh
#
# See https://scinart.github.io/linux/2014/05/01/linux-shell-note.html
# TL;DR:
# - For bash, put stuff in ~/.bashrc, and make ~/.bash_profile source it.
# - For zsh, put stuff in ~/.zshrc, which is always executed.
########################################

# if running bash
if [ -n "${BASH_VERSION}" ]; then
    # include .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
    fi
fi
. "$HOME/.cargo/env"
