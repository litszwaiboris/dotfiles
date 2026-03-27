{ self, inputs, ...}: {

  flake.nixosConfigurations.NixVM = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.NixVMConfig
      inputs.home-manager.nixosModules.home-manager {
        home-manager.backupFileExtension = ".bak";
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.yippie = self.homeManagerModules.homeManagerConfig;

      }
    ];
  };
}
