{ pkgs, ... }:
let
  # Notification helper script that sends native macOS notifications with custom app icon
  ntfyNotify = pkgs.writeShellScriptBin "ntfy-macos-notify" ''
    # Find terminal-notifier from Homebrew (/opt/homebrew/bin or /usr/local/bin) or PATH
    if [ -x "/opt/homebrew/bin/terminal-notifier" ]; then
      NOTIFIER="/opt/homebrew/bin/terminal-notifier"
    elif [ -x "/usr/local/bin/terminal-notifier" ]; then
      NOTIFIER="/usr/local/bin/terminal-notifier"
    elif command -v terminal-notifier >/dev/null 2>&1; then
      NOTIFIER="$(command -v terminal-notifier)"
    else
      NOTIFIER=""
    fi

    # Read title & message from positional args (passed from client.yml) or environment variables
    MESSAGE="''${1:-''${message:-''${m:-Notification received}}}"
    TITLE="''${2:-''${title:-''${t:-lucadibello-homelab-status}}}"

    if [ -n "$NOTIFIER" ]; then
      if ! "$NOTIFIER" \
        -title "$TITLE" \
        -message "$MESSAGE" \
        -group "lucadibello-homelab-status" \
        -sound default; then
        # Fallback to osascript if terminal-notifier encounters a runtime error
        /usr/bin/osascript -e 'on run argv' -e 'display notification (item 1 of argv) with title (item 2 of argv) sound name "default"' -e 'end run' "$MESSAGE" "$TITLE"
      fi
    else
      /usr/bin/osascript -e 'on run argv' -e 'display notification (item 1 of argv) with title (item 2 of argv) sound name "default"' -e 'end run' "$MESSAGE" "$TITLE"
    fi
  '';

  clientConfig = ''
    # ntfy client configuration
    default-host: https://ntfy.home.lucadibello.ch

    subscribe:
      - topic: lucadibello-homelab-status
        command: ${ntfyNotify}/bin/ntfy-macos-notify "$message" "$title"
  '';
in
{
  home.packages = [
    pkgs.ntfy-sh
    ntfyNotify
  ];

  # Configure ntfy client for macOS and standard XDG locations
  home.file."Library/Application Support/ntfy/client.yml".text = clientConfig;
  xdg.configFile."ntfy/client.yml".text = clientConfig;
}
