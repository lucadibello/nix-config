{ primaryUser, ... }:
{
  networking.hostName = "Lucas-MacBook-Pro-16-inch";

  homebrew.casks = [
    "karabiner-elements"
  ];

  home-manager.users.${primaryUser} = {
    imports = [
      ../../home/karabiner.nix
    ];
  };
}
