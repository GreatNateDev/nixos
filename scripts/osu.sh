# This only works for me ofc
git clone https://github.com/GreatNateDev/osu.git
cd osu
sudo rm -rf .git
mv * /home/nate/.local/share/osu/
cd /home/nate/.local/share/osu/
sudo mkdir -p Skins
cp -r s/* Skins/
cd ~