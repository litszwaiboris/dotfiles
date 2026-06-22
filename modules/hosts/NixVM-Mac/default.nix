{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.NixVM-Mac = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.NixVM-MacConfig
    ];
  };
}
