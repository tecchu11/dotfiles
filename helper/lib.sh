#!/bin/bash

set -euo pipefail

# Zinit (See https://github.com/zdharma-continuum/zinit)
install_zinit() {
	echo "[INFO] Install Zinit"
	NO_INPUT=1 bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
}

# HomeBrew (See https://brew.sh/)
install_brew() {
	echo "[INFO] Install HomeBrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_asdf() {
	echo "[INFO] Install asdf"
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
}

link_dotfiles() {
	local dotfiles="$1"

	echo "[INFO] Link dotfiles on $dotfiles"
	for dotfile in "$dotfiles"/.??*; do
		ln -fnsv "$dotfile" "$HOME"
	done
}

add_asdf_plugin() {
	local toolversions="$1"

	echo "[INFO] Add asdf plugin via $toolversions"
	if [[ ! -f "$toolversions" ]]; then
		echo ".tool-versions file not found!"
		exit 1
	fi

	while read -r line; do
		plugin=$(echo "$line" | awk '{print $1}')
		if asdf plugin-list | grep -q "^$plugin\$"; then
			echo "Plugin $plugin is already added."
		else
			asdf plugin add "$plugin"
			echo "Plugin $plugin added."
		fi
	done <"$toolversions"
}
