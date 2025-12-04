{ pkgs, lib, ... }:
{
  home.activation.killstupidfile = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ~/.gtkrc-2.0
  '';

}
