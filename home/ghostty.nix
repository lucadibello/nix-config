{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin; # darwin variant

    enableZshIntegration = true;
    installVimSyntax = true;

    settings = {
      # enable clipboard
      clipboard-read = "allow";
      clipboard-write = "allow";

      # set terminal looks
      font-size = 20;
      font-family = "JetBrains Mono";
      theme = "Github Dark";
      background-opacity = 0.95;

      # Intialize tmux session named 'core'
      command = "${pkgs.tmux}/bin/tmux new-session -A -s core";

      # Enable font features font-feature = calt
      font-feature = [
        "ss01"
        "ss02"
        "ss03"
        "ss04"
        "ss05"
        "ss06"
        "ss07"
        "ss08"
        "ss09"
        "liga"
      ];

      window-save-state = "default";

      # Set shell integration features
      shell-integration = "zsh";
      shell-integration-features = [
        "cursor"
        "title"
        "sudo"
      ];
      # Set shaders
      custom-shader = "~/.config/ghostty/shaders/cursor_blaze.glsl";
    };
  };

  # Install shaders for ghostty
  xdg = {
    configFile = {
      "ghostty/shaders/cursor_blaze.glsl".source = ../config/ghostty/shaders/cursor_blaze.glsl;
    };
  };
}
