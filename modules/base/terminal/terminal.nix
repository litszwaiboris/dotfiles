{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    environment.systemPackages = with pkgs;
      lib.mkMerge [
        [
          fish
          starship
          fastfetch
          nh
          git
          wget
          curl
          yt-dlp
          platformio
          openjdk
          maven
          gradle
          nodejs
          cargo
          unzip
        ]

        (lib.mkIf pkgs.stdenv.isAarch64 [
          asahi-bless
          asahi-nvram
          asahi-fwextract
        ])
      ];

    programs.fish.enable = true;

    services.tailscale.enable = true;

    users.users.yippie.shell = pkgs.fish;

    console = {
      font = "${pkgs.terminus_font}/share/consolefonts/ter-u32b.psf.gz";
      packages = with pkgs; [terminus_font];
      keyMap = "us";
      earlySetup = true;
    };

    systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";
  };
}
