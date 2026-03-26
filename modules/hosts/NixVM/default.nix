{ self, inputs, ...}: {

  flake.nixosConfigurations.NixVM = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.NixVMConfig
    ];
  };

}
