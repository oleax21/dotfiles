#!/bin/sh

set -e

stow_path=~/dotfiles/packages

# Homebrew Install
if [ ! -f /usr/local/bin/brew ]; then
  cd ~
  echo "******************** Installing Homebrew... ********************"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "******************** Homebrew is already installed ********************"
fi

# dotfile Install
if [ ! -d ~/dotfiles ]; then
  cd ~
  echo "******************** Cloning My dotfiles... ********************"
  git clone git@github.com:oleax21/dotfiles.git
else
  echo "******************** dotfiles is already ********************"
fi

# Install Apps&CLIs with Brewfile
echo "******************** Installing Apps&CLIs with Brewfile ********************"
brew bundle -v --file "~/dotfiles/Brewfile"

# Add Symlink
echo "******************** Ensure directory ********************"
if [ ! -d ~/.config ]; then
  echo "******************** Make a .config ********************"
  mkdir -p .config
fi

stow -v -d ~/dotfiles/packages -t ~ $(ls $stow_path)
