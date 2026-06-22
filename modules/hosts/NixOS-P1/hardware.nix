{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.NixOS-P1Hardware = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/hardware/cpu/intel-npu.nix")
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "nvme"
      "usbhid"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/368f219c-6854-4175-ba41-e0639bf7c507";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/C57D-49A6";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/65e239a5-5e8b-4aa1-b3fa-7b2c94b05b40";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

    hardware = {
      firmware = [pkgs.linux-firmware];

      bluetooth.enable = true;

      cpu = {
        intel.npu.enable = true;
        intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };
}
