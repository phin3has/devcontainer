FROM mcr.microsoft.com/devcontainers/base:bullseye

ARG USERNAME=vscode

# Install required packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends \
    git curl wget zsh build-essential

# Install zsh and oh-my-zsh
RUN apt-get install -y zsh && \
    chsh -s /bin/zsh ${USERNAME} && \
    su ${USERNAME} -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')" || true

# Install Homebrew directly in the Dockerfile
RUN mkdir -p /home/${USERNAME}/.linuxbrew && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.linuxbrew && \
    su ${USERNAME} -c 'git clone https://github.com/Homebrew/brew /home/${USERNAME}/.linuxbrew' && \
    echo 'eval "$(${HOME}/.linuxbrew/bin/brew shellenv)"' >> /home/${USERNAME}/.zshrc && \
    echo 'eval "$(${HOME}/.linuxbrew/bin/brew shellenv)"' >> /home/${USERNAME}/.bashrc

# Copy custom zshrc and set ownership
COPY .zshrc /home/${USERNAME}/.zshrc
RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.zshrc

# Make zsh the default shell for the container
SHELL ["/bin/zsh", "-c"]

# Add Homebrew to the system PATH and environment variables
ENV PATH="/home/${USERNAME}/.linuxbrew/bin:${PATH}"
ENV HOMEBREW_PREFIX="/home/${USERNAME}/.linuxbrew"
ENV HOMEBREW_CELLAR="/home/${USERNAME}/.linuxbrew/Cellar"
ENV HOMEBREW_REPOSITORY="/home/${USERNAME}/.linuxbrew"

# Run basic Homebrew initialization as the user
USER ${USERNAME}
RUN brew config && brew update --force --quiet
USER root

# Set default shell to zsh for Docker commands
SHELL ["/bin/zsh", "-c"]