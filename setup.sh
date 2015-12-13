#! /bin/bash
set -x
set -e

for pkg in git matplotlib tmux zsh spacemacs; do
    stow -t ~ $pkg
done
