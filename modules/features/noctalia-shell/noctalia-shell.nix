{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.noctalia-shell = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      grim
      slurp
      tesseract
      imagemagick
      zbar
      translate-shell
      ffmpeg
      wl-screenrec
      gifski
      gpu-screen-recorder
    ];
  };
}
