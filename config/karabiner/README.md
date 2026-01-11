# Karabiner-Elements Complex Modifications

This directory contains custom JSON rules for Karabiner-Elements. These files are automatically symlinked to `~/.config/karabiner/assets/complex_modifications` by Home Manager.

## Active Rules

### `caps_lock.json`
- **Caps Lock → Hyper Key / Escape**:
  - Tapping `Caps Lock` acts as `Escape`.
  - Holding `Caps Lock` acts as the "Hyper Key" (`Cmd` + `Ctrl` + `Opt` + `Shift`). Useful for global shortcuts.

### `home_row_mods.json`
- **Home Row Modifiers**:
  - Holding `F` acts as `Shift`.
  - Holding `D` acts as `Command` (Gui).
  - Holding `S` acts as `Option` (Alt).
  - Holding `A` acts as `Control`.
  - (Mirrored on the right hand: `J`=`Shift`, `K`=`Cmd`, `L`=`Opt`, `;`=`Ctrl`).
  - Tapping any of these keys types the letter normally.

### `right_option_tmux_prefix.json`
- **Right Option → Tmux Prefix**:
  - Maps `Right Option` to `Ctrl` + `B` (or your configured tmux prefix) for one-handed tmux control.

### `right_command_shift_cmd_space_shortcat.json`
- **Right Command → Shortcat**:
  - Maps `Right Command` to `Shift` + `Cmd` + `Space` to trigger Shortcat (keyboard-driven mouse tool) easily.

## Usage

1. Add `.json` files to this directory.
2. Run `nix-switch`.
3. Open Karabiner-Elements → **Complex Modifications** → **Add rule**.
4. Enable your new rules from the list.
