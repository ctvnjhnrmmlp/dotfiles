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
  vim
  git
  lazygit
  docker
  lazydocker
  zellij
  pnpm
  cargo
  nvm
  pyenv
  rustc
  fzf
  ripgrep
  fd
  bat
  eza
  zoxide
  htop
  btop
  curl
  wget
  unzip
  tree
  jq
  less
  base-devel
  which
  zip
  tar
  p7zip
  openssh
  inetutils
  net-tools
  expac
  asciinema
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

