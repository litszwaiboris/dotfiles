{ self, inputs, ...}: {

  flake.nixosConfigurations.NixVM-Mac = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.NixVM-MacConfig
      inputs.home-manager.nixosModules.home-manager {
        home-manager.backupFileExtension = ".bak";
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.yippie = self.homeManagerModules.homeManagerConfig;
      }
    ];
  };
}
