#!/bin/bash

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" >&2
    exit 1
fi

function install_theHarvester {

	if command -v theHarvester >/dev/null 2>&1; then
		echo "theHarvester is installed"
		theHarvester --version
	else 
		echo "Installing theHarvester..."

		if ! nix-env -iA nixpkgs.theharvester; then
			echo "theHarvester installation failed"
			exit 1
		fi

		echo "theHarvester had been installed"
		theHarvester --version
	fi
		
}

install_theHarvester
