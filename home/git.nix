{ primaryUser, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Luca Di Bello";
        email = "lucadibello@proton.me";
      };

      extraConfig = {
        github = {
          user = primaryUser;
        };
        init = {
          defaultBranch = "main";
        };
      };
    };

    lfs.enable = true;

    ignores = [ "**/.DS_STORE" ];
  };
}
