{
  services.aerospace = {
    enable = true;

    settings = {
      # Commands to execute after log-in
      after-login-command = [ ];
      # Commands to execute after AeroSpace starts
      after-startup-command = [ ];
      # Enable tree normalization
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      # Accoriding layout settings
      accordion-padding = 30;
      # Possible values: tiles|accordion
      default-root-container-layout = "tiles";
      # Automatically detects monitor orientation (horizontal/vertical)
      default-root-container-orientation = "auto";
      # Mouse follows focus when focused monitor changes
      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      # Disable MacOS hide feature (using cmd+h)
      automatically-unhide-macos-hidden-apps = true;
      # use qwerty layout for key mapping
      key-mapping.preset = "qwerty";

      # Gaps between windows across all monitors
      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer = {
          left = 10;
          bottom = 10;
          top = 10;
          right = 10;
        };
      };

      # Main binding mode declaration
      mode = {
        main.binding = {
          alt-enter = "exec-and-forget open -a Ghostty";
          alt-slash = "layout tiles horizontal vertical";
          alt-comma = "layout accordion horizontal vertical";

          # See: https://nikitabobko.github.io/AeroSpace/commands#focus
          alt-h = "focus left";
          alt-j = "focus down";
          alt-k = "focus up";
          alt-l = "focus right";

          # See: https://nikitabobko.github.io/AeroSpace/commands#move
          alt-shift-h = "move left";
          alt-shift-j = "move down";
          alt-shift-k = "move up";
          alt-shift-l = "move right";

          # See: https://nikitabobko.github.io/AeroSpace/commands#resize
          alt-shift-minus = "resize smart -50";
          alt-shift-equal = "resize smart +50";

          # Define available workspaces
          ## Main monitor (general purpose)
          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          ## Second monitor (general purpose)
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";
          alt-6 = "workspace 6";

          # special workspaces
          alt-b = "workspace B"; # browser
          alt-c = "workspace C"; # chatgpt
          alt-s = "workspace S"; # social (whatsapp)
          alt-m = "workspace M"; # music
          alt-n = "workspace N"; # notion
          alt-t = "workspace T"; # terminal
          alt-w = "workspace W"; # work
          alt-u = "workspace U"; # utility
          alt-g = "workspace G"; # gaming

          # additonal workspaces
          alt-q = "workspace Q"; # random

          # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
          # Corresponding changes for moving windows to these workspaces
          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace 4";
          alt-shift-5 = "move-node-to-workspace 5";
          alt-shift-6 = "move-node-to-workspace 6";

          alt-shift-b = "move-node-to-workspace B"; # browser
          alt-shift-c = "move-node-to-workspace C"; # chatgpt
          alt-shift-s = "move-node-to-workspace S"; # social (whatsapp)
          alt-shift-m = "move-node-to-workspace M"; # music
          alt-shift-n = "move-node-to-workspace N"; # notion
          alt-shift-t = "move-node-to-workspace T"; # terminal
          alt-shift-w = "move-node-to-workspace W"; # work
          alt-shift-u = "move-node-to-workspace U"; # utility
          alt-shift-g = "move-node-to-workspace G"; # gaming
          alt-shift-q = "move-node-to-workspace Q";

          # move workspaces around (same monitor / multiple monitors)
          alt-tab = "workspace-back-and-forth";
          alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
          alt-shift-slash = "move-workspace-to-monitor next";
          alt-shift-comma = "move-workspace-to-monitor prev";

          # switch between different modes
          alt-shift-f = "fullscreen"; # toggle fullscreen mode
          # toggle resize mode (allows to resize windows using a different set of keys
          alt-shift-r = "mode resize";
          # toggle service mode (allows to join windows, flatten workspace tree, etc. using a different set of keys)
          alt-shift-semicolon = "mode service";
        };
      };

      mode.service.binding = {
        # exit service mode
        esc = [
          "reload-config"
          "mode main"
        ];
        # reset current workspace
        r = [
          "flatten-workspace-tree"
          "mode main"
        ]; # reset layout
        # set window as floating
        f = [
          "layout floating tiling"
          "mode main"
        ];
        # close / hide windows
        w = [
          "close"
          "mode main"
        ];
        m = [ "macos-native-minimize" ];
        backspace = [
          "close-all-windows-but-current"
          "mode main"
        ];
        # join trees in different directions
        "alt-shift-h" = [
          "join-with left"
          "mode main"
        ];
        "alt-shift-j" = [
          "join-with down"
          "mode main"
        ];
        "alt-shift-k" = [
          "join-with up"
          "mode main"
        ];
        "alt-shift-l" = [
          "join-with right"
          "mode main"
        ];
        # control volume
        up = [ "volume up" ];
        down = [ "volume down" ];
      };

      mode.resize.binding = {
        # vim motion keys
        h = "resize width -50";
        l = "resize width +50";
        j = "resize height +50";
        k = "resize height -50";
        # arrow keys
        left = "resize width -50";
        right = "resize width +50";
        down = "resize height +50";
        up = "resize height -50";
        # exit mode (two keybindings)
        esc = "mode main";
        enter = "mode main";
      };
      on-window-detected = [
        # ---------- Browsers → workspace B ----------
        {
          "if" = {
            app-id = "com.apple.Safari";
          };
          run = [ "move-node-to-workspace B" ];
        }
        {
          "if" = {
            app-id = "com.google.Chrome";
          };
          run = [ "move-node-to-workspace B" ];
        }
        {
          "if" = {
            app-id = "org.mozilla.firefox";
          };
          run = [ "move-node-to-workspace B" ];
        }
        {
          "if" = {
            app-id = "com.brave.Browser";
          };
          run = [ "move-node-to-workspace B" ];
        }
        {
          "if" = {
            app-id = "company.thebrowser.Browser";
          }; # Arc
          run = [ "move-node-to-workspace B" ];
        }
        {
          "if" = {
            app-id = "org.torproject.torbrowser";
          }; # Tor
          run = [ "move-node-to-workspace B" ];
        }
        {
          "if" = {
            app-id = "app.zen-browser.zen";
          }; # Zen
          run = [ "move-node-to-workspace B" ];
        }

        # ---------- ChatGPT → workspace C ----------
        {
          "if" = {
            app-id = "com.openai.chat";
          }; # ChatGPT
          run = [ "move-node-to-workspace C" ];
        }

        # ---------- Social → workspace S ----------
        {
          "if" = {
            app-id = "com.tdesktop.Telegram";
          };
          run = [ "move-node-to-workspace S" ];
        }
        {
          # Slack (if you prefer in Work, move it below)
          "if" = {
            app-id = "com.tinyspeck.slackmacgap";
          };
          run = [ "move-node-to-workspace S" ];
        }
        {
          "if" = {
            app-id = "net.whatsapp.WhatsApp";
          };
          run = [ "move-node-to-workspace S" ];
        }

        # ---------- Music → workspace M ----------
        {
          "if" = {
            app-id = "com.apple.Music";
          };
          run = [ "move-node-to-workspace M" ];
        }
        {
          "if" = {
            app-id = "com.spotify.client";
          };
          run = [ "move-node-to-workspace M" ];
        }

        # ---------- Notion → workspace N ----------
        {
          "if" = {
            app-id = "notion.id";
          };
          run = [ "move-node-to-workspace N" ];
        }

        # ---------- Terminals → workspace T ----------
        {
          "if" = {
            app-id = "com.mitchellh.ghostty";
          };
          # Note: If you want floating layout, the run value must be a list of commands
          run = [ "move-node-to-workspace T" ]; # To float: ["layout floating" "move-node-to-workspace T"]
        }
        {
          "if" = {
            app-id = "org.alacritty";
          };
          run = [ "move-node-to-workspace T" ];
        }
        {
          "if" = {
            app-id = "com.googlecode.iterm2";
          };
          run = [ "move-node-to-workspace T" ];
        }
        {
          "if" = {
            app-id = "net.kovidgoyal.kitty";
          };
          run = [ "move-node-to-workspace T" ];
        }
        {
          "if" = {
            app-id = "com.apple.Terminal";
          };
          run = [ "move-node-to-workspace T" ];
        }
        {
          "if" = {
            app-id = "com.github.wez.wezterm";
          };
          run = [ "move-node-to-workspace T" ];
        }

        # ---------- Work / Dev → workspace W ----------
        {
          "if" = {
            app-id = "com.microsoft.VSCode";
          };
          run = [ "move-node-to-workspace W" ];
        }
        {
          "if" = {
            app-id = "com.jetbrains.intellij";
          };
          run = [ "move-node-to-workspace W" ];
        }
        {
          "if" = {
            app-id = "com.jetbrains.intellij.ce";
          };
          run = [ "move-node-to-workspace W" ];
        }
        {
          "if" = {
            app-id = "com.jetbrains.CLion";
          };
          run = [ "move-node-to-workspace W" ];
        }
        {
          "if" = {
            app-id = "com.jetbrains.pycharm";
          };
          run = [ "move-node-to-workspace W" ];
        }
        {
          "if" = {
            app-id = "com.jetbrains.pycharm.ce";
          };
          run = [ "move-node-to-workspace W" ];
        }
        {
          "if" = {
            app-id = "com.apple.dt.Xcode";
          };
          run = [ "move-node-to-workspace W" ];
        }
        # Note: Docker is listed twice in your original list (Work and Utilities).
        # I kept it here and moved the second instance to Utilities (U) below.
        {
          "if" = {
            app-id = "com.docker.docker";
          };
          run = [ "move-node-to-workspace W" ];
        }

        # ---------- Utilities → workspace U ----------
        {
          "if" = {
            app-id = "com.apple.finder";
          };
          run = [ "move-node-to-workspace U" ];
        }
        {
          "if" = {
            app-id = "com.apple.Preview";
          };
          run = [ "move-node-to-workspace U" ];
        }
        {
          "if" = {
            app-id = "com.apple.ActivityMonitor";
          };
          run = [ "move-node-to-workspace U" ];
        }
        {
          "if" = {
            app-id = "com.apple.DiskUtility";
          };
          run = [ "move-node-to-workspace U" ];
        }
        {
          "if" = {
            app-id = "com.apple.systempreferences";
          }; # System Settings
          run = [ "move-node-to-workspace U" ];
        }
        {
          "if" = {
            app-id = "com.docker.docker";
          };
          run = [ "move-node-to-workspace U" ];
        }
      ];
    };
  };
}
