# Luca’s nix-darwin config

Modern rewrite of my old dotfiles ([lucadibello/dotfiles](https://github.com/lucadibello/dotfiles)), now fully managed with [Nix](https://nixos.org/) flakes + [nix-darwin](https://github.com/nix-darwin/nix-darwin) + [home-manager](https://github.com/nix-community/home-manager). It provisions my personal macOS setup (shell, CLI tools, GUI apps, window manager, terminal/tmux, Git identity) in a reproducible way.

## What’s inside

- `flake.nix`: entrypoints for hosts `Lucas-MacBook-Pro-16-inch` (MacBook) and `Lucas-Mac-Mini` (Desktop).
- `darwin/`: nix-darwin modules (system defaults, TouchID/WatchID for sudo, keyboard/caps remap, Finder tweaks, PATH/EDITOR env, Homebrew taps/casks, AeroSpace service).
- `home/`: home-manager modules for shell (zsh + fzf/zoxide/atuin), prompt (starship), tmux (Catppuccin theme, cpu/battery/fzf/yank/pain-control plugins), Git user config, dev toolchain (fnm, sdkman, jdk21), and CLI packages (neovim, zed, lazygit, claude-code, etc.).
- `hosts/<hostname>/configuration.nix`: host-specific settings (e.g., TouchID vs WatchID, gaming packages for Mac Mini).
- `config/`: extra assets (e.g., Ghostty cursor shader).
- `bootstrap.sh`: helper script to bootstrap the system (installs nix-darwin, builds flake).

## Quick start (on a new Mac)

1. Install Nix with flakes enabled (e.g., Determinate/official installer). Ensure you have `nix` available.
2. Clone this repo to `~/Developer/nix-config` (or adjust paths accordingly).
3. (Optional) Add a host entry under `hosts/<your-host>/configuration.nix` and point `flake.nix` to it if your machine name differs from `Lucas-MacBook-Pro-16-inch`.
4. Apply the system:

   ```bash
   chmod +x bootstrap.sh
   ./bootstrap.sh
   ```

5. Log out/in (or reboot) to let macOS defaults and services settle.

## Managing and customizing

- Packages: edit `home/packages.nix` for CLI tools; GUI/casks live in `darwin/homebrew.nix`.
- Shell & prompt: tweak `home/zsh.nix` (zsh + oh-my-zsh with `git`, `vi-mode`, `tmux` plugins) and `home/starship.nix`; aliases include `nix-switch` for updating the system.
- Window management: `darwin/services.nix` configures AeroSpace with `alt`-centric bindings (tiles/accordion layouts, workspaces A–Z/0–9, Ghostty launcher on `alt-enter`) and smart window movement rules.
- Terminal: `home/ghostty.nix` sets font (JetBrains Mono), theme (Github Dark), custom cursor shader, zsh integration, and auto-starts a `core` tmux session.
- System defaults: adjust Finder/keyboard/loginwindow options (e.g., Caps Lock to Escape, hidden files, no guest login) in `darwin/system.nix` and env in `darwin/settings.nix`.
- Homebrew: `darwin/homebrew.nix` manages casks (browsers, AI tools, dev apps) and brews, with `zap` cleanup enabled.

## Update cycle

- Pull latest changes, edit modules as needed, then run:

  ```bash
  nix-switch
  ```

  > **Note**: This is an alias for `sudo darwin-rebuild switch --flake ~/Developer/nix-config#<HOST_NAME>`, automatically configured in `zsh`.

- `nix flake update` bumps inputs (`nixpkgs`, `nix-darwin`, `home-manager`) to the pinned release (`25.11` today).
