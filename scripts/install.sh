#!/bin/sh

set -e

MYGIT_CLONE_PATH=~/dev/ghq/github-oleax21/oleax21
DOTFILES_PACKAGES_PATH="$MYGIT_CLONE_PATH"/dotfiles/packages

# Functions
is_file() {
  path="$1"
  [ -f "$path" ]
}

is_dir() {
  path="$1"
  [ -d "$path" ]
}

unlink_packages=
for i in "$@"; do
  case "$i" in
    -s|--skip)
      skip=1
      shift ;;
    -u=*|--unlink=*)
      unlink_packages="${i#*=}"
      shift ;;
    *) ;;
  esac
done

# unsymlink
if [ -n "$unlink_packages" ]; then
  echo "******************** Unlinking dotfiles... ********************"
  stow -vD -d "$DOTFILES_PACKAGES_PATH" -t ~ "$unlink_packages"
  exit
fi

# Homebrew Install
if ! is_file /usr/local/bin/brew; then
  cd ~
  echo "******************** Installing Homebrew... ********************"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "*** Homebrew is already installed ***"
fi

# dotfile Install
if ! is_dir "$MYGIT_CLONE_PATH"/dotfiles; then
  cd $MYGIT_CLONE_PATH
  echo "******************** Cloning My dotfiles... ********************"
  git clone git@github.com:oleax21/dotfiles.git
else
  echo "*** dotfiles is already installed ***"
fi

# Install Apps&CLIs with Brewfile
if [ ! "$skip" ]; then
  echo "******************** Installing Apps&CLIs with Brewfile... ********************"
  cd ~
  brew bundle -v --file "$MYGIT_CLONE_PATH"/dotfiles/Brewfile
fi

# Add Symlink
echo "*** Check directory ***"
if ! is_dir ~/.config; then
  echo "*** Make a .config ***"
  mkdir -p .config
fi

if ! is_dir ~/dev; then
  echo "*** Make a dev ***"
  mkdir -p dev
fi

stow -vd "$DOTFILES_PACKAGES_PATH" -t ~ $(ls $DOTFILES_PACKAGES_PATH)

# asdf
## .tool-versionsで指定したプラグインのインストール
for plugin in $(awk '{print $1}' ~/.tool-versions); do
  if ! is_dir ~/.asdf/plugins/"$plugin"; then
    asdf plugin add "$plugin"
  fi
done

## .tool-versionsのVersionが更新されたか確認する関数
is_runtime_versions_changed () {
  plugin="$1"
  specified=$(grep "$plugin" ~/.tool-versions | awk '{$1=""; print $0}')
  installed=$(asdf list "$plugin" 2>&1)

  is_changed=
  for version in $specified; do
    match=$(echo "$installed" | grep "$version")
    [ -z "$match" ] && is_changed=1
  done

  [ "$is_changed" ]
}

## .tool-versionで指定したVersionのインストール
for plugin in $(asdf plugin list); do
  if is_runtime_versions_changed "$plugin"; then
    echo "Install runtime: $plugin"
    asdf install "$plugin"
  fi
done
