{ pkgs, ... }:
{
  # Use repo-relative path so it works regardless of where the repo is checked out
  # imports = [ ../../darwin/aerospace.nix ];

  # List packages installed in system profile.
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;
  programs = {
    zsh.enable = true;
    nix-index.enable = true;
  };

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

  nixpkgs.hostPlatform = "aarch64-darwin";
  system = {
    stateVersion = 6;
    primaryUser = "lucadibello";
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  users.users.lucadibello = {
    home = "/Users/lucadibello";
    uid = 501;
  };

  # Fonts
  # fonts.packages = with pkgs;
  #   [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;
}
