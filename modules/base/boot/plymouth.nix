{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.boot = {
    config,
    lib,
    pkgs,
    ...
  }: {
    boot = {
      plymouth = {
        enable = true;
        theme = "bgrt";
        extraConfig = "ShowDelay=5";
      };

      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = lib.mkMerge [
        [
          "quiet"
          "splash"
        ]
      ];

      #loader.timeout = 0;
    };
  };
}
