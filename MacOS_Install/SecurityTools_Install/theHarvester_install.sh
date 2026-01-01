install_theHarvester(){

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


