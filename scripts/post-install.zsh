#manually run this script to finish setup by downloading game progress and signing into personal accounts
echo -n "Setup GitHub? (Y/n) "
read githubconfirm
if [ "$githubconfirm" != "n" ]; then
  ./github.zsh
fi
echo -n "Setup OSU? (y/N) "
read osuconfirm
if [ "$osuconfirm" = "y" ]; then
  ./osu.zsh
fi
