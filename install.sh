mkdir -p ~/.config/nixos
mv ~/nixos/.git ~/.config/nixos/
mv ~/nixos/* ~/.config/nixos/
sudo mv /etc/nixos/hardware-configuration.nix ~/.config/nixos/hardware-configuration.nix
sudo rm -rf /etc/nixos/
sudo nixos-rebuild switch --flake $HOME/.config/nixos --impure