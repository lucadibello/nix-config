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
      (texlive.combine {
        inherit (texlive)
          scheme-medium
          # build tools
          latexmk

          # bibliography
          biblatex
          biber

          # beamer / presentations
          beamer
          beamertheme-metropolis
          pgfopts

          # figures & graphics
          tikz-cd
          pgfplots

          # tables
          booktabs
          multirow
          makecell

          # math & science
          amsmath
          mathtools
          siunitx
          algorithms
          algorithmicx
          algorithm2e
          listings
          minted

          # typography & layout
          microtype
          geometry
          fancyhdr
          setspace
          parskip
          titlesec
          enumitem

          # references & links
          hyperref
          cleveref

          # utilities
          xcolor
          caption
          float
          csquotes
          appendix
          todonotes
          glossaries
          lipsum

          # fonts
          raleway
          fontawesome
          ;
      })

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
