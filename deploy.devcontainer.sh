#!/bin/bash

BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

# Install Zinit (See https://github.com/zdharma-continuum/zinit)
echo "$BLUE [INFO] Install Zinit $NC"
NO_INPUT=1 bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# link dotfiles
WORK_DIR="$(cd "$(dirname "$0")" && pwd )"/devcontainer
echo "$BLUE [INFO] Link dotfiles on $WORK_DIR $NC"
for dotfile in "$WORK_DIR"/.??* ; do
  ln -fnsv "$dotfile" "$HOME"
done
echo "$BLUE [INFO] Locate dotfiles $NC"

echo "$BLUE [INFO] Install Done. Please run source ~/.zshrc $NC"
