#!/bin/bash

# Set up symlink using GNU Stow
stow --dotfiles dot-zshrc
stow --target ~/.config --ignore 'dot-zshrc' .
