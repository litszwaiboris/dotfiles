{ self, inputs, ... }: {

  flake.nixosModules.NixVMHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports = [ ];

    boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "ehci_pci" "ahci" "nvme" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/3f7cfa31-7277-4cf4-ae5e-12729ea3c983";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/CA3D-6482";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices = [ ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };

}

