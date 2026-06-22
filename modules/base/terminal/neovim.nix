{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.terminal = {
    lib,
    pkgs,
    ...
  }: {
    environment.systemPackages = lib.mkMerge [
      [
        inputs.nix4nvchad.packages."${pkgs.stdenv.hostPlatform.system}".nvchad
      ]

      (with pkgs; [
        jdt-language-server
        stylua
        pyright
        lua-language-server
        bash-language-server
        python314Packages.python-lsp-server
        vscode-langservers-extracted

        nixfmt
        nixd
        google-java-format
        alejandra
        black
        python314Packages.autopep8
        python314Packages.autoflake
      ])
    ];
  };
}
