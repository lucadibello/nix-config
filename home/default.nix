{ primaryUser, ... }:
{
  imports = [
    ./git.nix
    ./packages.nix
    ./sdkman.nix
    ./fnm.nix
    ./zsh.nix
    ./starship.nix
    # ./tmux.nix # Temporarily disabled in favor of zellij
    ./zellij.nix
    ./atuin.nix
    ./zoxide.nix
    ./fzf.nix
    ./ghostty.nix
    ./zed.nix
    ./opencode.nix
    ./ntfy.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.11";
    sessionVariables = {
      # shared environment variables
    };
  };
}
