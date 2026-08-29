{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [
      "neovim"
      "opencode"
      "llmfit"
      "ollama"
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
      "antigravity-cli"

      # browsers
      "zen"
      "helium-browser"

      # password managers
      "bitwarden"

      # keyboard-centric workflow
      "shortcat"

      # gaming
      "steam"
    ];
  };
}
