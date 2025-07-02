{ pkgs, ... }:

let 
  lanzaboote = import (builtins.getFlake "github:nix-community/lanzaboote/v0.4.2");
in
{
  imports = [ lanzaboote.nixosModules.lanzaboote ];

  boot = {

    consoleLogLevel = 0;

    kernelPackages = pkgs.linuxPackages_zen;

    initrd = {
      verbose = false;
      kernelModules = [ "i915" ];
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader = { 
      timeout = 0;
      systemd-boot = {
          enable = false;
          configurationLimit = 5;
          edk2-uefi-shell.enable = true;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
      extraConfig = ''ShowDelay=5'';
    };

    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=0"
      "udev.log_priority=0"
      "video=DP-1:1920x1080@148"
      "video=DP-2:1920x1080@75"
    ];
  };
}
