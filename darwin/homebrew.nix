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
      "terminal-notifier"
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
      "claude-code"

      # browsers
      "zen"

      # password managers
      "bitwarden"

      # keyboard-centric workflow
      "shortcat"

      # additional tooling
      "stats"
      "openlogi"

      # gaming
      "steam"
      "discord"
    ];
  };

  # session variables
  launchd.user.envVariables = {
    OLLAMA_KEEP_ALIVE = "1h"; # default unloads the model after 5 min idle
    OLLAMA_NUM_PARALLEL = "2"; # separate KV caches for Duet and inline completions
    # llama.cpp prompt cache in RAM (default 8GB): on 16GB it pushes the weights into swap
    LLAMA_ARG_CACHE_RAM = "1024";
  };
}
