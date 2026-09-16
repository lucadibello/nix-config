{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;

    settings = {
      # Visual & Theme
      theme = "catppuccin-mocha";
      default_layout = "default";
      pane_frames = true;
      simplified_ui = false;

      # Shell & Environment
      default_shell = "${pkgs.zsh}/bin/zsh";
      scroll_buffer_size = 50000;

      # Clipboard & Selection
      copy_command = "pbcopy";
      copy_clipboard = "system";
      copy_on_select = true;
    };

    layouts = {
      default = ''
        layout {
            default_tab_template {
                pane size=1 borderless=true {
                    plugin location="zellij:tab-bar"
                }
                children
                pane size=2 borderless=true {
                    plugin location="zellij:status-bar"
                }
            }
        }
      '';
    };

    extraConfig = ''
      ui {
          pane_frames {
              rounded_corners true
          }
      }
    '';
  };
}
