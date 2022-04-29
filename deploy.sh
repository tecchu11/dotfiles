#!/bin/bash

# Validation
if [ "$(uname)" != "Darwin" ] ; then
  echo "Only install possible on os x"
  exit 1
fi

# Install Zinit (See https://github.com/zdharma-continuum/zinit)
echo "Install Zinit"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# Install HomeBrew (See https://brew.sh/)
echo "Install HomeBrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# link dotfiles
WORK_DIR="$(cd "$(dirname "$0")" && pwd )"
echo "Link dotfiles"
for dotfile in "$WORK_DIR"/.??* ; do
  [ "$dotfile" = "$WORK_DIR"/.idea ] && continue
  [ "$dotfile" == "$WORK_DIR"/.git ] && continue
  [ "$dotfile" == "$WORK_DIR"/.github ] && continue

  ln -fns "$dotfile" "$HOME"
done

echo "Installation done"
