{ pkgs, ... }:
{
  home.activation.applyAdwSteamGtk = ''
    echo "Applying AdwSteamGtk theme..."
    ${pkgs.adwsteamgtk}/bin/adwaita-steam-gtk --install
  '';
  home.activation.ensureCutterConfig = ''
    mkdir -p ~/.config/rizin
        cp -f ${../../data/cutter/cutter.ini} ~/.config/rizin/cutter.ini
        chmod u+w ~/.config/rizin/cutter.ini
  '';
}
