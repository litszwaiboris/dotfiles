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
    services.openssh = {
      enable = true;

      ports = [6767];

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = true;
        PermitRootLogin = "no";
        AllowUsers = ["yippie"];
      };
    };
  };
}
