{ self, inputs, ... }: {

  flake.nixosModules.desktop = { pkgs, ... }: {

    programs.dconf.profiles.user.databases = [{
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "adw-gtk3-dark";
          icon-theme = "Papirus-Dark";
          cursor-theme = "catppuccin-macchiato-dark-cursors";
        };
      };
    }];

    environment.systemPackages = with pkgs; [
      kdePackages.qt6ct
      catppuccin-cursors.macchiatoDark
      adw-gtk3
    ];
  };
}
