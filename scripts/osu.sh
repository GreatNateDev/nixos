# This only works for me ofc
git clone https://github.com/GreatNateDev/osu.git
cd osu
sudo rm -rf .git
sudo mv * /home/nate/.local/share/osu/
cd /home/nate/.local/share/osu/
sudo mkdir -p Skins
sudo cp -r s/* Skins/
cd ~
