#!/bin/zsh

# vim
rm -f ~/.vim
ln -sf "$(pwd)/.vim" ~/
echo "Set up vim complete"

# zsh
rm ~/.zshrc
ln -sf "$(pwd)/zsh/.zshrc" ~/.zshrc
echo "Set up zsh complete"
