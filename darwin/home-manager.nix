{
  config,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${primaryUser} = {
      imports = [
        ../home
      ];
    };
    extraSpecialArgs = {
      inherit inputs self primaryUser;
      darwinConfig = config;
    };
  };
}
