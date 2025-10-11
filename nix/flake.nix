{
  description = "My NixOS system with Home Manager (unstable)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };

        modules = [
          ./System.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nate = import ./Home.nix;
            home-manager.extraSpecialArgs = {
              pkgs-stable = import nixpkgs-stable {
                system = "x86_64-linux";
                config.allowUnfree = true;
              };
            };

            # Disable "Git tree is dirty" warning
            nix.extraOptions = ''
              warn-dirty = false
            '';
          }
        ];
      };
    };
}
