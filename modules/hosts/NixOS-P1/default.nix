{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.NixOS-P1 = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.NixOS-P1Config
    ];
  };
}
