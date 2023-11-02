#!/bin/bash

# Function to check if a command exists
command_exists() {
  which "$1" &>/dev/null
}

# Function to move ./nvim/ to ~/.config/
move_nvim_config() {
  if [ -d "./nvim" ]; then
    if [ -d "$HOME/.config/nvim" ]; then
      read -p "~/.config/nvim already exists. Do you want to overwrite it? (y/n) " choice
      case "$choice" in 
        y|Y ) rm -rf "$HOME/.config/nvim";;
        n|N ) echo "Aborting script."; exit 1;;
        * ) echo "Invalid choice. Aborting script."; exit 1;;
      esac
    fi
    mv ./nvim "$HOME/.config/"
  else
    echo "./nvim directory not found. Continuing..."
  fi
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
  brew install node python3 lua
}

# Function to install Packer.vim and plugins
install_packer_plugins() {
  if ! command_exists nvim; then
    echo "Neovim is not installed. Please install Neovim first."
    exit 1
  fi

  if ! command_exists nvim; then
    echo "Neovim is not installed. Installing..."
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
  move_nvim_config

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

