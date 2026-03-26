{ self, inputs, ... }: {
  flake.nixosModules.noctalia-shell = { pkgs, ... }: {
    environment.systemPackages = [ inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };
}
