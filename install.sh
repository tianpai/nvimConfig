#!/bin/bash

# Specify the path to your Python script
python_script_path="./installer.py"

# Check if the Python script exists
if [ -f "$python_script_path" ]; then
  # If the Python script exists, run it
  python3 "$python_script_path"
else
  # If the Python script does not exist, print an error message
  echo "Error: The Python script does not exist at $python_script_path"
  exit 1
fi

