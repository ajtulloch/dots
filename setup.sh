for pkg in git matplotlib tmux zsh; do
    stow -t ~ $pkg
done
