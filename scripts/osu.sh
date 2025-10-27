# This only works for me ofc
git clone https://github.com/GreatNateDev/osu.git
cd osu
sudo rm -rf .git
sudo mv * $HOME/.local/share/osu/
cd $HOME/.local/share/osu/
sudo mkdir -p Skins
sudo cp -r s/* Skins/
cd ~/.config/nixos/scripts
rm -rf osu
nautilus ~/.local/share/osu/Skins/
