{ lib, ... }:
{
  networking.hostName = "Lucas-Mac-Mini";

  # override default darwin settings
  security.pam.services.sudo_local = {
    enable = true;
    reattach = true;
    touchIdAuth = lib.mkForce false; # I don't have a touch ID sensor on my Mac Mini
    watchIdAuth = true;
  };

  # Install steam
  homebrew = {
    enable = true;
    casks = [
      # gaming
      "steam"
      "roblox"
    ];
  };
}
