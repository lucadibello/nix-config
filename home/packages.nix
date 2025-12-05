{ pkgs, ... }:
{
  home = {
    stateVersion = "25.11";
    packages = with pkgs; [
      tmux
      neovim
      starship
      ripgrep
      fzf
      bat
      eza
      zoxide
      atuin
      codex
      tmuxinator
      gemini-cli
      statix # linter / formatter for nix lang
      nixfmt # formatter for nix lang
      lazygit
      lazydocker
      maven
      pandoc
    ];
  };
}
