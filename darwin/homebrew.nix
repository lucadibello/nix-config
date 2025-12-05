{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };
    brews = [ "jenv" ];
    casks = [
      # social
      "microsoft-teams"
      "whatsapp"

      # utility
      "anki"
      "mactex-no-gui"
      "nextcloud"
      "notion"
      "shortcat"
      "utm"
      "zotero"

      # dev
      "android-studio"
      "docker-desktop"
      "ghostty"
      "visual-studio-code"
      "warp"
      "zed"

      # ai
      "chatgpt"

      # browsers
      "zen"
    ];
  };

  # Install Ghostty config files (installed with brew - not manged by home-manager)
  xdg = {
    configFile = {
      "ghostty/config".source = ../../config/ghostty/config;
    };
  };
}
