{ pkgs, ... }:
let

  zen-browser = (builtins.getFlake "github:0xc000022070/zen-browser-flake");
  nixvim = import ( builtins.fetchGit { url = "https://github.com/nix-community/nixvim"; ref = "nixos-25.05"; } );

in 
  
  {
    
  imports = [ nixvim.nixosModules.nixvim ];

  nixpkgs.overlays = [
    (final: prev: {
  
      marble-shell-theme = prev.marble-shell-theme.override {
        additionalInstallationTweaks = [ "--hue" "170" "--name" "mint" "-Pnp" ];
      };
  
      orchis-theme = prev.orchis-theme.override {
        tweaks = [ "primary" "submenu" ];
      };
  
    })
  
  ];

  # System Package Configs
  programs = {

    adb.enable = true;

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

        indent-tools.enable = true;

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

    starship = {

      enable = true;

      settings = {
        format = "$os $shell $username $hostname $directory $nix_shell\n$character";

        right_format = "$battery";

        character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[❯](bold red)";
        };

        directory = {
          read_only = "";
          style = "yellow bold";
          format = "[ $path]($style)";
        };

        git_branch = {
          symbol = " ";
          style = "blue bold";
          format = "branch [$symbol$branch]($style) ";
        };

        git_status = {
          format = "[$all_status$ahead_behind]($style) ";
          style = "red bold";
        };

        java = {
          symbol = "";
          style = "red bold";
          format = " via [$symbol $version]($style)";
        };

        nix_shell = {
          symbol = "";
          style = "cyan bold";
          format = "in [$symbol shell]($style)";
        };

        os = {
          format = "[$symbol NixOS](bold cyan)";
          disabled = false;
        };

        os.symbols = {
          NixOS = "";
        };

        python = {
          symbol = " ";
          style = "cyan bold";
          format = "via [$symbol$version]($style) ";
        };

        shell = {
          zsh_indicator = "zsh";
          fish_indicator = "fish";
          nu_indicator = "nushell";
          format = "[󰘳 $indicator](green bold)";
          disabled = false;
        };

        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[ $user]($style)";
          disabled = false;
          show_always = true;
        };
        
        hostname = {
          ssh_only = false;
          style = "purple bold";
          format = "[ $hostname]($style)";
        };
      };
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    fish = {
      enable = true;

      interactiveShellInit = ''
        function fish_greeting
          fastfetch
        end
      '';
      
      shellAliases = {
        nixos-update-config = "sudo nixos-rebuild switch && sudo nix-collect-garbage -d";
      };
    };

    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };

  # System Packages
  environment = {
    localBinInPath = true;

    pantheon.excludePackages = [ pkgs.pantheon.epiphany ];

    gnome.excludePackages = ( with pkgs; [ atomix epiphany geary gedit gnome-tour hitori iagno tali gnome-maps gnome-weather yelp gnome-console ]);

    variables = {
       FREETYPE_PROPERTIES = "truetype:interpreter-version=3";
    };

    systemPackages = with pkgs; [
      git
      wget
      mission-center
      killall
      fastfetch
      starship
      fish
      sbctl
      sassc
      wl-clipboard
      transmission_4-gtk
      zen-browser.packages."${system}".twilight
      bitwarden-desktop
    ];
  };

  # Font Packages
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    source-han-sans
    corefonts
    vistafonts
    roboto
    kodiPackages.robotocjksc
  ];
}
