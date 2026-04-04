{
  description = "yippie nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  
    noctalia.url = "github:noctalia-dev/noctalia-shell";

    nixvim.url = "github:nix-community/nixvim";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-apple-silicon.url = "github:nix-community/nixos-apple-silicon";
  };

  outputs = inputs: 
  inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      (inputs.import-tree ./modules)
    ];
  };
}
