FROM mcr.microsoft.com/devcontainers/base:debian

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    build-essential \
    procps \
    file \
    && rm -rf /var/lib/apt/lists/*

# The base image already has zsh installed and set up

# Create post-start script that will install Homebrew
COPY ./post-start.sh /usr/local/bin/post-start.sh
RUN chmod +x /usr/local/bin/post-start.sh
