{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }: {
    services.power-profiles-daemon.enable = true;
  };
}
