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

# JL: do NOT run this trash, it massively slows down PROMPT
# Kiro CLI pre block. Keep at the top of this file.
# [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash"

export CLAUDE_AUTO_INIT=false

# if running bash
if [ -n "${BASH_VERSION}" ]; then
    # include .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
    fi
fi
. "$HOME/.cargo/env"

# JL: do NOT run this trash, it massively slows down PROMPT
# Kiro CLI post block. Keep at the bottom of this file.
# [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash"
