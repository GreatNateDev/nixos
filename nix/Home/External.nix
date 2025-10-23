{ ... }:
{
  home.file.".config/niri/config.kdl" = {
    source = ../../data/niri/config.kdl;
  };
  home.file.".config/waybar" = {
    source = ../../data/waybar;
    recursive = true;
  };
  home.file.".config/nvim" = {
    source = ../../data/nvim;
    recursive = true;
  };
  home.file.".config/user-dirs.dirs" = {
    source = ../../data/user-dirs.dirs;
  };
  home.file.".face".source = ../../data/nate.png;
  home.file."/home/nate/.librewolf/librewolf.overrides.cfg" = {
    source = ../../data/librewolf/librewolf.overrides.cfg;
  };
}
