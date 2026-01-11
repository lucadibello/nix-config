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
      "basictex"

      # note-taking and study
      "anki"
      "notion"
      "obsidian"
      "zotero"

      # cloud
      "nextcloud"
      "google-drive"

      # hypervisors
      "utm"

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

      # additional tools
      "shortcat"
    ];
  };
}
