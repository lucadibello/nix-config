{
  programs.zsh = {
    enable = true;
    shellAliases = { };
    initContent = builtins.readFile ../config/zshrc;
  };
}
