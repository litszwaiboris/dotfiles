{ self, inputs, ... }: {

  flake.nixosModules.desktop = { pkgs, ... }: {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;

        extraPackages = with pkgs; [
          kdePackages.qtsvg
          kdePackages.qtmultimedia
          kdePackages.qtvirtualkeyboard
          kdePackages.qt5compat
        ];

        theme = "sddm-astronaut-theme";
      };
     
      autoLogin = {
        enable = false;
	    user = "yippie";
      };
    };

    environment.systemPackages = with pkgs; [
      (sddm-astronaut.override {
        embeddedTheme = "hyprland_kath";
      })

      catppuccin-cursors.macchiatoDark
    ];
  };
}
