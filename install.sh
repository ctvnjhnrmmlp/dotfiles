#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------
# install.sh - bootstrap Arch/Omarchy/WSL
# ----------------------------------------

# Update system
echo "==> Updating system..."
sudo pacman -Syu --noconfirm

# Base packages
BASE_PACKAGES=(
  zsh
  reflector
  stow
  neovim
  git
  lazygit
  zellij
  pnpm
  nvm
  fzf
  ripgrep
  fd
  bat
  eza
  zoxide
  htop
  htop
  curl
  wget
  unzip
  tree
  jq
  less
)

# Install base packages
echo "==> Installing base packages..."
sudo pacman -S --needed --noconfirm "${BASE_PACKAGES[@]}"

# If this is not WSL, install desktop extras
if ! grep -qi microsoft /proc/version; then
  echo "==> Installing desktop extras..."
  sudo pacman -S --needed --noconfirm "${DESKTOP_PACKAGES[@]}"
else
  echo "==> Detected WSL, skipping desktop extras."
fi

# Finish
echo "==> Installation complete! Now run 'stow common' to symlink your configs."

