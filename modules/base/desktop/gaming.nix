{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }:
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isx86_64 {
        boot.kernelModules = ["ntsync"];

        programs.steam = {
          enable = true;
          gamescopeSession.enable = true;

          extraCompatPackages = with pkgs; [
            proton-ge-bin
          ];

          extraPackages = with pkgs; [
            SDL2
            gamescope
            er-patcher
          ];
        };

        programs.gamemode.enable = true;

        environment.systemPackages = with pkgs; [
          mangohud
          osu-lazer-bin
          (lutris.override {
            # Intercept buildFHSEnv to modify target packages
            buildFHSEnv = args:
              pkgs.buildFHSEnv (
                args
                // {
                  multiPkgs = envPkgs: let
                    # Fetch original package list
                    originalPkgs = args.multiPkgs envPkgs;

                    # Disable tests for openldap
                    customLdap = envPkgs.openldap.overrideAttrs (_: {
                      doCheck = false;
                    });
                  in
                    # Replace broken openldap with the custom one
                    builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [customLdap];
                }
              );
          })
          vulkan-tools
        ];
      })
    ];
}
