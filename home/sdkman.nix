{
  config,
  lib,
  pkgs,
  ...
}:
let
  sdkmanDir = "${config.home.homeDirectory}/.sdkman";
  installerUrl = "https://get.sdkman.io?rcupdate=false";
  installSdkman = pkgs.writeShellScript "install-sdkman" ''
    set -euo pipefail

    if [ -s "${sdkmanDir}/bin/sdkman-init.sh" ]; then
      exit 0
    fi

    if ! command -v curl >/dev/null 2>&1; then
      echo "curl is required to install SDKMAN! but was not found." >&2
      exit 1
    fi

    export SDKMAN_DIR="${sdkmanDir}"
    curl -fsSL "${installerUrl}" | bash
  '';
in
{
  home.sessionVariables.SDKMAN_DIR = sdkmanDir;

  home.activation.installSdkman = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${installSdkman}
  '';

  programs.zsh.initExtra = lib.mkAfter ''
    export SDKMAN_DIR=${sdkmanDir}
    if [ -s "${sdkmanDir}/bin/sdkman-init.sh" ]; then
      source "${sdkmanDir}/bin/sdkman-init.sh"
    fi
  '';
}
