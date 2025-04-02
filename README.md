# ZSH and Homebrew Development Container

This container provides:
- ZSH as the default shell (from the base image)
- Oh-My-ZSH (from the base image)
- Homebrew (installed via post-start script)

## How it works

1. The container starts with the basic devcontainer base image
2. After the container starts, a post-start script installs Homebrew
3. The script adds Homebrew to the PATH in all shell configuration files

## Usage

### In VS Code

1. Open this folder in VS Code
2. When prompted, click "Reopen in Container"
3. Wait for the container to build and start
4. The post-start script will automatically run and install Homebrew

### As a base image in other projects

```json
{
  "name": "My Project",
  "image": "ghcr.io/YOUR-USERNAME/devcontainer:latest",
  
  // Optional: add other features
  "features": {
    "ghcr.io/devcontainers/features/python:1": {}
  }
}
```

## Troubleshooting

- If Homebrew isn't available, run `/usr/local/bin/post-start.sh` manually
- Make sure your Docker has enough resources allocated (at least 4GB of RAM)
- Check Docker logs if the container fails to start
