{
  lib,
  pkgs,
  ...
}:
{
  # configure fnm (Fast Node Manager) on shell
  programs.zsh.initContent = lib.mkAfter ''
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
  '';
}
