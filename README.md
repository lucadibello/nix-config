# Luca’s nix-darwin config

Modern rewrite of my old dotfiles ([lucadibello/dotfiles](https://github.com/lucadibello/dotfiles)), now fully managed with Nix flakes + nix-darwin + home-manager. It provisions my personal macOS setup (shell, CLI tools, GUI apps, window manager, terminal/tmux, Git identity) in a reproducible way.

## What’s inside
- `flake.nix`: entrypoint targeting host `Lucas-MacBook-Pro-16-inch` (aarch64-darwin) with shared modules and host overrides.
- `darwin/`: nix-darwin modules (system defaults, TouchID for sudo, keyboard/caps remap, Finder tweaks, PATH/EDITOR env, Homebrew taps/casks, AeroSpace service).
- `home/`: home-manager modules for shell (zsh + fzf/zoxide/atuin), prompt (starship), tmux (Catppuccin theme, fzf/yank plugins), Git user config, dev toolchain and CLI packages (neovim, ripgrep, lazygit, node 24, etc.), Ghostty configuration (auto tmux session, shader, font/theme).
- `hosts/<hostname>/configuration.nix`: host-specific bits (hostname today; extend here for per-machine settings).
- `config/`: extra assets (e.g., Ghostty cursor shader).
- `Makefile`: helper target to run the switch.

## Quick start (on a new Mac)
1. Install Nix with flakes enabled (e.g., Determinate/official installer). Ensure you have `nix` and `darwin-rebuild` available.
2. Clone this repo to `~/Developer/nix-config` (or adjust paths accordingly).
3. (Optional) Add a host entry under `hosts/<your-host>/configuration.nix` and point `flake.nix` to it if your machine name differs from `Lucas-MacBook-Pro-16-inch`.
4. Apply the system:
   ```bash
   make build  # wraps: sudo nix run nix-darwin -- switch --flake .
   # or
   sudo darwin-rebuild switch --flake .
   ```
5. Log out/in (or reboot) to let macOS defaults and services settle.

## Managing and customizing
- Packages: edit `home/packages.nix` for CLI tools; GUI/casks live in `darwin/homebrew.nix`.
- Shell & prompt: tweak `home/zsh.nix` and `home/starship.nix`; aliases include `nix-switch` for updating the system.
- Window management: `darwin/services.nix` configures AeroSpace with `alt`-centric bindings (tiles/accordion layouts, workspaces A–Z, Ghostty launcher on `alt-enter`).
- Terminal: `home/ghostty.nix` sets font/theme, enables zsh integration, and auto-starts a `tmux` session.
- System defaults: adjust Finder/keyboard/loginwindow options in `darwin/system.nix` and env in `darwin/settings.nix`.

## Update cycle
- Pull latest changes, edit modules as needed, then run `sudo darwin-rebuild switch --flake .` (or `make build`).
- `nix flake update` bumps inputs (`nixpkgs`, `nix-darwin`, `home-manager`) to the pinned release (`25.11` today).
