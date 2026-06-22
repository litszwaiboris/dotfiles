# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.NixOS-NextcloudConfig = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.homeManager
      inputs.lanzaboote.nixosModules.lanzaboote

      self.nixosModules.NixOS-NextcloudHardware
      self.nixosModules.terminal
      self.nixosModules.boot
      self.nixosModules.nextcloud
    ];

    options.customSettings.disableDesktop = lib.mkEnableOption "Affect home-manager for desktop functionalities, such as Noctalia Shell";

    config = {
      boot.loader.systemd-boot.enable = lib.mkForce true;
      boot.loader.efi.efiSysMountPoint = "/boot";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.timeout = 0;

      boot.lanzaboote.enable = lib.mkForce false;

      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.hostName = "yippie-nextcloud";
      networking.networkmanager.enable = true;

      time.timeZone = "America/Toronto";

      i18n.defaultLocale = "en_US.UTF-8";

      users.users.yippie = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
        packages = with pkgs; [
          starship
        ];
      };

      customSettings.disableDesktop = false;

      environment.systemPackages = with pkgs; [
        wget
        curl
        git
      ];

      # Copy the NixOS configuration file and link it from the resulting system
      # (/run/current-system/configuration.nix). This is useful in case you
      # accidentally delete configuration.nix.
      # system.copySystemConfiguration = true;

      # This option defines the first version of NixOS you have installed on this particular machine,
      # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
      #
      # Most users should NEVER change this value after the initial install, for any reason,
      # even if you've upgraded your system to a new NixOS release.
      #
      # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
      # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
      # to actually do that.
      #
      # This value being lower than the current NixOS release does NOT mean your system is
      # out of date, out of support, or vulnerable.
      #
      # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
      # and migrated your data accordingly.

      # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
      system.stateVersion = "26.05"; # Did you read the comment?

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nixpkgs.config.allowUnfree = true;
    };
  };
}
