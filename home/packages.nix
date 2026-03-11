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

      # --- interpreters ---
      python3

      # --- Terminal Experience ---
      ghostty-bin
      tmux
      starship
      tmuxinator

      # --- Editor & Search ---
      neovim
      ripgrep
      fzf
      zed-editor

      # --- CLI Utilities & Modern Replacements ---
      bat
      eza
      zoxide
      atuin
      yazi
      mise
      go-task

      # --- Nix Tooling ---
      nixd
      nil
      statix
      nixfmt

      # --- System & Version Control TUIs (Terminal User Interfaces) ---
      lazygit
      lazydocker

      # --- Runtimes, Build Tools & Documentation ---
      maven
      pandoc

      # --- System Monitoring ---
      btop

      # --- Package Managers ---
      fnm

      # --- Fonts ---
      jetbrains-mono
      # install nerd font variant for terminal icons
      (pkgs.nerd-fonts.jetbrains-mono)
    ];
  };
}
