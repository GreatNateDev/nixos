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
echo "Starting config installer..."
echo "What is your gpu type... Accepted Values amdgpu, nvidia, intel, vmware, virtualbox, qxl, virtio"
read GPU
echo "Making Directory..."
mkdir -p ~/.config/nixos
echo "Moving files..."
mv ~/nixos/.git ~/.config/nixos/
mv ~/nixos/.gitignore ~/.config/nixos/
mv ~/nixos/* ~/.config/nixos/
echo "Fixing Issues"
rm ~/.config/user-dirs.dirs
echo "Getting hardware config..."
sudo mv /etc/nixos/hardware-configuration.nix ~/.config/nixos/nix/hardware.nix
echo "Adding your gpu..."
sed -i '/boot\.initrd\.kernelModules/d' "/home/$USER/.config/nixos/nix/hardware.nix"
gpucode="boot.initrd.kernelModules = [\"$GPU\"];"
sed -i "/^}$/i $gpucode" "/home/$USER/.config/nixos/nix/hardware.nix"
echo "Removing old config..."
sudo rm -rf /etc/nixos/
echo "Building..."
echo 'Rebuilding NixOS...' && sudo nixos-rebuild switch --flake $HOME/.config/nixos/nix --impure --quiet && echo Done!
echo "Script complete rebooting..."
sudo reboot
