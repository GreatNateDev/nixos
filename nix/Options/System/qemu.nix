{
  config,
  lib,
  pkgs,
  ...
}:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  username = env.username;
in
{
  options.qemu.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "QEMU Support";
  };

  config = lib.mkIf config.qemu.enable {
    home-manager.users.${username}.qemu.enable = true;
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
      };
    };

  };
}
