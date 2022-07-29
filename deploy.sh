#!/bin/bash

BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

# Validation
if [ "$(uname)" != "Darwin" ] ; then
  echo "$RED [ERROR] Only install possible on os x $NC"
  exit 1
fi

# Install Zinit (See https://github.com/zdharma-continuum/zinit)
echo "$BLUE [INFO] Install Zinit $NC"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# Install HomeBrew (See https://brew.sh/)
echo "$BLUE [INFO] Install HomeBrew $NC"
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# link dotfiles
WORK_DIR="$(cd "$(dirname "$0")" && pwd )"
echo "$BLUE [INFO] Link dotfiles $NC"
for dotfile in "$WORK_DIR"/.??* ; do
  [ "$dotfile" = "$WORK_DIR"/.idea ] && continue
  [ "$dotfile" = "$WORK_DIR"/.git ] && continue
  [ "$dotfile" = "$WORK_DIR"/.github ] && continue
  [ "$dotfile" = "$WORK_DIR"/READ ] && continue

  ln -fnsv "$dotfile" "$HOME"
done

echo "$BLUE [INFO] Installation done. Run source .zshrc $NC"
