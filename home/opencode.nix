{
  programs.opencode = {
    package = null; # NOTE: installed via homebrew
    enable = true;

    # custom rules
    rules = ''
      # Agent Instructions

      ## Tool Usage & Context Acquisition
      - **Automatic Documentation:** Always invoke the `context7` MCP tool via the Docker gateway for library/API documentation or configuration steps.

      ## Cognitive Process (Sequential Thinking)
      - **Activation Trigger:** You MUST invoke the `sequentialthinking` tool for:
          - Architecting new features or complex refactors.
          - Debugging "logical" bugs where the code runs but produces wrong output.
          - Any task requiring more than 3 distinct implementation steps.
      - **Methodology:** - Start with a realistic `total_thoughts` estimate.
          - Use `is_revision` if a `context7` lookup or local file read contradicts your initial plan.
          - Ensure `next_thought_needed` is true until a verified solution hypothesis is reached.

      ## Technical Standards
      - **Clean Code:** When providing code edits, do not add comments pointing out previous errors or specific lines changed.
      - **Documentation (LaTeX):** Always use `\autoref{...}` for citing tables, images, listings, and sections.
    '';

    # settinsg
    settings = {
      # general
      autoupdate = true;
      theme = "kanagawa";

      # custom MCP servers
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
      };
    };
  };
}
