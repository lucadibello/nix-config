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
      bc

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
      go-task

      # --- Nix Tooling ---
      statix
      nixfmt

      # --- System & Version Control TUIs (Terminal User Interfaces) ---
      lazygit
      lazydocker

      # --- Runtimes, Build Tools & Documentation ---
      maven
      pandoc
      jdk21_headless

      # --- System Monitoring ---
      btop

      # --- AI Tools ---
      codex
      gemini-cli
      claude-code

      # --- Package Managers ---
      fnm
    ];
  };
}
