{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    fontconfig.defaultFonts.monospace = [ "monocraft" ];
    fontconfig.defaultFonts.sansSerif = [ "minecraftia" ];
    fontconfig.defaultFonts.serif = [ "minecraftia" ];
    packages = with pkgs; [
      minecraftia
      monocraft
    ];
  };
}
