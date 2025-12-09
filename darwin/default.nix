{
  inputs,
  ...
}:
{
  imports = [
    ./home-manager.nix
    ./homebrew.nix
    ./settings.nix
    ./system.nix
    ./services.nix
    inputs.home-manager.darwinModules.home-manager
  ];

  # Necessary for using flakes on this system.
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Allow the unfree packages we explicitly include (e.g. claude-code).
  nixpkgs.config.allowUnfree = true;

  # enable nix-index for faster searching of packages
  programs.nix-index.enable = true;
}
