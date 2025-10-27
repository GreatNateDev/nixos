# basicly setup a private repo with all your entire osu path commited
gituser="GreatNateDev"
repo="osu.git"
path="$HOME/.local/share/osu"
git clone https://github.com/$gituser/$repo
cd osu
sudo rm -rf .git
sudo mv * $path
cd $path
sudo mkdir -p Skins
sudo cp -r s/* Skins/
cd ~/.config/nixos/scripts
rm -rf osu
nautilus $path/Skins/
