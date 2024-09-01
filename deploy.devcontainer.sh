#!/bin/zsh

set -euo pipefail
WORK_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$WORK_DIR"/helper/lib.sh

install_zinit
link_dotfiles "$WORK_DIR"/devcontainer
install_asdf

echo "[INFO] Install Done. Please run source ~/.zshrc $NC"
