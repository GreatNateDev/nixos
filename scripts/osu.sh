# basicly setup a private repo with all your entire osu path commited
gituser="GreatNateDev"
repo="osu.git"
path="$HOME/.local/share/osu"
git clone https://github.com/$gituser/$repo
cd osu
rm -rf $path
sudo mv * $path
cd ..
rm -rf osu
