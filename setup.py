import os
import subprocess
import sys

def run_command(command, allow_input=False, capture_output=False):
    if allow_input:
        process = subprocess.run(command, shell=True)
    elif capture_output:
        process = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, text=True)
        if process.returncode != 0:
            print(f"Error: {process.stderr}")
            sys.exit(process.returncode)
        return process.stdout.strip()
    else:
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, text=True)
        stdout, stderr = process.communicate()
        if process.returncode != 0:
            print(f"Error: {stderr}")
            sys.exit(process.returncode)
        return stdout.strip()

def is_installed(command):
    try:
        subprocess.run(["which", command], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return True
    except subprocess.CalledProcessError:
        return False

def install_homebrew():
    if not is_installed("brew"):
        print("Installing Homebrew...")
        run_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"', allow_input=True)
    else:
        print("Homebrew is already installed. Updating...")
        run_command("brew update")

    # Add Homebrew to PATH
    homebrew_init = 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
    with open(os.path.expanduser('~/.bashrc'), 'a') as bashrc:
        bashrc.write(f'\n{homebrew_init}\n')
    os.system(homebrew_init)
    print("Added Homebrew to PATH")

    # Install Homebrew's dependencies
    if sys.platform.startswith('linux'):
        print("Installing Homebrew dependencies...")
        run_command('sudo apt-get install build-essential', allow_input=True)
        print("Installed Homebrew dependencies")

def install_neovim():
    print("Installing or updating Neovim...")
    run_command("brew install neovim || brew upgrade neovim")
    print("Neovim installed/updated")

def install_packer():
    packer_dir = os.path.expanduser("~/.local/share/nvim/site/pack/packer/start/packer.nvim")
    if not os.path.isdir(packer_dir):
        print("Installing Packer...")
        run_command("git clone --depth 1 https://github.com/wbthomason/packer.nvim " + packer_dir)
        print("Packer installed")
    else:
        print("Packer is already installed")

    print("Compiling Packer and installing plugins...")
    run_command("nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'")
    print("Plugins installed")

def main():
    if not is_installed("python3"):
        print("Python 3 is not installed. Please install Python 3 to continue.")
        sys.exit(1)

    if not is_installed("curl"):
        print("Curl is not installed. Please install curl to continue.")
        sys.exit(1)

    install_homebrew()
    install_neovim()
    install_packer()

if __name__ == "__main__":
    main()

