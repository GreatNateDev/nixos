{...}: {
  home.activation.applyAdwSteamGtk = ''
    echo "Applying AdwSteamGtk theme..."
    ${pkgs.adwsteamgtk}/bin/adwaita-steam-gtk --install 
  '';
}