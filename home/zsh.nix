{ darwinConfig, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "vi-mode"
          "tmux"
        ];
      };

      shellAliases = {
        la = "ls -la";
        ".." = "cd ..";
        "nix-switch" =
          "sudo darwin-rebuild switch --flake ~/Developer/nix-config#${darwinConfig.networking.hostName}";
        gcof = "git branch -a --sort=-committerdate | fzf --tac | sed 's/\\*//' | sed 's/remotes\/origin\///' | tr -d ' ' | xargs git checkout";
        gg = "git log --all --decorate --oneline --graph";
      };

      initExtra = ''
        function karabiner_import() {
          if [ ! -f "$1" ]; then
            echo "[ERROR] File not found: $1"
            return 1
          fi
          open "karabiner://karabiner/assets/complex_modifications/import?url=file://$(realpath "$1")"
        }
      '';
    };
  };
}
