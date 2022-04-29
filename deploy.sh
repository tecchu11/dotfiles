#!/bin/bash

BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

# Validation
if [ "$(uname)" != "Darwin" ] ; then
  echo -e "$RED Only install possible on os x $NC \n"
  exit 1
fi

# Install Zinit (See https://github.com/zdharma-continuum/zinit)
echo -e "$BLUE Install Zinit $NC \n"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# Install HomeBrew (See https://brew.sh/)
echo -e "$BLUE Install HomeBrew $NC \n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# link dotfiles
WORK_DIR="$(cd "$(dirname "$0")" && pwd )"
echo -e "$BLUE Link dotfiles $NC \n"
for dotfile in "$WORK_DIR"/.??* ; do
  [ "$dotfile" = "$WORK_DIR"/.idea ] && continue
  [ "$dotfile" = "$WORK_DIR"/.git ] && continue
  [ "$dotfile" = "$WORK_DIR"/.github ] && continue

  ln -fnsv "$dotfile" "$HOME"
done

echo -e "$BLUE Installation done \n Run source .zshrc $NC"
