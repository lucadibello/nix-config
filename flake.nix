{
  description = "Luca's Darwin System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."Lucas-MacBook-Pro-16-inch" =
      nix-darwin.lib.darwinSystem {
        modules = [
          ./system/hosts/Lucas-MacBook-Pro-16-inch/default.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lucadibello =
              import ./system/hosts/Lucas-MacBook-Pro-16-inch/home.nix;
          }
        ];
      };

    darwinPackages = self.darwinConfigurations."Lucas-MacBook-Pro-16-inch".pkgs;
  };
}

