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

# Copy custom zshrc and set ownership
COPY .zshrc /home/${USERNAME}/.zshrc
RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.zshrc

# We'll handle Homebrew separately in the postCreateCommand
# to avoid build errors

# Set default shell to zsh for the container
SHELL ["/bin/zsh", "-c"]