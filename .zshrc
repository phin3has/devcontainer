# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Enable plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Homebrew environment setup
export PATH="$HOME/.linuxbrew/bin:$PATH"
export HOMEBREW_PREFIX="$HOME/.linuxbrew"
export HOMEBREW_CELLAR="$HOME/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="$HOME/.linuxbrew"

# Ensure Homebrew is properly loaded
if [ -f "$HOME/.linuxbrew/bin/brew" ]; then
  eval "$($HOME/.linuxbrew/bin/brew shellenv)"
fi

# User aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'