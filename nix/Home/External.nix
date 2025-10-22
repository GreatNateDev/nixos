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
  home.file.".config/BraveSoftware/Brave-Browser/Default/Preferences".text = builtins.toJSON {
    # Home page settings - Startpage
    homepage = "https://www.startpage.com";
    homepage_is_newtabpage = false;
    session = {
      restore_on_startup = 4; # Open specific pages
      startup_urls = [
        "https://www.startpage.com"
      ];
    };
  };
}
