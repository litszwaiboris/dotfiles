{ self, inputs, ... }: {

  flake.nixosModules.NixOS-MacHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports = [ ];

    boot.initrd.availableKernelModules = [ "ehci_pci" "xhci_pci" "usbhid" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-label/NixOS";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-label/Boot";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices =
      [ { device = "/dev/disk/by-label/953dd42a-2d46-4d21-a0ac-9528d0416de2"; }
      ];

    hardware.graphics.enable = true;

    nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
    hardware.parallels.enable = true;
    nixpkgs.config.allowUnfreePackages = [ "prl-tools" ];
  };
}
