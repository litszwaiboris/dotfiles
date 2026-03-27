{ self, inputs, ...}: {

  flake.homeConfigurations."yippie" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "aarch64-linux"; };
    modules = [
      self.nixosModules.homeManagerConfig
    ];
  };

}
