#!/bin/bash

# Function to get the distribution name
get_distro() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo $ID
  elif type lsb_release >/dev/null 2>&1; then
    lsb_release -si | tr 'A-Z' 'a-z'
  else
    echo "unknown"
  fi
}


# Function to check and install python3
check_install_python3() {
  if ! which python3 > /dev/null 2>&1; then
    echo "Python3 could not be found, installing..."
    case $1 in
      ubuntu|debian)
        sudo apt-get update
        sudo apt-get install -y python3
        ;;
      fedora)
        sudo dnf install -y python3
        ;;
      arch|manjaro)
        sudo pacman -S --noconfirm python
        ;;
      *)
        echo "Unsupported or unknown distribution"
        exit 1
        ;;
    esac
  else
    echo "Python3 is already installed"
  fi
}


# Function to check and install curl
check_install_curl() {
  if ! command -v curl &> /dev/null; then
    echo "Curl could not be found, installing..."
    case $1 in
      ubuntu|debian)
        sudo apt-get update
        sudo apt-get install -y curl
        ;;
      fedora)
        sudo dnf install -y curl
        ;;
      arch|manjaro)
        sudo pacman -S --noconfirm curl
        ;;
      *)
        echo "Unsupported or unknown distribution"
        exit 1
        ;;
    esac
  else
    echo "Curl is already installed"
  fi
}

# Get the distribution name
distro=$(get_distro)

# Check and install python3
check_install_python3 $distro

# Check and install curl
check_install_curl $distro

# Run the Python script
if [ -f setup.py ]; then
  python3 setup.py
else
  echo "The Python script 'setup.py' was not found in the current directory."
  exit 1
fi

