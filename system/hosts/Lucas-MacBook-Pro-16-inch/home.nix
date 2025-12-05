{ pkgs, ... }: {
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    tmux
    neovim
    starship
    ripgrep
    fzf
    bat
    eza
    zoxide
    atuin
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Configuration files
  # xdg.configFile."fish/config.fish".source = ../../config/fish/config.fish;
  xdg.configFile."starship.toml".source = ../../config/starship.toml;
  xdg.configFile."ghostty/config".source = ../../config/ghostty/config;
  xdg.configFile."borders/bordersrc".source = ../../config/borders/bordersrc;
  xdg.configFile."zathura/zathurarc".source = ../../config/zathura/zathurarc;
  
  # Map ghostty's tmux-attach.sh to where ghostty expects it
  xdg.configFile."tmux/tmux-attach.sh".source = ../../config/ghostty/tmux-attach.sh;

  home.file.".tmux.conf".source = ../../config/tmux.conf;
  home.file.".aerospace.toml".source = ../../config/aerospace.toml;
  # home.file.".zshrc".source = ../../config/zshrc; # Managed by programs.zsh

  programs.zsh = {
    enable = true;
    shellAliases = {
      # Add common aliases if not in zshrc, or let zshrc handle them.
      # For now, we will rely on initExtra to pull from zshrc.
    };
    initExtra = builtins.readFile ../../config/zshrc;
  };
}
