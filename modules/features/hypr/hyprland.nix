{ self, inputs, ... }: {

  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true; 
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    };

    environment.systemPackages = with pkgs; [
      kitty
      app2unit
      papirus-icon-theme
    ];
  };
}
