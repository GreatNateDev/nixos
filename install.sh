mkdir -p ~/.config/nixos
mv ~/nixos ~/.config/nixos/
sudo mv /etc/nixos/hardware-configuration.nix ~/.config/nixos/hardware-configuration.nix
rm -rf /etc/nixos/
sudo nixos-rebuild switch --flake $HOME/.config/nixos