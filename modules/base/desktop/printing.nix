{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    services.printing = {
      enable = true;
      drivers = [pkgs.cnijfilter2];
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
