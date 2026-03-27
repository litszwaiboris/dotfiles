{ self, inputs, ... }: {

  flake.homeManagerModules.homeManagerConfig = { config, pkgs, ... }: {
    home.username = "yippie";
    home.homeDirectory = "/home/yippie";

    home.stateVersion = "25.11"; # Please read the comment before changing.

    home.packages = [
    ];

    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
      };


      cursorTheme = {
        name = "catppuccin-macchiato-dark-cursors";
        package = pkgs.catppuccin-cursors.macchiatoDark;
        size = 16;
      };

      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
    };

    home.file = {
    };
    home.sessionVariables = {
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };

}
