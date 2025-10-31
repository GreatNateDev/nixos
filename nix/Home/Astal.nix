{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "my-shell";
      src = ../../data/astal; # Relative to nix/Home/Astal.nix

      nativeBuildInputs = [
        pkgs.wrapGAppsHook3
        pkgs.gobject-introspection
        pkgs.esbuild
        pkgs.meson
        pkgs.ninja
        pkgs.pkg-config
      ];

      buildInputs = [
        pkgs.gjs
        pkgs.glib
        pkgs.gtk4
        inputs.astal.packages.${pkgs.system}.io
        inputs.astal.packages.${pkgs.system}.astal4
      ];
    })
  ];
}
