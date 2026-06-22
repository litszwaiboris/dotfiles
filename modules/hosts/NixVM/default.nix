{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.NixVM = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.NixVMConfig
      inputs.home-manager.nixosModules.home-manager
      self.home-manager.nixosModules.homeManagerConfig
    ];
  };
}
