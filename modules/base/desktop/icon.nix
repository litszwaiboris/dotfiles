{ self, inputs, ... }: {

  flake.nixosModules.desktop = { pkgs, ... }: {

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    environment.systemPackages = with pkgs; [
      kdePackages.qt6ct
      catppuccin-cursors.macchiatoDark
      adw-gtk3
    ];

  };
}
