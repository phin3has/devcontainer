#!/bin/zsh

# Ensure Homebrew is in PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Test that Homebrew is working
echo "Testing Homebrew..."
brew --version

# Clone your dotfiles (uncomment and modify as needed)
# git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
# cd ~/dotfiles && ./install.sh

# Install some basic brew packages
echo "Installing some basic brew packages..."
brew install coreutils

# Create a marker file so we know setup has been run
touch ~/.devcontainer-initialized

echo "Development environment setup completed successfully!"
echo "Homebrew is installed at: $(which brew)"
echo "Current shell: $SHELL"