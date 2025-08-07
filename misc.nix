{
 system = {
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion.
    stateVersion = "25.05"; # Did you read the comment?

    rebuild.enableNg = true;

    # Get rid of installer stuff that came with NixOS except rebuild
    disableInstallerTools = true;

    tools = {
      nixos-rebuild.enable = true;
      nixos-version.enable = true;
    };

    # Auto update via systemd
    autoUpgrade.enable = true;
  
    # Backup configuration.nix
    copySystemConfiguration = true;
  };

  # Enable services on systemd
  systemd.services = {
    fprintd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
    };
  };

  # Nix Packages Config
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
