{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.yippie-nextcloud = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.NixOS-NextcloudConfig
    ];
  };
}
