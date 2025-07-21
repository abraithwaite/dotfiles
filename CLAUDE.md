# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a modern dotfiles repository using GNU Stow for symlink management. It works seamlessly on Fedora and macOS, providing configurations for development tools and shell environment.

## Setup Commands

### Bootstrap Installation
```bash
# One-line install from remote
curl -fsSL https://raw.githubusercontent.com/abraithwaite/dotfiles/master/bootstrap | bash

# Manual installation
cd ~/.dotfiles && ./setup.sh
```

### Testing Before Installation
```bash
# Docker testing on Fedora
docker run -it --rm fedora:latest bash -c "
  dnf install -y curl git && 
  curl -fsSL https://raw.githubusercontent.com/abraithwaite/dotfiles/master/bootstrap | bash
"

# Test individual stow packages (dry run)
stow -d stow -t /tmp/test-home git --simulate --verbose=2
```

### Package Management
```bash
# Install specific package
stow -d stow -t ~ git --verbose=2

# Remove package
stow -d stow -t ~ git --delete

# Reinstall all packages
cd ~/.dotfiles && ./setup.sh
```

## Architecture

### Repository Structure
- `bootstrap` - Cross-platform installation script with OS detection
- `setup.sh` - Main setup script that installs dependencies and stows packages
- `stow/` - Stow packages containing dotfiles organized by tool
- `dates.zsh` - Utility functions for date/timestamp conversion

### Stow Package System
Each tool's configuration is in `stow/<tool>/` and gets symlinked to `~`:
- `stow/git/` → Git configuration with aliases and cross-platform settings
- `stow/zsh/` → Zsh with Prezto framework integration
- `stow/tmux/` → Tmux with vi-mode and custom key bindings  
- `stow/vim/` → Vim configuration
- `stow/nvim/` → Neovim (symlinks to vim config)
- `stow/ipython/` → IPython development environment

### External Dependencies
The setup automatically clones:
- Prezto framework: `~/.config/prezto` (from github.com/abraithwaite/prezto)
- Vim configuration: `~/.vim` (from github.com/abraithwaite/dotvim)

### Key Configuration Features
- **Git**: SSH URL rewriting, custom aliases, fast-forward only merges
- **Zsh**: Prezto framework, vi-mode keybindings, Docker/Kubernetes integration
- **Tmux**: Vi-mode, custom prefix (C-t), pane navigation with hjkl
- **Cross-platform**: Supports Fedora, Ubuntu, and macOS with appropriate package managers

### Backup Strategy
The setup script automatically backs up existing dotfiles to `~/.dotfiles-backup-<timestamp>/` before stowing new configurations.

## Branch Information
- Main development branch: `stow-conversion`
- Production branch: `master`
- Bootstrap script defaults to `stow-conversion` branch (configurable via `DOTFILES_BRANCH` env var)