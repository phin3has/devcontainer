#!/bin/bash

# Install Homebrew
echo "Installing Homebrew..."
mkdir -p ~/.linuxbrew
git clone https://github.com/Homebrew/brew ~/.linuxbrew

# Add Homebrew to PATH
echo "Setting up Homebrew environment..."
eval "$(~/.linuxbrew/bin/brew shellenv)"
echo 'eval "$(~/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
echo 'eval "$(~/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc

# Update Homebrew
echo "Updating Homebrew..."
brew update --force --quiet

# Install some basic packages
echo "Installing basic packages with Homebrew..."
brew install coreutils

# Create a marker file to indicate successful setup
touch ~/.devcontainer-initialized

echo "---------------------------------------"
echo "Development environment setup complete!"
echo "Homebrew has been installed at: $(which brew)"
echo "Your default shell is: $SHELL"
echo "---------------------------------------"