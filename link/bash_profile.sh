#!/usr/bin/env bash
########################################
# Jody Lent
# ~/.dotfiles/link/bash_profile.sh
# The personal initialization file, executed for login shells
########################################


########################################
####     SOURCE
########################################

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi