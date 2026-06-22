{
  description = "yippie nix flake";

  inputs = {
    # NixOS Base
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Dendritic Pattern
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Noctalia Shell
    noctalia.url = "github:noctalia-dev/noctalia-shell";

    # Hyprland Tools
    hyprdynamicmonitors.url = "github:fiffeek/hyprdynamicmonitors";

    # Neovim Configuration
    nix4nvchad.url = "github:nix-community/nix4nvchad";
    nix4nvchad.inputs.nixpkgs.follows = "nixpkgs";
    nix4nvchad.inputs.nvchad-starter.follows = "nvchad-starter";

    nvchad-starter.url = "github:yippii/nvchad-starter";
    nvchad-starter.flake = false;

    # Zen Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";

    # Sine Mod
    sine.url = "github:CosmoCreeper/Sine?rev=a48b73d32a074d710a1193294d432a62e436b8cf";
    sine.flake = false;
    sine-bootloader.url = "github:sineorg/bootloader?rev=ad1c91019196c3d7d43730f5dd0ddc278f9e3a6e";
    sine-bootloader.flake = false;

    # Sine Mod Plugins
    nebula-zen.url = "github:JustAdumbPrsn/Zen-Nebula";
    nebula-zen.flake = false;
    zen-icons.url = "github:qumeqa/zen-icons";
    zen-icons.flake = false;
    zen-context-menu.url = "github:starry-AXQG/Context-Menu-Icons";
    zen-context-menu.flake = false;
    zen-data-loading-bar.url = "github:rasyidrafi/zen-deta-loading-bar";
    zen-data-loading-bar.flake = false;

    # Spotify (Spicetify)
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Gaming
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    # AI Stuff
    opencode.url = "github:anomalyco/opencode";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    opencode.inputs.nixpkgs.follows = "nixpkgs-master";

    comfyui-nix.url = "github:utensils/comfyui-nix";

    # Unpatched binaries
    nix-alien.url = "github:thiagokokada/nix-alien";

    # Device Specific

    # UEFI Secure Boot
    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    # Apple Silicon Macs
    nixos-apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    nixos-apple-silicon.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        (inputs.import-tree ./modules)
      ];
    };
}
