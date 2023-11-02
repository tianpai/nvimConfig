import subprocess
import os
import time
import sys


PACKER_URL = "https://github.com/wbthomason/packer.nvim"
PACKER_PATH = os.path.expanduser("~/.local/share/nvim/site/pack/packer/start/packer.nvim")
PACKRT_REQUIRED_VERSION = "0.5.0"
DEPDENDENCIES = [
    "git" = false,
    "node" = false,
]


def run_command(command):
    try:
        output = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True, text=True)
        return output.strip(), None
    except subprocess.CalledProcessError as e:
        return None, e.output.strip()

def install_neovim():
    if not os.path.exists("/usr/local/bin/nvim"):
        print("Installing neovim...")
        subprocess.run(["brew", "install", "neovim"])
    else:
        print("Neovim is already installed.")


def install_packer():
    if not os.path.exists(PACKER_PATH):
        print("Installing packer.nvim...")
        print("\nClone repository...")
        subprocess.run(["git", "clone", "--depth", "1", PACKER_URL, PACKER_PATH])

        print("Compiling packer...")
        subprocess.run(["nvim", "+PackerCompile", "+qall"])

        # install plugins
        print("Installing plugins...")
        subprocess.run(["nvim", "+PackerInstall", "+qall"])
    else:
        print("packer.nvim is already installed.")

def install_homebrew():
    if not os.path.exists("/usr/local/bin/brew"): 
        print("Installing homebrew...")
        subprocess.run(["/bin/bash", "-c", "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"])
    else:
        print("Homebrew is already installed.")

def main():
    output, error = run_command("brew --version")
    if error:
        install_homebrew()
    
    output, error = run_command("nvim --version")
    if error or output.split(" ")[1] != PACKRT_REQUIRED_VERSION:
        install_neovim()

    # check each dependency and install if not installed
    for dependency in DEPDENDENCIES:
        output, error = run_command(f"{dependency} --version")
        if error:
            func_name = f"install_{dependency}"
            globals()[func_name]()


    install_packer()

    print("Done.")
    # do you want to open nvim now? ask user
    option = input("Do you want to open nvim now? [Y/n]: ")

    # if option is 'y' or 'Y', 'yes' or 'YES' or Enter key, open neovim
    if option.lower() in ["y", "yes", ""]:
        subprocess.run(["nvim"])



if __name__ == "__main__":
    main()

