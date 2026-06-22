{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.AI = {pkgs, ...}: {
    #environment.systemPackages = [ inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.opencode-desktop ];
  };
}
