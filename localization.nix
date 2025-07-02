{ pkgs, ... }:

{
  time = {
    timeZone = "America/Toronto";
  };

  i18n = {
    defaultLocale = "fr_CA.UTF-8";

    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ rime anthy ];
    };
    
  };

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true;
  # };
}