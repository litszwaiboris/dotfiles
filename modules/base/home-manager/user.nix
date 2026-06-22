{
  self,
  inputs,
  ...
}: {
  flake.homeModules.misc = {
    lib,
    config,
    pkgs,
    ...
  }: {
    home.username = "yippie";
    home.homeDirectory = "/home/yippie";

    home.stateVersion = "26.05"; # Please read the comment before changing.

    home.packages = with pkgs; [];

    home.sessionVariables = {};

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
