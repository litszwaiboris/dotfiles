{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      mypy
      nixd
      nixfmt
      python314Packages.debugpy
      python314Packages.pylance
      pylint

      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          jnoortheen.nix-ide

          ms-python.python
          ms-python.debugpy
          ms-python.pylint
          ms-python.vscode-pylance
          ms-python.mypy-type-checker

          vscjava.vscode-java-pack
          redhat.java
          oracle.oracle-java

          ms-vscode.cpptools

          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons

          sumneko.lua
        ];
      })
    ];
  };
}
