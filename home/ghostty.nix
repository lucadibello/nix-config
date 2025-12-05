{
  # Install Ghostty config files (installed with brew - not manged by home-manager)
  xdg = {
    configFile = {
      "ghostty/config".source = ../config/ghostty/config;
    };
  };
}
