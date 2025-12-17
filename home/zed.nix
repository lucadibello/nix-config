{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    # Zed extensions
    extensions = [
      "html"
      "git-firefly"
      "dockerfile"
      "java"
      "macos-classic"
      "make"
      "material-icon-theme"
      "latex"
      "kotlin"
      "docker-compose"
      "csv"
      "neocmake"
      "comment"
      "nix"
    ];

    userSettings = {
      # AI
      agent = {
        always_allow_tool_actions = false;
        default_model = {
          provider = "copilot_chat";
          model = "claude-sonnet-4.5";
        };
        play_sound_when_agent_done = true;
      };

      # Additional features
      features = {
        edit_prediction_provider = "copilot";
      };

      # General settings
      hour_format = "hour24";
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
      };
      buffer_font_family = "JetBrains Mono";
      ui_font_family = "JetBrains Mono";
      ui_font_size = 18;
      buffer_font_size = 17;
      base_keymap = "VSCode";
      tab_size = 4;

      # Theme
      theme = {
        mode = "dark";
        dark = "macOS Classic Dark";
      };

      # Icon pack
      icon_theme = {
        mode = "dark";
        light = "Zed (Default)";
        dark = "Zed (Default)";
      };
    };

    # Custom keymaps
    userKeymaps = [

      #  Pane navigation & resizing (Ctrl+h/j/k/l, Ctrl+Arrows)
      {
        context = "vim_mode == normal";
        bindings = {
          ctrl-h = "workspace::ActivatePaneLeft";
          ctrl-j = "workspace::ActivatePaneDown";
          ctrl-k = "workspace::ActivatePaneUp";
          ctrl-l = "workspace::ActivatePaneRight";
        };
      }
      {
        context = "Terminal";
        bindings = {
          ctrl-h = "workspace::ActivatePaneLeft";
          ctrl-j = "workspace::ActivatePaneDown";
          ctrl-k = "workspace::ActivatePaneUp";
          ctrl-l = "workspace::ActivatePaneRight";
        };
      }
      {
        context = "menu";
        bindings = {
          ctrl-h = "workspace::ActivatePaneLeft";
          ctrl-j = "workspace::ActivatePaneDown";
          ctrl-k = "workspace::ActivatePaneUp";
          ctrl-l = "workspace::ActivatePaneRight";
        };
      }

      # vim-surround
      {
        context = "vim_mode == normal || vim_mode == visual";
        bindings = {
          "g s a" = "vim::PushAddSurrounds";
          "g s d" = "vim::PushDeleteSurrounds";
        };
      }

      # vim-sneak
      {
        context = "vim_mode == normal || vim_mode == visual";
        bindings = {
          s = "vim::PushSneak";
          shift-s = "vim::PushSneakBackward";
        };
      }

      # <leader> mappings (space)
      {
        context = "Editor && vim_mode == normal && !menu";
        bindings = {
          # Files / buffers
          "space space" = "file_finder::Toggle";
          "space f f" = "file_finder::Toggle";
          "space f p" = "project_panel::NewSearchInDirectory";

          # editor UI settings
          "space u w" = "editor::ToggleSoftWrap";

          # global seearch
          "space g s" = "workspace::NewSearch";

          # Window management
          "space -" = "pane::SplitHorizontal";
          "space |" = "pane::SplitVertical";
          "space w m" = "workspace::ToggleZoom";
          "space w d" = "pane::CloseAllItems";

          # Buffer management
          "space b d" = "pane::CloseActiveItem";
          "space b s" = "buffer_search::Deploy";

          # Panels
          "space e" = "project_panel::ToggleFocus";
          "space t" = "terminal_panel::ToggleFocus";
          "space g g" = "git_panel::ToggleFocus";

          # Code configuration
          "space c a" = "editor::GoToDiagnostic";
          "space c c" = "editor::GoToDefinition";
          "space c r" = "editor::FindAllReferences";
          "space c d" = "editor::GoToDeclaration";
        };
      }

      # toggle left dock
      {
        context = "Editor && vim_mode == normal";
        bindings = {
          "space e" = "workspace::ToggleLeftDock";
        };
      }

      # Buffer‑tab navigation
      {
        context = "Editor && vim_mode == normal && !menu";
        "bindings" = {
          "shift-h" = "pane::ActivatePreviousItem";
          "shift-l" = "pane::ActivateNextItem";
        };
      }

      # Toggle terminal
      {
        context = "Terminal";
        bindings = {
          "ctrl-/" = "workspace::ToggleBottomDock";
        };
      }

      # Project panel
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          "k" = "menu::SelectPrevious";
          "j" = "menu::SelectNext";
          "h" = "project_panel::CollapseSelectedEntry";
          "l" = "project_panel::ExpandSelectedEntry";
          "o" = "project_panel::Open";
          "O" = "workspace::OpenWithSystem";
          "x" = "project_panel::Cut";
          "r" = "project_panel::Rename";
          "y" = "project_panel::Copy";
          "p" = "project_panel::Paste";
          "d" = "project_panel::Delete";
          "a" = "project_panel::NewFile";
          "shift-a" = "project_panel::NewDirectory";
          "shift-y" = "workspace::CopyRelativePath";
          "g y" = "workspace::CopyPath";
        };
      }
    ];
  };
}
