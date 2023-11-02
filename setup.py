import subprocess
import sys

def run_command(command, print_output=False):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True, text=True, bufsize=1, universal_newlines=True)
    
    while True:
        output = process.stdout.readline()
        if output == '' and process.poll() is not None:
            break
        if output:
            print(output.strip(), flush=True)
    
    rc = process.poll()
    return rc

def install_homebrew():
    if not is_installed("brew"):
        print("Installing Homebrew...")
        exit_code = run_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"', print_output=True)
        if exit_code != 0:
            print("Homebrew installation failed")
            sys.exit(exit_code)
        print("Homebrew installed")
    else:
        print("Homebrew is already installed")

def is_installed(command):
    try:
        subprocess.check_output(["which", command])
        return True
    except subprocess.CalledProcessError:
        return False

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

