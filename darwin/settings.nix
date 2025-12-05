{
  pkgs,
  primaryUser,
  ...
}:
{
  # macOS-specific settings
  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}";
    shell = pkgs.zsh;
  };

  environment = {
    systemPath = [
      "/opt/homebrew/bin"
    ];
    shells = [
      pkgs.zsh
    ];
    pathsToLink = [ "/Applications" ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      XDG_CONFIG_HOME = "/Users/${primaryUser}/.config";
    };
  };
}
