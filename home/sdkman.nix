{
  config,
  lib,
  pkgs,
  ...
}:
let
  sdkmanDir = "${config.home.homeDirectory}/.sdkman";
  installerUrl = "https://get.sdkman.io?rcupdate=false";
  bashBin = "${pkgs.bash}/bin/bash";
  curlBin = "${pkgs.curl}/bin/curl";
  unzipBin = "${pkgs.unzip}/bin/unzip";
  zipBin = "${pkgs.zip}/bin/zip";
  tarBin = "${pkgs.gnutar}/bin/tar";
  sedBin = "${pkgs.gnused}/bin/sed";
  installSdkman = pkgs.writeShellScript "install-sdkman" ''
    set -euo pipefail

    if [ -s "${sdkmanDir}/bin/sdkman-init.sh" ]; then
      exit 0
    fi

    for bin in "${curlBin}" "${unzipBin}" "${zipBin}" "${tarBin}" "${sedBin}" "${bashBin}"; do
      if [ ! -x "$bin" ]; then
        echo "Required tool not found: $bin" >&2
        exit 1
      fi
    done

    export SDKMAN_DIR="${sdkmanDir}"
    export PATH="${pkgs.curl}/bin:${pkgs.unzip}/bin:${pkgs.zip}/bin:${pkgs.gnutar}/bin:${pkgs.gnused}/bin:''${PATH:-}"
    "${curlBin}" -fsSL "${installerUrl}" | "${bashBin}"
  '';
in
{
  home.sessionVariables.SDKMAN_DIR = sdkmanDir;

  home.activation.installSdkman = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${installSdkman}
  '';

  programs.zsh.initContent = lib.mkAfter ''
    export SDKMAN_DIR=${sdkmanDir}
    if [ -s "${sdkmanDir}/bin/sdkman-init.sh" ]; then
      source "${sdkmanDir}/bin/sdkman-init.sh"
    fi
  '';
}
