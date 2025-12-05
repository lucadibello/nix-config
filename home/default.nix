{ primaryUser, ... }:
{
  imports = [
    ./git.nix
    ./packages.nix
    ./shell.nix
    ./tmux.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.11";
    sessionVariables = {
      # shared environment variables
    };
  };
}
