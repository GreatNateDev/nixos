{ pkgs, lib, ... }:
{
  home.activation.ensureCutterConfig = ''
    mkdir -p ~/.config/rizin
        cp -f ${../../data/cutter/cutter.ini} ~/.config/rizin/cutter.ini
        chmod u+w ~/.config/rizin/cutter.ini
  '';
  home.activation.killstupidfile = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ~/.gtkrc-2.0
  '';

}
