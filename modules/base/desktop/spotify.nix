{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }: {
    imports = [inputs.spicetify-nix.nixosModules.default];

    programs.spicetify = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isx86_64 {
        enable = true;
        theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.themes.hazy;

        enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.extensions; [
          adblock
          hidePodcasts
          shuffle # shuffle+ (special characters are sanitized out of extension names)
        ];
      })

      (lib.mkIf pkgs.stdenv.isAarch64 {
        enable = false;
      })
    ];
  };
}
