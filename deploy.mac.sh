#!/bin/bash

set -euo pipefail
WORK_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$WORK_DIR"/helper/lib.sh

install_zinit
install_brew
link_dotfiles "$WORK_DIR"/mac

echo "[INFO] Installation done. Run source ~/.zshrc"
