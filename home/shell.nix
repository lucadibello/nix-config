{ pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        la = "ls -la";
        ".." = "cd ..";
        "nix-switch" = "sudo darwin-rebuild switch --flake ~/Developer/nix-config";
      };
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[λ](bold green)";
          error_symbol = "[λ](bold red)";
        };
      };
    };

    tmux = {
      enable = true;
      # -- General Settings --
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 5000;
      baseIndex = 1;

      # -- Prefix & Mouse --
      shortcut = "b";
      mouse = true;
      keyMode = "emacs";
      customPaneNavigationAndResize = true;

      # -- Plugins --
      # Nix manages these, replacing TPM
      plugins = with pkgs.tmuxPlugins; [
        # Catppuccin Theme
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha' # or latte, frappe, macchiato, mocha
            set -g @catppuccin_window_right_separator ""
            # set -g @catppuccin_window_right_separator "█"
            set -g @catppuccin_window_left_separator ""
            # set -g @catppuccin_window_left_separator ""
            set -g @catppuccin_window_number_position "left"
            set -g @catppuccin_window_middle_separator " "
            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_default_fill "none"
            set -g @catppuccin_window_current_fill "all"
            set -g @catppuccin_window_current_text "#W"
            set -g @catppuccin_status_modules_right "user host session"
            set -g @catppuccin_status_left_separator  " "
            # set -g @catppuccin_status_left_separator "█"
            set -g @catppuccin_status_right_separator ""
            # set -g @catppuccin_status_right_separator "█"
            set -g @catppuccin_status_right_separator_inverse "no"
            set -g @catppuccin_status_fill "all"
            set -g @catppuccin_directory_text "#{pane_current_path}"
            set -g @catppuccin_status_connect_separator "no"
          '';
        }
        sensible
        yank
        copycat
        pain-control
        tmux-fzf
      ];

      # -- Custom Bindings & Extra Config --
      extraConfig = ''
        set-environment -g PATH "~/.nix-profile/bin:/etc/profiles/per-user/lucadibello/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:/opt/homebrew/bin:/bin:/usr/bin"

        # Terminal features
        set -sag terminal-features ",*:RGB"
        set -sag terminal-features ",*:usstyle"
        set -g allow-passthrough on

        # General behavior
        set -sg repeat-time 600
        set -s focus-events on
        setw -g automatic-rename on
        set -g renumber-windows on
        set -g set-titles on
        set -g display-panes-time 800
        set -g display-time 1000
        set -g status-interval 10
        set -g monitor-activity on
        set -g visual-activity off

        # Rename format (from your theme section)
        set -g automatic-rename-format "#{pane_current_command}"

        # -- Navigation Bindings --

        # Create/Find Session
        bind C-c new-session
        bind C-f command-prompt -p find-session 'switch-client -t %%'
        bind BTab switch-client -l

        # Splits
        bind - split-window -v
        bind | split-window -h

        # Pane Navigation (Manual overrides)
        bind -r h select-pane -L
        bind -r j select-pane -D
        bind -r k select-pane -U
        bind -r l select-pane -R
        bind > swap-pane -D
        bind < swap-pane -U
        bind j join-pane -h -s 2 -t 1
        bind B break-pane -d

        # Pane Resizing
        bind -r H resize-pane -L 2
        bind -r J resize-pane -D 2
        bind -r K resize-pane -U 2
        bind -r L resize-pane -R 2

        # Window Navigation
        unbind n
        unbind p
        bind -r C-h previous-window
        bind -r C-l next-window
        bind Tab last-window

        # Clear screen
        bind -n C-l send-keys C-l \; run 'sleep 0.2' \; clear-history

        # -- Copy Mode --
        bind Enter copy-mode
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind -T copy-mode-vi Escape send-keys -X cancel

        # -- Buffers --
        bind b list-buffers
        bind p paste-buffer -p
        bind P choose-buffer
      '';
    };
  };
}
