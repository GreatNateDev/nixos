{
  config,
  pkgs,
  inputs,
  ...
}:

let
  astalPkgs = inputs.astal.packages.${pkgs.system};
in
{
  home.packages = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "my-shell";
      src = ../../data/astal;

      nativeBuildInputs = [
        pkgs.wrapGAppsHook3
        pkgs.gobject-introspection
        pkgs.esbuild
        pkgs.meson
        pkgs.ninja
        pkgs.pkg-config
        pkgs.blueprint-compiler
        pkgs.dart-sass
      ];

      buildInputs = [
        pkgs.gjs
        pkgs.glib
        pkgs.gtk4
        pkgs.gtk4-layer-shell
        astalPkgs.astal4
        astalPkgs.battery
        astalPkgs.wireplumber
        astalPkgs.network
        astalPkgs.mpris
        astalPkgs.powerprofiles
        astalPkgs.tray
        astalPkgs.bluetooth
        astalPkgs.io
      ];

      postInstall = ''
        chmod +x $out/bin/*
        chmod +x $out/share/simple-bar/*.js
      '';
    })
  ];
}
