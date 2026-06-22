{
  inputs,
  self,
  ...
}: {
  flake.homeModules.nvim = {pkgs, ...}: {
    imports = [
      inputs.nix4nvchad.homeManagerModule
    ];

    programs.nvchad = {
      enable = true;
      extraPackages = with pkgs; [
        docker-compose-language-service
        dockerfile-language-server
        emmet-language-server
        nixd
        (python314.withPackages (
          ps:
            with ps; [
              python-lsp-server
              flake8
            ]
        ))
      ];

      hm-activation = true;
      backup = false;
    };
  };
}
