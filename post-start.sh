#!/bin/bash

# This script installs Homebrew in the running container
# It's designed to be run after the container is started

# Exit on error
set -e

echo "Installing Homebrew..."

# Check if Homebrew is already installed
if [ -f "/home/vscode/.linuxbrew/bin/brew" ]; then
    echo "Homebrew is already installed."
    eval "$(/home/vscode/.linuxbrew/bin/brew shellenv)"
else
    # Create directory
    mkdir -p /home/vscode/.linuxbrew
    # Clone Homebrew
    git clone --depth=1 https://github.com/Homebrew/brew.git /home/vscode/.linuxbrew
    # Set ownership
    chown -R vscode:vscode /home/vscode/.linuxbrew
    # Add to path
    echo 'eval "$(/home/vscode/.linuxbrew/bin/brew shellenv)"' >> /home/vscode/.profile
    echo 'eval "$(/home/vscode/.linuxbrew/bin/brew shellenv)"' >> /home/vscode/.bashrc
    echo 'eval "$(/home/vscode/.linuxbrew/bin/brew shellenv)"' >> /home/vscode/.zshrc
    # Initialize in current shell
    eval "$(/home/vscode/.linuxbrew/bin/brew shellenv)"
fi

# Print version to verify it's working
brew --version

echo "Homebrew installation complete!"
