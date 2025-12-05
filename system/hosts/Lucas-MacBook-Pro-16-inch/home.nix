{ pkgs, ... }:
{
  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      tmux
      neovim
      starship
      ripgrep
      fzf
      bat
      eza
      zoxide
      atuin
      codex
      tmuxinator
      gemini-cli
      statix # linter / formatter for nix lang
      nixfmt # formatter for nix lang
      lazygit
      lazydocker
      maven
      pandoc
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Configuration files (.config)
  xdg = {
    configFile = {
      "starship.toml".source = ../../config/starship.toml;
      "ghostty/config".source = ../../config/ghostty/config;
      "borders/bordersrc".source = ../../config/borders/bordersrc;
      "zathura/zathurarc".source = ../../config/zathura/zathurarc;
    };
  };

  # Hoem files (in home directory ~)
  home.file = {
    ".tmux.conf".source = ../../config/tmux.conf;
    ".aerospace.toml".source = ../../config/aerospace.toml;
  };

  programs.zsh = {
    enable = true;
    shellAliases = { };
    initContent = builtins.readFile ../../config/zshrc;
  };
}
