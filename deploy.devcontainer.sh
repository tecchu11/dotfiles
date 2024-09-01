#!/bin/bash

BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

# Install Zinit (See https://github.com/zdharma-continuum/zinit)
echo "$BLUE [INFO] Install Zinit $NC"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# link dotfiles
WORK_DIR="$(cd "$(dirname "$0")" && pwd )"/devcontainer
echo "$BLUE [INFO] Link dotfiles on $WORK_DIR $NC"
for dotfile in "$WORK_DIR"/.??* ; do
  [ "$dotfile" = "$WORK_DIR"/postCreateCommand.sh ] && continue
  [ "$dotfile" = "$WORK_DIR"/devcontainer.json ] && continue
  ln -fnsv "$dotfile" "$HOME"
done
echo "$BLUE [INFO] Locate dotfiles $NC"

/bin/zsh -c "$(source $HOME/.zshrc)"

echo "$BLUE [INFO] Install Done. Please run source ~/.zshrc $NC"