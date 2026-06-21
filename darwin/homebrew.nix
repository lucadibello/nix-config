{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [
      # neovim
      "neovim"
    ];

    casks = [
      # social
      "microsoft-teams"
      "whatsapp"

      # other microslop software
      "microsoft-powerpoint"

      # academic writing
      "quarto"

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
      "zed"
      "android-studio"
      "docker-desktop"
      "visual-studio-code"

      # vpn
      "cloudflare-warp"

      # ai
      "chatgpt"
      "claude"
      "claude-code"
      "antigravity-cli"

      # browsers
      "zen"
      "vivaldi"

      # password managers
      "bitwarden"

      # keyboard-centric workflow
      "shortcat"
    ];
  };
}
