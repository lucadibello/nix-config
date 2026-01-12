{
  xdg.configFile."opencode/AGENTS.md".source = ../config/opencode/AGENTS.md;

  programs.opencode = {
    settings = {
      autoupdate = true;
      theme = "kanagawa";

      mcp = {
        # Docker MCP gateway configuration
        "MCP_DOCKER" = {
          type = "local";
          command = [
            "docker"
            "mcp"
            "gateway"
            "run"
          ];
          enabled = true;
        };

        # might be removed later is docker mcp actually works!
        "context7" = {
          type = "remote";
          url = "https://mcp.context7.com/mcp";
        };
      };
    };
  };
}
