{ self, inputs, ... }: {

  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true; 
    };

    environment.systemPackages = with pkgs; [
      kitty
      app2unit
      papirus-icon-theme
    ];
  };
}
