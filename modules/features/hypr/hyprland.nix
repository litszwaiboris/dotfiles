{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.hyprland = {pkgs, ...}: {
    services.logind.settings = {
      Login = {
        HandlePowerKey = "suspend";
        HandleLidSwitchDocked = "ignore";
      };
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    services.upower = {
      enable = true;
    };

    services.dbus.packages = with pkgs; [
      upower
    ];

    environment.systemPackages = with pkgs; [
      swappy
      kitty
      app2unit
      papirus-icon-theme
      polkit_gnome
      hyprlock
      hypridle
    ];
  };
}
