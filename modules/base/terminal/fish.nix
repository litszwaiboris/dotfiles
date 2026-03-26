{ self, inputs, ... }: {

  flake.nixosModules.terminal = { pkgs, ... }: {
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
          nixos-update-config = "sudo nixos-rebuild switch && sudo nix-collect-garbage -d";
        };
      };
    };

    # System Packages
    environment = {
      localBinInPath = true;
    };
  };
}
