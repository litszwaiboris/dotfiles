{ self, inputs, ...}:

let 
  system = "aarch64-linux";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in {
  flake.homeConfigurations."yippie" = inputs.home-manager.lib.homeManagerConfiguration {

    inherit pkgs;
    modules = [
      self.nixosModules.homeManagerConfig
    ];
  };
}
