# basicly setup a private repo with all your entire osu path commited
export PATH="/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH"
gituser=$(nix eval --raw -f $HOME/.config/nixos/nix/env.nix gituser)
repo="osu.git"
path="$HOME/.local/share/osu"
git clone https://github.com/$gituser/$repo
cd osu
rm -rf $path
sudo mv * $path
cd ..
rm -rf osu
