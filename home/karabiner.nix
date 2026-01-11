{ primaryUser, ... }:
{
  # Link Karabiner-Elements complex modifications
  # This makes the JSON files in config/karabiner available to Karabiner-Elements
  home.file.".config/karabiner/assets/complex_modifications" = {
    source = ../config/karabiner;
    recursive = true;
  };
}
