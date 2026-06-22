{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    programs.appimage.package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.python314
        pkgs.vlc
        pkgs.gvfs
      ];
    };


    programs.nix-ld = {
      enable = true;
    };

    environment.systemPackages = [
      inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.nix-alien
    ];
  };
}
