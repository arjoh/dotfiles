#!/usr/bin/env zsh

DOTFILES=(
  .oh-my-zsh
  .oh-my-zsh-custom
  .zshrc
  .vim
  .vimrc
)

DOTFILES_DIR=$(/bin/readlink -f ${0%/*})
TIMESTAMP=$(date "+%C%y%m%d%H%M%S")

for dotfile in $DOTFILES; do
  if [[ -f "$HOME/$dotfile" || -d "$HOME/$dotfile" ]]; then
    mv $HOME/$dotfile $HOME/$dotfile.bak.$TIMESTAMP
  fi
  ln -sf $DOTFILES_DIR/$dotfile $HOME/$dotfile
done
