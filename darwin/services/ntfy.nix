{ pkgs, ... }:
{
  # Run ntfy client subscriber as a user LaunchAgent to listen for push notifications
  launchd.user.agents.ntfy = {
    command = "${pkgs.ntfy-sh}/bin/ntfy subscribe --from-config";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/ntfy.out.log";
      StandardErrorPath = "/tmp/ntfy.err.log";
      EnvironmentVariables = {
        PATH = "/usr/bin:/bin:/usr/sbin:/sbin:/run/current-system/sw/bin";
      };
    };
  };
}
