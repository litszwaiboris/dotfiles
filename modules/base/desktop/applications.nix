{ self, inputs, ... }: {

  flake.nixosModules.desktop = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      nautilus
    ];

  };
}
