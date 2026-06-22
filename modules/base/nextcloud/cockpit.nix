{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nextcloud = {
    lib,
    pkgs,
    ...
  }: {
    environment.systemPackages = [pkgs.cockpit];

    systemd.services.cockpit = {
      environment.PATH = lib.mkDefault "${pkgs.cockpit}/libexec:${pkgs.coreutils}/bin";
    };

    services.cockpit = {
      enable = true;
      port = 10000;
      openFirewall = true;
      settings = {
        WebService.AllowUnencrypted = true;
      };
    };
  };
}
