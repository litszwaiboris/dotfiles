{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    programs = {
      fish = {
        enable = true;

        interactiveShellInit = ''
          function fish_greeting
            fastfetch
          end

          starship init fish | source
        '';

        shellAliases = {
          nixos-update = "cd /etc/nixos && git pull && nix flake update && nh os switch && nh clean all -k 3 && cd ~";
        };
      };
    };

    # System Packages
    environment = {
      localBinInPath = true;
    };
  };
}
