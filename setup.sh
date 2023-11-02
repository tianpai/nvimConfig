#!/bin/bash

# Function to check if a command exists
command_exists() {
  which "$1" &>/dev/null
}

# Function to install curl
install_curl() {
  if [[ -f /etc/fedora-release ]]; then
    sudo dnf install -y curl
  elif [[ -f /etc/arch-release ]]; then
    sudo pacman -S --noconfirm curl
  elif [[ -f /etc/lsb-release ]]; then
    sudo apt-get update
    sudo apt-get install -y curl
  else
    echo "Unknown distribution. Exiting..."
    exit 1
  fi
}

# Function to install Homebrew
install_homebrew() {
  if ! command_exists brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

# Function to install Node and Python3 using Homebrew
install_node_python3() {
  brew install node python3
}

# Function to install Packer.vim and plugins
install_packer_plugins() {
  if ! command_exists nvim; then
    echo "Neovim is not installed. Please install Neovim first."
    exit 1
  fi

  # Check Neovim version
  NVIM_VERSION=$(nvim --version | head -n 1 | cut -d " " -f 2)
  if [[ $(echo -e "0.5.0\n$NVIM_VERSION" | sort -V | head -n1) = "0.5.0" ]]; then
    echo "Neovim version is sufficient for Packer.vim"
  else
    brew install neovim
  fi

  # Install Packer.vim
  PACKER_PATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
  if [[ ! -d "$PACKER_PATH" ]]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_PATH"
  fi

  # Compile Packer and install plugins
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

# Main script
main() {
  if ! command_exists curl; then
    echo "Curl is not installed. Installing..."
    install_curl
  else
    echo "Curl is already installed."
  fi

  install_homebrew
  install_node_python3
  install_packer_plugins
}

main

