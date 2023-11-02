import subprocess
import sys

def run_command(command):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    stdout, stderr = process.communicate()
    if process.returncode != 0:
        print(f"Error: {stderr.decode('utf-8')}")
        sys.exit(process.returncode)
    return stdout.decode('utf-8').strip()

def is_installed(command):
    try:
        subprocess.check_output(["which", command])
        return True
    except subprocess.CalledProcessError:
        return False

def install_homebrew():
    if not is_installed("brew"):
        print("Installing Homebrew...")
        run_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
        print("Homebrew installed")
    else:
        print("Homebrew is already installed")

def install_node():
    if not is_installed("node"):
        print("Installing Node.js...")
        run_command("brew install node")
        print("Node.js installed")
    else:
        print("Node.js is already installed")

def check_neovim_version():
    nvim_version = run_command("nvim --version | head -n 1 | awk '{print $2}'")
    if nvim_version < "0.5.0":
        print("Neovim version is outdated, updating...")
        run_command("brew install neovim")
        print("Neovim updated")
    else:
        print("Neovim version is up to date")

def install_packer():
    if not is_installed("nvim"):
        print("Error: Neovim is not installed")
        sys.exit(1)

    packer_path = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    if not run_command(f"ls {packer_path}"):
        print("Installing Packer.nvim...")
        run_command("git clone --depth 1 https://github.com/wbthomason/packer.nvim " + packer_path)
        print("Packer.nvim installed")
    else:
        print("Packer.nvim is already installed")

    # Compile packer and install plugins
    print("Compiling packer and installing plugins...")
    run_command("nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'")
    print("Plugins installed")

if __name__ == "__main__":
    install_homebrew()
    install_node()
    check_neovim_version()
    install_packer()

