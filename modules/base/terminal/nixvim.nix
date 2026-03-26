{ self, inputs, ... }: {

  flake.nixosModules.terminal = { pkgs, ... }: {

    imports = [ inputs.nixvim.nixosModules.nixvim ];

    programs = {

      nixvim = {
        enable = true;
        defaultEditor = true;
     
        opts = {
          number = true;
	        tabstop = 2;
	        shiftwidth = 2;
	        autoindent = true;
        };

        colorschemes.monokai-pro.enable = true;

        clipboard.providers.wl-copy.enable = true;

        plugins = {
          lualine = {
          enable = true;
          };

          nix.enable = true;

          cmp = {
            autoEnableSources = true;
            settings.sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            ];
          };


          lsp = {
            enable = true;
            inlayHints = true;
            servers = {
              nixd = {
                enable = true;
                settings = {
                  formatting.command = [ "nixpkgs-fmt" ];
                  nixpkgs.expr = "import <nixpkgs> {}";
                };
              };
            };
          };
        };
      };
    };
  };
}
