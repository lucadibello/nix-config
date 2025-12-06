{
  networking.hostName = "Lucas-Mac-mini";

  # override default darwin settings
  security.pam.services.sudo_local = {
    enable = true;
    reattach = true;
    touchIdAuth = false; # not available on Mac Mini
    watchIdAuth = true;
  };
}
