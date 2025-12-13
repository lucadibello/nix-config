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

  sdkmanConfig = pkgs.writeText "sdkman-config" ''
    sdkman_auto_answer=false
    sdkman_selfupdate_feature=true
    sdkman_insecure_ssl=false
    sdkman_curl_connect_timeout=5
    sdkman_curl_continue=true
    sdkman_curl_max_time=10
    sdkman_beta_channel=false
    sdkman_debug_mode=false
    sdkman_colour_enable=true
    sdkman_auto_env=true
    sdkman_auto_complete=true
  '';

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

  configureSdkman = pkgs.writeShellScript "configure-sdkman" ''
    set -euo pipefail
    export PATH="${pkgs.coreutils}/bin:''${PATH:-}"
    mkdir -p "${sdkmanDir}/etc"
    cat "${sdkmanConfig}" > "${sdkmanDir}/etc/config"
  '';
in
{
  home.sessionVariables.SDKMAN_DIR = sdkmanDir;

  home.activation.installSdkman = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${installSdkman}
  '';

  home.activation.configureSdkman = lib.hm.dag.entryAfter [ "installSdkman" ] ''
    ${configureSdkman}
  '';

  programs.zsh.initContent = lib.mkAfter ''
    export SDKMAN_DIR=${sdkmanDir}
    if [ -s "${sdkmanDir}/bin/sdkman-init.sh" ]; then
      sdkman_auto_env=true
      source "${sdkmanDir}/bin/sdkman-init.sh"
    fi
  '';
}
