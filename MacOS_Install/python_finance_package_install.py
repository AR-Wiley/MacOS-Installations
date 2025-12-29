import importlib.util
import subprocess
import sys

packages = ["pandas", "matplotlib", "numpy", "pandas_datareader", "bs4"]

for pkg in packages:
    if importlib.util.find_spec(pkg) is not None:
        print(f"{pkg} is installed")
    else:
        try:
            print(f"Installing {pkg}...")
            subprocess.check_call([sys.executable, "-m", "pip", "install", pkg])
            print(f"{pkg} installed successfully!")
        except subprocess.CalledProcessError as e:
            print(f"Failed to install {pkg}. Error: {e}")


