{ inputs, self, ... }: {

  flake.homeManagerModules.homeManagerConfig = { pkgs, ... }: {

    home.username = "yippie";
    home.homeDirectory = "/home/yippie";
    home.stateVersion = "25.11";

  };
}
