{ pkgs, ... }:
let
  ntfyRunner = pkgs.writeShellScript "ntfy-runner" ''
    echo "[$(${pkgs.coreutils}/bin/date)] Starting ntfy background subscriber..."
    CONFIG_FILE="''${HOME}/Library/Application Support/ntfy/client.yml"
    if [ ! -f "$CONFIG_FILE" ]; then
      CONFIG_FILE="''${HOME}/.config/ntfy/client.yml"
    fi

    while true; do
      # Subscribe to topics defined in client.yml with explicit config path
      ${pkgs.ntfy-sh}/bin/ntfy subscribe --config "$CONFIG_FILE" --from-config
      exit_code=$?
      echo "[$(${pkgs.coreutils}/bin/date)] ntfy subscribe exited with code $exit_code. Reconnecting in 5 seconds..."
      ${pkgs.coreutils}/bin/sleep 5
    done
  '';
in
{
  # Run ntfy client subscriber as a user LaunchAgent to listen for push notifications
  launchd.user.agents.ntfy = {
    command = "${ntfyRunner}";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/ntfy.out.log";
      StandardErrorPath = "/tmp/ntfy.err.log";
      EnvironmentVariables = {
        PATH = "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/run/current-system/sw/bin";
      };
    };
  };
}
