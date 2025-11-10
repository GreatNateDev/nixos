{ ... }:
{
  home.file.".config/waybar" = {
    source = ../../data/waybar;
    recursive = true;
  };
  home.file.".config/fastfetch/config.jsonc".source = ../../data/fastfetch/config.jsonc;

}
