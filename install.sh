# vim

echo "Set up vim started"

ln -s "$(pwd)/.vim" ~/

echo "Set up vim complete"

# zsh

echo "Set up zsh started"

rm ~/.zshrc

ln -s "$(pwd)/zsh/.zshrc" ~/.zshrc

echo "Set up zsh complete"

