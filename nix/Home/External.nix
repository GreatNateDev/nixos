{ ... }:
{
  home.file.".config/niri/config.kdl" = {
    source = ../../data/niri/config.kdl;
  };
  home.file.".config/waybar" = {
    source = ../../data/waybar;
    recursive = true;
  };
  #  home.file.".config/nvim" = {
  #    source = ../../data/nvim;
  #    recursive = true;
  # };
  home.file.".config/user-dirs.dirs" = {
    source = ../../data/user-dirs.dirs;
  };
  home.file.".face".source = ../../data/pfp.png;
  home.file.".config/fastfetch/config.jsonc".source = ../../data/fastfetch/config.jsonc;

}
