{
  # Install Ghostty config files (installed with brew - not manged by home-manager)
  xdg = {
    configFile = {
      "ghostty/config".source = ../config/ghostty/config;
      "ghostty/shaders/cursor_blaze.glsl".source = ../config/ghostty/shaders/cursor_blaze.glsl;
    };
  };
}
