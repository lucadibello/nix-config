{ primaryUser, ... }:
{
  imports = [
    ./git.nix
    ./packages.nix
    ./sdkman.nix
    ./fnm.nix
    ./zsh.nix
    ./starship.nix
    ./tmux.nix
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

      # Ollama (read by `ollama serve`), tuned for minuet-ai + Zeta in Neovim:
      # keep the model loaded (default unloads after 5 min idle, ~1.3s reload)
      OLLAMA_KEEP_ALIVE = "1h";
      # two KV-cache slots so Duet (normal mode) doesn't evict the inline
      # completion cache (insert mode); ~0.5GB extra at a 4k context
      OLLAMA_NUM_PARALLEL = "2";
    };
  };
}
