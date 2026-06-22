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
    services.sysprof.enable = true;

    services.gvfs.enable = true;

    services.flatpak.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdg.portal.config.common.default = "gtk";

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/etc/nixos";
    };

    nix = {
      settings = {
        substituters = [
          "https://nix-community.cachix.org"
          "https://cache.nixos.org/"
          "https://noctalia.cachix.org"
          "https://nixos-apple-silicon.cachix.org"
          "https://comfyui.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          "comfyui.cachix.org-1:33mf9VzoIjzVbp0zwj+fT51HG0y31ZTK3nzYZAX0rec="
        ];
      };
    };

    environment = {
      systemPackages = with pkgs;
        lib.mkMerge [
          [
            quodlibet
            easyeffects
            github-desktop
            android-tools
            sublime-merge
            # animeko
            ani-cli
            yt-dlp
            signal-desktop
            nicotine-plus
            qbittorrent
            kdePackages.ark
            unrar
            opencode-desktop
            spot
          ]

          (lib.mkIf pkgs.stdenv.isx86_64 [
            discord
          ])

          (lib.mkIf pkgs.stdenv.isAarch64 [
            vesktop
          ])
        ];

      sessionVariables.NIXOS_OZONE_WL = "1";
    };
  };
}
