sed -i '/\.\/System\/Font\.nix/a\    (import /home/${env.username}/.config/nixos/nix/deck.nix)' ~/.config/nixos/nix/System.nix
sed -i '/\.\/Home\/Systemd\.nix/a\    (import /home/${env.username}/.config/nixos/nix/deck-home.nix)' ~/.config/nixos/nix/Home.nix
echo "System.nix" >>~/.config/nixos/.gitignore
echo "Home.nix" >>~/.config/nixos/.gitignore
cp files/deck.nix ~/.config/nixos/nix/deck.nix
cp files/deck-home.nix ~/.config/nixos/nix/deck-home.nix
