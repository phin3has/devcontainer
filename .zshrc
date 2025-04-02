# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Enable plugins
plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

# Homebrew path setup
export PATH="$HOME/.linuxbrew/bin:$PATH"
export HOMEBREW_PREFIX="$HOME/.linuxbrew"
export HOMEBREW_CELLAR="$HOME/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="$HOME/.linuxbrew"

# To ensure Homebrew is loaded properly
eval "$($HOME/.linuxbrew/bin/brew shellenv 2>/dev/null || true)"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# User aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Welcome message
echo "Welcome to your development container with zsh and oh-my-zsh!"
echo "Homebrew is installed at: $(which brew 2>/dev/null || echo 'not found')"