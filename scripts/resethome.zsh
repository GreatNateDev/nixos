#!/usr/bin/env zsh
set -euo pipefail

USER_NAME="$(whoami)"
HOME_DIR="/home/$USER_NAME"
NIXOS_CONFIG_SRC="$HOME_DIR/.config/nixos"
NIXOS_CONFIG_TMP="/nixos"

echo "============================================================"
echo "⚠️  DANGER ZONE: HOME DIRECTORY RESET"
echo
echo "This will PERMANENTLY DELETE:"
echo "  $HOME_DIR"
echo
echo "The following will be preserved:"
echo "  $NIXOS_CONFIG_SRC  →  $NIXOS_CONFIG_TMP  →  restored"
echo
echo "Afterwards, the system will recompile using: ns"
echo "============================================================"
echo

print -n "Type 'RESET HOME' to continue: "
read CONFIRM
if [[ "$CONFIRM" != "RESET HOME" ]]; then
  echo "Aborted."
  exit 1
fi

echo
echo "Final chance. Proceeding in 5 seconds... Ctrl+C to cancel."
sleep 5

# ---- Safety checks ----
if [[ "$HOME_DIR" == "/" || "$HOME_DIR" == "/home" || -z "$HOME_DIR" ]]; then
  echo "❌ Refusing to operate on unsafe HOME_DIR: $HOME_DIR"
  exit 1
fi

if [[ ! -d "$NIXOS_CONFIG_SRC" ]]; then
  echo "❌ Expected NixOS config not found at:"
  echo "   $NIXOS_CONFIG_SRC"
  exit 1
fi

if [[ -e "$NIXOS_CONFIG_TMP" ]]; then
  echo "❌ $NIXOS_CONFIG_TMP already exists — aborting to avoid overwrite"
  exit 1
fi

# ---- Preserve NixOS config ----
echo "Preserving NixOS config..."
sudo mv "$NIXOS_CONFIG_SRC" "$NIXOS_CONFIG_TMP"

# ---- Delete home ----
echo "Deleting home directory..."
sudo rm -rf "$HOME_DIR"

# ---- Recreate home ----
echo "Recreating home directory..."
sudo mkdir -p "$HOME_DIR"
sudo chown "$USER_NAME:$USER_NAME" "$HOME_DIR"
sudo chmod 700 "$HOME_DIR"

# ---- Restore NixOS config ----
echo "Restoring NixOS config..."
mkdir -p "$HOME_DIR/.config"
sudo mv "$NIXOS_CONFIG_TMP" "$HOME_DIR/.config/nixos"
sudo chown -R "$USER_NAME:$USER_NAME" "$HOME_DIR/.config"

# ---- Rebuild ----
echo
echo "Recompiling system with: ns"
ns
