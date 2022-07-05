#!/bin/zsh

# vim
rm -f ~/.vim
ln -sf "$(pwd)/.vim" ~/
echo "Set up vim complete"

# zsh
rm ~/.zshrc
ln -sf "$(pwd)/zsh/.zshrc" ~/.zshrc
echo "Set up zsh complete"

rm ~/.oh-my-zsh/themes/aboyce.zsh-theme 
ln -sf "$(pwd)/zsh/themes/aboyce.zsh-theme" ~/.oh-my-zsh/themes/aboyce.zsh-theme
echo "Copied oh-my-zsh themes"
