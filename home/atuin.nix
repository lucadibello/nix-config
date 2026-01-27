{ lib, ... }:
{
  programs.atuin = {
    enable = true;
    settings = {
      # set vi-mode
      keymap_mode = "vim-normal";
      style = "compact";

      # Catppuccin theme
      theme = {
        name = "catppuccin-mocha-mauve";
      };
    };
  };

  # Force overwrite atuin config if it already exists
  xdg.configFile."atuin/config.toml".force = lib.mkForce true;

  # Install Catppuccin Mocha Mauve theme
  xdg.configFile."atuin/themes/catppuccin-mocha-mauve.toml" = {
    text = ''
      [theme]
      name = "catppuccin-mocha-mauve"

      [colors]
      AlertInfo = "#a6e3a1"
      AlertWarn = "#fab387"
      AlertError = "#f38ba8"
      Annotation = "#cba6f7"
      Base = "#cdd6f4"
      Guidance = "#9399b2"
      Important = "#f38ba8"
      Title = "#cba6f7"
    '';
  };
}
