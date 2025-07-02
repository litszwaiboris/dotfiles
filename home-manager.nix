{ pkgs, ... }:

let
  home-manager-path = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz" ;
  home-manager = import "${home-manager-path}/nixos";
in
{
  imports = [ home-manager ];

  home-manager = {

    backupFileExtension = "backup";

    users.libor = {

      home = {
        stateVersion = "25.05";

        packages = with pkgs; [ 
          vscode
          vesktop
          kitty
          nicotine-plus
          marble-shell-theme
          orchis-theme
          adwaita-icon-theme
          ibus-theme-tools
          gnomeExtensions.appindicator
          gnomeExtensions.user-themes
          gnomeExtensions.blur-my-shell
          gnomeExtensions.dash-to-dock
          gnomeExtensions.customize-ibus
          gnomeExtensions.space-bar
          wineWowPackages.waylandFull
          easyeffects
        ];
      };

      programs = {
        fish.enable = true;

        git = {
          enable = true;
          userName = "yippii";
          userEmail = "liboris20@gmail.com";
        };
      };

      dconf = {
        enable = true;

        settings."org/gnome/shell" = {
          disable-user-extensions = false;

          enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            user-themes.extensionUuid
            dash-to-dock.extensionUuid
            customize-ibus.extensionUuid
	    space-bar.extensionUuid
          ];
        };

        settings."org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
              };

        settings."org/gnome/desktop/wm/preferences" = {
          button-layout = "close,:menu,maximize";
        };
      };

      gtk = {
        enable = true;

        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };

        theme = {
          name = "Orchis-Teal-Dark";
          package = pkgs.orchis-theme;
        };
      };
    };
  };
}
