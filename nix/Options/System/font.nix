{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.font.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Minecraft Font";
  };

  config = lib.mkIf config.font.enable {
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
  };
}
