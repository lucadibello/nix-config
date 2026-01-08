{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };
    casks = [
      # social
      "microsoft-teams"
      "whatsapp"

      # academic writing
      "quarto"

      # utility
      "anki"
      "basictex"
      "nextcloud"
      "google-drive"
      "notion"
      "shortcat"
      "utm"
      "zotero"

      # dev
      "android-studio"
      "docker-desktop"
      "visual-studio-code"

      # vpn
      "cloudflare-warp"

      # ai
      "chatgpt"
      "claude"

      # browsers
      "zen"

      # NOTE: to fix aerospace issues: Settings -> Browsing -> disable Link Previews from all apps
      # (source: https://github.com/nikitabobko/AeroSpace/discussions/989#discussioncomment-14406284)
      "orion"
    ];
  };
}
