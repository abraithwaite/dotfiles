# Dotfiles

Modern dotfiles management using [GNU Stow](https://www.gnu.org/software/stow/). Works seamlessly on Fedora and macOS.

## Quick Setup

One-line install:

```bash
curl -fsSL https://raw.githubusercontent.com/abraithwaite/dotfiles/master/bootstrap | bash
```

## Manual Setup

1. Clone this repository:
   ```bash
   git clone --recursive https://github.com/abraithwaite/dotfiles.git ~/.dotfiles
   ```

2. Run the setup script:
   ```bash
   cd ~/.dotfiles && ./setup.sh
   ```

## What's Included

- **Git**: Configuration with aliases and cross-platform paths
- **Zsh**: With Prezto framework and custom configuration
- **Tmux**: Terminal multiplexer configuration
- **Vim/Neovim**: Shared configuration via symlink
- **IPython**: Development environment setup
- **Claude**: AI assistant memory and preferences

## Package Structure

Dotfiles are organized using Stow packages in the `stow/` directory:

- `stow/git/` - Git configuration
- `stow/zsh/` - Zsh and Prezto configuration  
- `stow/tmux/` - Tmux configuration
- `stow/vim/` - Vim configuration
- `stow/nvim/` - Neovim (symlinks to vim)
- `stow/ipython/` - IPython configuration
- `stow/claude/` - Claude AI assistant memory

## Updating

To update your dotfiles with changes from the repository:

```bash
cd ~/.dotfiles

# Check if you have local changes
git status

# If clean, pull updates
git pull origin master

# Re-stow any updated packages (or all packages)
stow -d stow -t ~ git zsh tmux vim nvim ipython claude --verbose=2
```

**Safe update with backup:**

```bash
cd ~/.dotfiles

# Only proceed if no local changes
if git diff-index --quiet HEAD --; then
  git pull origin master
  stow -d stow -t ~ git zsh tmux vim nvim ipython claude --verbose=2
  echo "Dotfiles updated successfully"
else
  echo "Local changes detected. Commit or stash changes first."
  git status
fi
```

## Dependencies

The setup script automatically installs:
- stow, git, neovim, tmux, bat, curl, zsh

## Testing Before Installation

### Docker Testing (Recommended)

Test on Fedora or Ubuntu without affecting your system:

```bash
# Test on Fedora
docker run -it --rm fedora:latest bash -c "
  dnf install -y curl git && 
  curl -fsSL https://raw.githubusercontent.com/abraithwaite/dotfiles/master/bootstrap | bash
"

# Test on Ubuntu  
docker run -it --rm ubuntu:latest bash -c "
  apt update && apt install -y curl git &&
  curl -fsSL https://raw.githubusercontent.com/abraithwaite/dotfiles/master/bootstrap | bash
"
```

### VM Testing

Test in a virtual machine:
1. Spin up a fresh Fedora 42 or Ubuntu VM
2. Run the bootstrap command
3. Verify all configs are working

### Local Testing (Dry Run)

Test individual stow packages without affecting your system:

```bash
# Clone to a test directory
git clone https://github.com/abraithwaite/dotfiles.git /tmp/test-dotfiles
cd /tmp/test-dotfiles

# Test stow commands (dry run)
stow -d stow -t /tmp/test-home git --verbose=2 --no-folding

# View what would be linked
stow -d stow -t /tmp/test-home git --simulate --verbose=2
```

### Safe Testing on Your System

If you want to test on your actual system safely:

```bash
# 1. Backup your existing dotfiles first
cp ~/.zshrc ~/.zshrc.backup
cp ~/.gitconfig ~/.gitconfig.backup
# ... backup other important configs

# 2. Test individual packages
cd ~/.dotfiles
stow -d stow -t ~ git --verbose=2  # Install just git config

# 3. Test and verify, then install more packages
stow -d stow -t ~ zsh --verbose=2  # Install zsh config
```

### Rollback

To remove stowed configs:

```bash
cd ~/.dotfiles
stow -d stow -t ~ git --delete    # Remove git config links
stow -d stow -t ~ zsh --delete    # Remove zsh config links
```

## See Also

- [dotvim](https://github.com/abraithwaite/dotvim) repository
