#!/bin/bash

set -euo pipefail
WORK_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$WORK_DIR"/helper/lib.sh

if [ "$(uname)" == "Darwin" ] ; then
    echo "$WORK_DIR/mac/Brewfile"
    brew bundle --file "$WORK_DIR/mac/Brewfile"
fi

add_asdf_plugin $HOME/.tool-versions
/bin/zsh -c "$(asdf install)"
