{ primaryUser, ... }:
{
  imports = [
    ./git.nix
    ./packages.nix
    ./sdkman.nix
    ./zsh.nix
    ./starship.nix
    ./tmux.nix
    ./atuin.nix
    ./zoxide.nix
    ./fzf.nix
    ./ghostty.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.11";
    sessionVariables = {
      # shared environment variables
    };
  };
}
