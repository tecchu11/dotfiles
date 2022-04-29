#!/bin/bash

# Validation
if [[ "$(uname)" != "Darwin" ]] ; then
  echo "Only install possible on os x"
  exit 1
fi

# Install Zinit
#bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
if [[ -f "$(zinit)" ]]; then
  echo "Install Zinit"
else
  echo "Zinit already installed"
fi

# Install HomeBrew ( See https://brew.sh/)
if [[ -f "$(brew --prefix)" ]]; then
  echo "Install HomeBrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "HomeBrew already installed"
fi

# link dotfiles
WORK_DIR="$(cd "$(dirname "$0")" && pwd )"

for dotfile in "$WORK_DIR"/.??* ; do
  [[ $dotfile == $WORK_DIR/.idea ]] && continue
  [[ $dotfile == $WORK_DIR/.git ]] && continue
  [[ $dotfile == $WORK_DIR/.github ]] && continue

  ln -fnsv "$dotfile" "$HOME"
done
