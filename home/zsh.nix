{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        la = "ls -la";
        ".." = "cd ..";
        "nix-switch" = "sudo darwin-rebuild switch --flake ~/Developer/nix-config";
      };
    };
  };
}
