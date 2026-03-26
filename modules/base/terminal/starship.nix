{ inputs, self, ... }: {

  flake.nixosModules.terminal = { lib, pkgs, ... }: {

    programs = {

      starship = {

        enable = true;

        settings = {
          format = "$os $shell $username $hostname $directory $nix_shell\n$character";

          right_format = "$battery";

          character = {
            success_symbol = "[❯](bold green)";
            error_symbol = "[❯](bold red)";
          };

          directory = {
            read_only = "";
            style = "yellow bold";
            format = "[ $path]($style)";
          };

          git_branch = {
            symbol = " ";
            style = "blue bold";
            format = "branch [$symbol$branch]($style) ";
          };

          git_status = {
            format = "[$all_status$ahead_behind]($style) ";
            style = "red bold";
          };

          java = {
            symbol = "";
            style = "red bold";
            format = " via [$symbol $version]($style)";
          };

          nix_shell = {
            symbol = "";
            style = "cyan bold";
            format = "in [$symbol shell]($style)";
          };

          os = {
            format = "[$symbol NixOS](bold cyan)";
            disabled = false;
          };

          os.symbols = {
            NixOS = "";
          };

          python = {
            symbol = " ";
            style = "cyan bold";
            format = "via [$symbol$version]($style) ";
          };

          shell = {
            zsh_indicator = "zsh";
            fish_indicator = "fish";
            nu_indicator = "nushell";
            format = "[󰘳 $indicator](green bold)";
            disabled = false;
          };

          username = {
            style_user = "blue bold";
            style_root = "red bold";
            format = "[ $user]($style)";
            disabled = false;
            show_always = true;
          };
          
          hostname = {
            ssh_only = false;
            style = "purple bold";
            format = "[ $hostname]($style)";
          };
        };
      };
    };
    # Font Packages
    fonts.packages = with pkgs; [
      nerd-fonts.meslo-lg
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      source-han-sans
      corefonts
      vista-fonts
      roboto
      kodiPackages.robotocjksc
    ];
  };
}
