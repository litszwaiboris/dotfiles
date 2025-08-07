{ pkgs, ... }:

{
  services = {

    # Localtime
    localtimed.enable = true;

    # Fingerprint
    fprintd.enable = true;
    
    # GNOME Services
    gnome = {
      gnome-user-share.enable = true;
      gnome-remote-desktop.enable = true;
      gnome-keyring.enable = true;
    };

    # Flatpak
    flatpak.enable = true;

    # Login
    displayManager.defaultSession = "gnome";

    # Desktop Environment
    xserver = {
      enable = true;

      excludePackages = with pkgs; [ xterm ];

      desktopManager = {
        pantheon = {
          enable = false;
          extraGSettingsOverrides = ''
          [io.elementary.terminal.settings]
          font='MesloLGS Nerd Font 10'
          '';
          extraGSettingsOverridePackages = [
          pkgs.pantheon.elementary-terminal 
          ];
        };

        gnome.enable = true;
      };

      # Login
      displayManager = {
        lightdm = {
          enable = false;
          greeters.pantheon.enable = true;
        };

	      gdm = {
          enable = true;
	        wayland = true;
	      };
      };
    
    # Unused options
    # videoDrivers = [ "nvidia" ];
    # xkb.layout = "us";
    # xkb.options = "eurosign:e,caps:escape";
    };

    # CUPS Printing
    printing = {
      enable = true;
      drivers = [ pkgs.cnijfilter2 ];
    };

    # Sound
    pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
      
      extraConfig.pipewire = {
        "10-sampling-rate" = {
          "context.properties" = {
            "default.clock.rate" = 96000;
            "default.clock.allowed-rates" = "[ 48000 44100 96000 192000 ]";
          };
        };
      };
    };

    # Trackpad
    libinput = {
      enable = true;
    };
  };
}
