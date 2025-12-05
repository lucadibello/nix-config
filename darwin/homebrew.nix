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
}
