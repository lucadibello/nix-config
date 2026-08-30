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
      "mole"
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

      # additional tooling
      "stats"

      # gaming
      "steam"
    ];
  };
}
