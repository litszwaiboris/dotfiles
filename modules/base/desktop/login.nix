{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }: {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "yippie";
          command = "${pkgs.cage}/bin/cage -s -d -- gtkgreet-launch";
        };
      };
    };

    environment.etc."greetd/environments".text = ''
      uwsm start -e -D Hyprland hyprland.desktop
      Hyprland
      fish
      bash
    '';

    environment.systemPackages = with pkgs; [
      (writeShellApplication {
        name = "gtkgreet-launch";
        runtimeInputs = [gtkgreet wlr-randr];
        text = ''
          wlr-randr --output eDP-1 --scale 2
          gtkgreet
        '';
      })
    ];
  };
}
