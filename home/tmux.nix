{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    # -- General Settings --
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 50000;
    baseIndex = 1;

    # -- Prefix & Mouse --
    shortcut = "b";
    mouse = true;
    keyMode = "emacs";
    customPaneNavigationAndResize = true;

    # -- Plugins --
    # Nix manages these, replacing TPM
    plugins = with pkgs.tmuxPlugins; [
      #   # Catppuccin Theme
      #   {
      #     plugin = catppuccin;
      #     extraConfig = ''
      #       set -g @catppuccin_flavour "mocha"
      #       set -g @catppuccin_window_status_style "rounded"
      #     '';
      #   }
      #   cpu
      #   battery
      yank
      #   copycat
      #   pain-control
      #   tmux-fzf
    ];

    # -- Custom Bindings & Extra Config --
    extraConfig = ''
      # Ensure Nix-provided tmux and tools are on PATH for run-shell hooks
      set-environment -g PATH "/opt/homebrew/bin:/opt/homebrew/sbin:/Users/lucadibello/.nix-profile/bin:/etc/profiles/per-user/lucadibello/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Ghostty.app/Contents/MacOS"

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
      set -g display-time 4000
      set -g status-interval 5
      set -g monitor-activity on
      set -g visual-activity off
      set -g aggressive-resize on
      set -g automatic-rename-format "#{pane_current_command}"


      # Create new session
      bind C-c new-session

      # Splits
      bind - split-window -v
      bind | split-window -h

      # Pane navigation
      bind -r h select-pane -L
      bind -r j select-pane -D
      bind -r k select-pane -U
      bind -r l select-pane -R
      bind > swap-pane -D
      bind < swap-pane -U
      bind j join-pane -h -s 2 -t 1
      bind B break-pane -d

      # Pane resizing
      bind -r H resize-pane -L 2
      bind -r J resize-pane -D 2
      bind -r K resize-pane -U 2
      bind -r L resize-pane -R 2

      # Copy mode
      bind Enter copy-mode
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind -T copy-mode-vi Escape send-keys -X cancel

      # Buffers
      bind b list-buffers
      bind p paste-buffer -p
      bind P choose-buffer

      # Catppuccin status bar
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -agF status-right "#{E:@catppuccin_status_cpu}"
      set -agF status-right "#{E:@catppuccin_status_battery}"
      set -ag status-right "#{E:@catppuccin_status_session}"
    '';
  };

  # create symlink to tmux.conf in home config
  # home.file.".tmux.conf".source =
  #   config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/tmux/tmux.conf";
}
