{ pkgs, ... }:
let
  zellij-forgot = pkgs.fetchurl {
    url = "https://github.com/karimould/zellij-forgot/releases/download/0.4.2/zellij_forgot.wasm";
    hash = "sha256-MRlBRVGdvcEoaFtFb5cDdDePoZ/J2nQvvkoyG6zkSds=";
  };

  zellij-autolock = pkgs.fetchurl {
    url = "https://github.com/fresh2dev/zellij-autolock/releases/download/0.2.2/zellij-autolock.wasm";
    hash = "sha256-aclWB7/ZfgddZ2KkT9vHA6gqPEkJ27vkOVLwIEh7jqQ=";
  };
in
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

      plugins {
          autolock location="file:${zellij-autolock}" {
              is_enabled true
              triggers "nvim|vim|git|fzf|zoxide|atuin|agy|yazi|lazygit|lazydocker|btop|opencode|llmfit|mole|mo"
              reaction_seconds "0.3"
              print_to_log false
          }
          forgot location="file:${zellij-forgot}"
      }

      load_plugins {
          autolock
      }

      keybinds {
          unbind "Ctrl h" "Ctrl l" // nvim keys

          normal {
              bind "Enter" {
                  WriteChars "\u{000D}";
                  MessagePlugin "autolock" {};
              }
          }

          locked {
              bind "Alt z" {
                  MessagePlugin "autolock" { payload "disable"; };
                  SwitchToMode "Normal";
              }
          }

          shared {
              bind "Alt Shift z" {
                  MessagePlugin "autolock" { payload "enable"; };
              }
          }

          shared_except "locked" {
              bind "Ctrl y" {
                  LaunchOrFocusPlugin "forgot" {
                      "LOAD_ZELLIJ_BINDINGS" "true"
                      floating true
                  }
              }
              bind "Alt z" {
                  MessagePlugin "autolock" { payload "disable"; };
                  SwitchToMode "Locked";
              }
          }

          shared_except "move" "locked" {
              bind "Ctrl m" { SwitchToMode "Move"; }
          }
      }
    '';
  };
}
