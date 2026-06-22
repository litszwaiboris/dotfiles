{
  self,
  inputs,
  ...
}: {
  flake.homeModules.gtk = {
    pkgs,
    config,
    ...
  }: {
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

      gtk2.theme = config.gtk.theme;
      gtk2.force = true;

      gtk3.theme = config.gtk.theme;

      gtk4.enable = false;
      gtk4.theme = config.gtk.theme;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-cosmic
        xdg-desktop-portal-hyprland
      ];
      config = {
        hyprland = {
          default = [ "hyprland" "gtk" ];
          "org.freedesktop.impl.portal.ScreenCast" = [
            "gnome"
          ];
        };
      };
    };

    dconf.settings = {
      "org/gnome/desktop/wm/preferences".button-layout = "appmenu:";
    };
  };
}
