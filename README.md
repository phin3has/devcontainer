# Development Container with ZSH and Homebrew

This repository contains a development container configuration for Visual Studio Code that provides:

- ZSH as the default shell
- Oh-My-ZSH pre-installed
- Homebrew (Linuxbrew) available for package management

## How it works

The container image includes:

1. **ZSH Configuration**:
   - ZSH as the default shell
   - Oh-My-ZSH pre-installed with the "robbyrussell" theme
   - Custom .zshrc configuration

2. **Homebrew Installation**:
   - Homebrew installed directly in the container image
   - Environment variables properly set
   - Basic Homebrew initialization performed

## Usage as a Development Container

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

## Important Notes

- The Homebrew installation is located at `/home/vscode/.linuxbrew`
- The image supports both AMD64 and ARM64 architectures for compatibility with Apple Silicon Macs

## Customization

- Modify `.zshrc` to customize your ZSH configuration
- Update `devcontainer.json` to add more VS Code extensions or settings
- Add additional tools to the Dockerfile for more specific use cases

## Troubleshooting

If you encounter any issues:

- Check the "Dev Container: Show Container Log" from VS Code's command palette
- Ensure Docker is running properly on your system
- Try rebuilding the container from VS Code's command palette