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
        "nix-switch" = "sudo darwin-rebuild switch --flake ~/Developer/nix-config";
        gcof = "git branch -a --sort=-committerdate | fzf --tac | sed 's/\\*//' | sed 's/remotes\/origin\///' | tr -d ' ' | xargs git checkout";
        gg = "git log --all --decorate --oneline --graph";
      };

      # FIXME: find bettwer solution to source the theme
      # initContent = ''
      #    tmux source-file ~/.config/tmux/tmux.conf
      # '';
    };
  };
}
