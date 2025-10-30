#manually run this script to finish setup by downloading game progress and signing into personal accounts
echo -n "Setup GitHub? (Y/n) "
read githubconfirm
if [ "$githubconfirm" != "n" ]; then
  zsh $HOME/.config/nixos/scripts/github.zsh
fi
