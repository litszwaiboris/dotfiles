{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [seahorse];

    programs.git = {
      enable = true;
      config = {
        credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
      };
    };
  };
}
