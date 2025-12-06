{
  description = "Luca's Darwin System Configuration";

  inputs = {
    # monorepo w/ recipes ("derivations")
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    # system-level software and settings (macOS)
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # manages configs
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
    }@inputs:
    let
      primaryUser = "lucadibello";
    in
    {
      darwinConfigurations."Lucas-MacBook-Pro-16-inch" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin # home manager + default configs
          ./hosts/Lucas-MacBook-Pro-16-inch/configuration.nix # laptop configuration
        ];
        specialArgs = { inherit inputs self primaryUser config; };
      };
      darwinConfigurations."Lucas-Mac-mini" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin # home manager + default configs
          ./hosts/Lucas-Mac-mini/configuration.nix # Mac Mini configuration
        ];
        specialArgs = { inherit inputs self primaryUser config; };
      };
    };
}
