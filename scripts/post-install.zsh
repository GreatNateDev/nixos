#manually run this script to finish setup by downloading game progress and signing into personal accounts

read -p "Setup GitHub? (Y/n) " githubconfirm
if [ "$githubconfirm" != "n" ]; then
  ./github.zsh
fi

read -p "Setup OSU? (y/N) " osuconfirm
if [ "$osuconfirm" = "y" ]; then
  ./osu.zsh
fi
