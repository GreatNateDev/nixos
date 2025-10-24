clear
echo "Starting Installer..."
nix-env -iA nixos.lolcat
clear

cat <<"EOF"
███    ██  █████  ████████ ███████ ███████     ███    ██ ██ ██   ██  ██████  ███████     ██ ███    ██ ███████ ████████  █████  ██      ██      ███████ ██████
████   ██ ██   ██    ██    ██      ██          ████   ██ ██  ██ ██  ██    ██ ██          ██ ████   ██ ██         ██    ██   ██ ██      ██      ██      ██   ██
██ ██  ██ ███████    ██    █████   ███████     ██ ██  ██ ██   ███   ██    ██ ███████     ██ ██ ██  ██ ███████    ██    ███████ ██      ██      █████   ██████
██  ██ ██ ██   ██    ██    ██           ██     ██  ██ ██ ██  ██ ██  ██    ██      ██     ██ ██  ██ ██      ██    ██    ██   ██ ██      ██      ██      ██   ██
██   ████ ██   ██    ██    ███████ ███████     ██   ████ ██ ██   ██  ██████  ███████     ██ ██   ████ ███████    ██    ██   ██ ███████ ███████ ███████ ██   ██



EOF
# Ensure hostname is 'nixos'
if [ "$(hostname)" != "nixos" ]; then
  echo "❌ This script must be run on a machine with hostname 'nixos'."
  echo "    Current hostname: $(hostname)"
  exit 1
fi

# Ensure username is 'nate'
if [ "$USER" != "nate" ]; then
  echo "❌ This script must be run as user 'nate'."
  echo "    Current user: $USER"
  exit 1
fi
sudo nixos-generate-config
echo "Removing git and lolcat"
nix-env -e git
nix-env -e lolcat
echo "Starting config installer..."
echo "Making Directory..."
mkdir -p ~/.config/nixos
echo "Moving files..."
mv ~/nixos/.git ~/.config/nixos/
mv ~/nixos/.gitignore ~/.config/nixos/
mv ~/nixos/* ~/.config/nixos/
echo "{ ... }: {}" > ~/.config/nixos/nix/custom.nix
rmdir ~/nixos
rmdir ~/Desktop
rmdir ~/Documents
rmdir ~/Downloads
rmdir ~/Music
rmdir ~/Pictures
rmdir ~/Public
rmdir ~/Templates
rmdir ~/Videos
echo "Fixing Issues"
rm ~/.config/user-dirs.dirs
echo "Getting hardware config..."
sudo mv /etc/nixos/hardware-configuration.nix ~/.config/nixos/nix/hardware.nix
echo "Removing old config..."
sudo rm -rf /etc/nixos/
echo "Building..."
echo 'Rebuilding NixOS...' && sudo nixos-rebuild switch --flake $HOME/.config/nixos/nix --impure --quiet && echo Done!
echo "Script complete. Reboot? (y/N)"
read rebootcon
if [ "$rebootcon" = "y" ]; then
    reboot
else
    echo "Skipping reboot."
    exit 0
fi
