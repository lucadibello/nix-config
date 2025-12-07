{ pkgs, ... }:
{
  home = {
    stateVersion = "25.11";
    packages = with pkgs; [
      # --- Shells & Environment ---
      zsh
      bash
      coreutils
      unzip
      zip
      gnutar
      gnused
      curl
      fd

      # --- Terminal Experience ---
      ghostty-bin
      tmux
      starship
      tmuxinator

      # --- Editor & Search ---
      neovim
      ripgrep
      fzf

      # --- CLI Utilities & Modern Replacements ---
      bat
      eza
      zoxide
      atuin

      # --- Nix Tooling ---
      statix
      nixfmt

      # --- System & Version Control TUIs (Terminal User Interfaces) ---
      lazygit
      lazydocker

      # --- Runtimes, Build Tools & Documentation ---
      maven
      pandoc
      nodejs_24
      jdk21_headless

      # --- System Monitoring ---
      btop

      # --- AI Tools ---
      codex
      gemini-cli
    ];
  };
}
