{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.NixVM-MacHardware = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [];

    boot.initrd.availableKernelModules = [
      "ehci_pci"
      "xhci_pci"
      "usbhid"
      "sr_mod"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/c1f23a84-8ac2-4455-be0d-52928a022a69";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/4757-26DB";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/701cc6bd-bddf-4c16-8ddf-ec13178bb8b7";}
    ];

    hardware.graphics.enable = true;

    nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
    hardware.parallels.enable = true;
    nixpkgs.config.allowUnfreePackages = ["prl-tools"];
  };
}
