{ self, inputs, ... }: {

  flake.nixosModules.terminal = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      fish
      starship
      fastfetch
    ];

    programs.fish.enable = true;

    users.users.yippie.shell = pkgs.fish;
  };
}
