{ pkgs, ... }: {
  # List packages installed in system profile.
  environment.systemPackages =
    [ pkgs.vim pkgs.git ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;
  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    brews = [ "jenv" ];
    casks = [
      "shortcat"
      "chatgpt"
      "anki"
      "whatsapp"
      "aerospace"
      "ghostty"
    ];
  };

  # System settings
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "lucadibello";

  users.users.lucadibello = {
    home = "/Users/lucadibello";
    uid = 501;
  };
}
