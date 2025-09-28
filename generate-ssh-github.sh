#!/usr/bin/env bash
set -euo pipefail

# generate-ssh-github.sh
# Generates an SSH keypair for GitHub, adds it to ssh-agent, and copies the public key to clipboard.

echo "=== GitHub SSH Key Generator ==="

# Get email (default: git config or manual)
read -rp "Enter your GitHub email [$(git config user.email 2>/dev/null || echo "your_email@example.com")]: " EMAIL
EMAIL=${EMAIL:-"$(git config user.email 2>/dev/null || echo "your_email@example.com")"}

# Prompt for custom key filename
DEFAULT_KEY_NAME="id_ed25519_github"
read -rp "Enter a name for your SSH key file [${DEFAULT_KEY_NAME}]: " KEY_NAME
KEY_NAME=${KEY_NAME:-$DEFAULT_KEY_NAME}

# Use ~/.ssh/ as storage path
KEY_PATH="$HOME/.ssh/${KEY_NAME}"

# Prompt for key type
read -rp "Key type? (ed25519/rsa) [ed25519]: " KEY_TYPE
KEY_TYPE=${KEY_TYPE:-"ed25519"}
RSA_BITS=4096

echo
echo "Generating SSH key..."
echo "  Email     : $EMAIL"
echo "  Key path  : $KEY_PATH"
echo "  Key type  : $KEY_TYPE"
echo

# Ensure ~/.ssh exists
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Backup if exists
if [[ -f "${KEY_PATH}" || -f "${KEY_PATH}.pub" ]]; then
  ts=$(date +"%Y%m%d%H%M%S")
  mv -v "${KEY_PATH}" "${KEY_PATH}.bak.${ts}" 2>/dev/null || true
  mv -v "${KEY_PATH}.pub" "${KEY_PATH}.pub.bak.${ts}" 2>/dev/null || true
  echo "Existing key backed up with timestamp."
fi

# Generate new key
if [[ "$KEY_TYPE" == "ed25519" ]]; then
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH"
else
  ssh-keygen -t rsa -b "$RSA_BITS" -C "$EMAIL" -f "$KEY_PATH"
fi

# Start ssh-agent and add key
eval "$(ssh-agent -s)" >/dev/null
ssh-add "$KEY_PATH"

# Print public key
echo
echo "Here’s your public key:"
cat "${KEY_PATH}.pub"
echo

echo "Next steps:"
echo "  1. Copy the above public key (it may also be in your clipboard)."
echo "  2. Go to https://github.com/settings/keys and add a new SSH key."
echo "  3. Test with: ssh -T git@github.com"

