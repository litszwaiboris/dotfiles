{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment = {
      systemPackages = with pkgs; [
        (python314.withPackages (python-pkgs: [
          python-pkgs.tkinter
          python-pkgs.pygame-ce
          python-pkgs.rich
        ]))
      ];
    };
  };
}
