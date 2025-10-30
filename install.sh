clear
echo "Starting Installer..."
TARGET_USER="$USER"
TARGET_HOSTNAME="$(hostname)"
TARGET_FULLNAME=$(getent passwd "$TARGET_USER" | cut -d: -f5 | cut -d, -f1)
if [ -z "$TARGET_FULLNAME" ]; then
  TARGET_FULLNAME="$TARGET_USER"
fi
echo "Detected configuration:"
echo "  Username: $TARGET_USER"
echo "  Fullname: $TARGET_FULLNAME"
echo "  Hostname: $TARGET_HOSTNAME"
read -p "Continue with this configuration? (y/N): " confirm
if [ "$confirm" != "y" ]; then
  echo "Installation cancelled."
  exit 1
fi
nix-env -iA nixos.lolcat
clear

lolcat <<"EOF"
███    ██  █████  ████████ ███████ ███████     ███    ██ ██ ██   ██  ██████  ███████     ██ ███    ██ ███████ ████████  █████  ██      ██      ███████ ██████
████   ██ ██   ██    ██    ██      ██          ████   ██ ██  ██ ██  ██    ██ ██          ██ ████   ██ ██         ██    ██   ██ ██      ██      ██      ██   ██
██ ██  ██ ███████    ██    █████   ███████     ██ ██  ██ ██   ███   ██    ██ ███████     ██ ██ ██  ██ ███████    ██    ███████ ██      ██      █████   ██████
██  ██ ██ ██   ██    ██    ██           ██     ██  ██ ██ ██  ██ ██  ██    ██      ██     ██ ██  ██ ██      ██    ██    ██   ██ ██      ██      ██      ██   ██
██   ████ ██   ██    ██    ███████ ███████     ██   ████ ██ ██   ██  ██████  ███████     ██ ██   ████ ███████    ██    ██   ██ ███████ ███████ ███████ ██   ██



EOF
read -p "Git User: " TARGET_GITEMAIL
read -p "Git Email: " TARGET_GITUSER
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
cat >~/.config/nixos/nix/env.nix <<EOF
{
  username = "$TARGET_USER";
  hostname = "$TARGET_HOSTNAME";
  fullname = "$TARGET_FULLNAME";
  gituser = "$TARGET_GITUSER";
  gitemail = "$TARGET_GITEMAIL";
}
EOF
echo "{ ... }: {}" >~/.config/nixos/nix/custom.nix

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
echo "Options time!"
read -p "Set Extra Options? (y/N): " confirmop
if [[ "$confirmop" == "y" ]]; then
  read -p "Backup Firefox browser (in case Librewolf breaks) (y/N): " yesfirefox
  if [[ "$yesfirefox" == "y" ]]; then
    ENABLE_FIREFOX="firefox"
  else
    ENABLE_FIREFOX=""
  fi
fi
cat >~/.config/nixos/nix/options.nix <<EOF
{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
    ${ENABLE_FIREFOX:+$ENABLE_FIREFOX}
    ];
}
EOF

echo "Building..."
echo 'Rebuilding NixOS...' && sudo nixos-rebuild switch --flake $HOME/.config/nixos/nix --impure --quiet && echo Done!
chmod +x $HOME/.config/nixos/scripts/post-install.zsh
zsh $HOME/.config/nixos/scripts/post-install.zsh
echo "Script complete. Reboot? (y/N)"
read rebootcon
if [ "$rebootcon" = "y" ]; then
  reboot
else
  echo "Skipping reboot."
  exit 0
fi
