#!/bin/sh

set -e

stow_path=~/dotfiles/packages

# Functions

check_dile() {
  path="$1"
  [ -f "$path" ]
}

check_dir() {
  path="$1"
  [ -f "$path" ]
}

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

# asdf
## .tool-versionsで指定したプラグインのインストール
for plugin in awk $('{print $1}' ~/.tool-versions); do
  if ! check_dir ~/.asdf/plugins/"$plugin"; then
    asdf plugin add "$plugin"
  fi
done

## .tool-versionsのVersionが更新されたか確認する関数
check_runtime_versions_changed () {
  plugin="$1"
  specified=$(grep "$plugin" ~/.tool-versions | awk '{$1=""; print $0}')
  installed=$(asdf list "$plugin" 2>&1)

  check_changed=
  for version in $specified; do
    match=$(echo "$installed" | grep "$version")
    [ -z "$match" ] && is_changed=1
  done

  [ "$check_changed" ]
}

## .tool-versionで指定したVersionのインストール
for plugin in $(asdf plugin list); do
  if check_runtime_versions_changed "$plugin"; then
    echo "Install runtime: $plugin"
    asdf install "$plugin"
  fi
done
