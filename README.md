# Development Container with ZSH and Homebrew

This repository contains a development container configuration for Visual Studio Code that provides:

- ZSH as the default shell
- Oh-My-ZSH pre-installed
- Homebrew (Linuxbrew) available for package management

## How it works

The setup is split into two phases:

1. **Build phase** (Dockerfile):
   - Sets up the basic environment with required packages
   - Installs ZSH and Oh-My-ZSH
   - Configures ZSH as the default shell

2. **Post-create phase** (post-create.sh):
   - Installs Homebrew via git clone (more reliable in containers)
   - Configures environment variables
   - Updates Homebrew and installs basic utilities

## Usage

1. Open this folder in VS Code
2. When prompted, click "Reopen in Container"
3. Wait for the container to build and initialize
4. Enjoy your fully configured development environment!

## Using this image in other projects

This image is built and pushed to GitHub Container Registry automatically on every push to the main branch. You can use it as a base for other development containers:

```json
{
  "name": "My Project Dev Container",
  "image": "ghcr.io/YOUR-USERNAME/devcontainer:latest",
  
  // Add any features you want
  "features": {
    "ghcr.io/devcontainers/features/python:1": {},
    "ghcr.io/devcontainers/features/aws-cli:1": {}
  },
  
  // Other settings...
}
```

Replace `YOUR-USERNAME` with your actual GitHub username.

## Customization

- Modify `.zshrc` to customize your ZSH configuration
- Edit `post-create.sh` to install additional packages or setup dotfiles
- Update `devcontainer.json` to add more VS Code extensions or settings

## Troubleshooting

If you encounter any issues:

- Check the "Dev Container: Show Container Log" from VS Code's command palette
- Ensure Docker is running properly on your system
- Try rebuilding the container from VS Code's command palette