{ ... }:
{
  home.file = {
    ".config/waybar" = {
      source = ../../data/waybar;
      recursive = true;
    };
    ".config/fastfetch/config.jsonc".source = ../../data/fastfetch/config.jsonc;
  };

}
