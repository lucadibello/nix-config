{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [
      # ai
      "opencode"
      # airdrop-cli (https://github.com/vldmrkl/airdrop-cli)
      "vldmrkl/formulae/airdrop-cli"
    ];

    casks = [
      # social
      "microsoft-teams"
      "whatsapp"

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
      "google-gemini"

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
