{ pkgs, ... }:
let
  clientConfig = ''
    # ntfy client configuration
    default-host: https://ntfy.home.lucadibello.ch

    subscribe:
      - topic: lucadibello-homelab-status
        command: /usr/bin/osascript -e 'on run argv' -e 'display notification (item 1 of argv) with title (item 2 of argv) sound name "default"' -e 'end run' "''${m:-Notification received}" "''${t:-lucadibello-homelab-status}"
  '';
in
{
  home.packages = [ pkgs.ntfy-sh ];

  # Configure ntfy client for macOS and standard XDG locations
  home.file."Library/Application Support/ntfy/client.yml".text = clientConfig;
  xdg.configFile."ntfy/client.yml".text = clientConfig;
}
