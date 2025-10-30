{
  description = "My NixOS system with Home Manager (unstable)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      actualUser = builtins.getEnv "SUDO_USER";
      user = if actualUser != "" then actualUser else builtins.getEnv "USER";
      env = import /home/${user}/.config/nixos/nix/env.nix;
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.${env.hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs pkgs-stable;
        };
        modules = [
          ./System.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users =
              let
                actualUser = builtins.getEnv "SUDO_USER";
                user = if actualUser != "" then actualUser else builtins.getEnv "USER";
                env = import /home/${user}/.config/nixos/nix/env.nix;
              in
              {
                ${env.username} = import ./Home.nix;
              };
            home-manager.extraSpecialArgs = {
              inherit inputs pkgs-stable;
            };
          }
          {
            nix.extraOptions = ''
              warn-dirty = false
            '';
            nix.settings = {
              substituters = [ "https://hyprland.cachix.org" ];
              trusted-substituters = [ "https://hyprland.cachix.org" ];
              trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
            };
          }
        ];
      };
    };
}
