
install_python3() {

    if command -v python3 >/dev/null 2>&1; then
        echo "python3 is installed"
        python3 --version
    else
        echo "Installing python3..."

        if ! nix-env -iA nixpkgs.python3; then
            echo "python3 nstallation failed"
            exit 1
        fi

        echo "python3 has been installed"
        python3 --version
    fi
}

validate_pip3() {

    if command -v pip3 >/dev/null 2>&1; then
        echo "pip3 is installed"
        pip3 --version
    else
        echo "Installing pip3..."

        if ! python3 -m ensurepip --upgrade; then
            echo "pip3 installation failed"
            exit 1
        fi

        echo "pip3 has been installed"
        pip3 --version
    fi
}

validate_python3
validate_pip3





