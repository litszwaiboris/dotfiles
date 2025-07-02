{ config, ... }:

{
  hardware = {
    graphics.enable = true;

    graphics.enable32Bit = true;
  };

  networking = {
    hostName = "libor-P1";
    
    networkmanager.enable = true;
  };
}
