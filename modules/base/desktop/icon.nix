{ self, inputs, ... }: {

  flake.nixosModules.desktop = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      kdePackages.qt6ct
      catppuccin-cursors.macchiatoDark
      adw-gtk3
    ];

  };
}
