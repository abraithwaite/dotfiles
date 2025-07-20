#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging functions
info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ -f /etc/fedora-release ]]; then
        echo "fedora"
    elif [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

# Install packages based on OS
install_dependencies() {
    local os="$1"
    info "Installing dependencies for $os..."
    
    case "$os" in
        "macos")
            if ! command -v brew &> /dev/null; then
                info "Installing Homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install stow git neovim tmux bat curl zsh
            ;;
        "fedora")
            sudo dnf install -y stow git neovim tmux bat curl zsh
            ;;
        "ubuntu"|"debian")
            sudo apt update
            sudo apt install -y stow git neovim tmux bat curl zsh
            ;;
        *)
            warn "Unknown OS: $os. Please install stow, git, neovim, tmux, bat, curl, and zsh manually."
            ;;
    esac
}

# Change default shell to zsh
setup_zsh() {
    if [[ "$SHELL" != */zsh ]]; then
        info "Changing default shell to zsh..."
        chsh -s $(which zsh)
        warn "You'll need to log out and back in for the shell change to take effect."
    fi
}

# Backup existing dotfiles
backup_existing() {
    local backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
    local files_to_backup=(
        ".gitconfig" ".zshrc" ".zshenv" ".zprofile" ".zpreztorc" 
        ".tmux.conf" ".vimrc" ".config/nvim" ".config/prezto"
        ".ipython"
    )
    
    local backup_needed=false
    for file in "${files_to_backup[@]}"; do
        if [[ -e "$HOME/$file" && ! -L "$HOME/$file" ]]; then
            backup_needed=true
            break
        fi
    done
    
    if [[ "$backup_needed" == "true" ]]; then
        info "Backing up existing dotfiles to $backup_dir..."
        mkdir -p "$backup_dir"
        for file in "${files_to_backup[@]}"; do
            if [[ -e "$HOME/$file" && ! -L "$HOME/$file" ]]; then
                cp -r "$HOME/$file" "$backup_dir/" 2>/dev/null || true
            fi
        done
    fi
}

# Clone external repositories
clone_external_repos() {
    info "Setting up external repositories..."
    
    # Clone prezto if not already present
    if [[ ! -d "$HOME/.config/prezto" ]]; then
        info "Cloning prezto configuration framework..."
        git clone --recursive https://github.com/abraithwaite/prezto.git "$HOME/.config/prezto"
    fi
    
    # Clone dotvim if not already present  
    if [[ ! -d "$HOME/.vim" ]]; then
        info "Cloning vim configuration..."
        git clone https://github.com/abraithwaite/dotvim.git "$HOME/.vim"
    fi
}

# Stow packages
stow_packages() {
    local dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$dotfiles_dir"
    
    info "Installing dotfiles with stow..."
    
    # Remove any existing symlinks that might conflict
    local packages=("git" "zsh" "tmux" "vim" "nvim" "ipython")
    for package in "${packages[@]}"; do
        if [[ -d "stow/$package" ]]; then
            info "Installing $package configuration..."
            stow -d stow -t "$HOME" "$package" --verbose=2
        fi
    done
}

# Main installation
main() {
    info "Starting dotfiles setup..."
    
    local os=$(detect_os)
    info "Detected OS: $os"
    
    # Install dependencies
    install_dependencies "$os"
    
    # Backup existing configs
    backup_existing
    
    # Setup zsh
    setup_zsh
    
    # Clone external repositories
    clone_external_repos
    
    # Install with stow
    stow_packages
    
    info "Dotfiles setup complete!"
    info "Run 'source ~/.zshrc' or restart your terminal to use the new configuration."
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi