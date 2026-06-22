{
  self,
  inputs,
  ...
}: {
  flake.homeModules.zen-browser = {
    lib,
    config,
    pkgs,
    ...
  }: let
    cfg_orig = config.programs.zen-browser;

    zen-package =
      (inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta-unwrapped.override {
        policies = cfg_orig.policies;
      }).overrideAttrs
      (prev: {
        postInstall =
          prev.postInstall or ""
          + ''
            chmod -R u+w "$out/lib/zen-bin-${prev.version}"
            cp -r "${inputs.sine-bootloader}/program/"* "$out/lib/zen-bin-${prev.version}"
          '';
      });

    combined_chrome = pkgs.stdenv.mkDerivation {
      pname = "chrome-zen";
      version = "1.0";

      src = inputs.sine;
      src_1 = inputs.nebula-zen;
      src_2 = inputs.sine-bootloader;
      src_3 = inputs.zen-icons;
      src_4 = inputs.zen-context-menu;
      src_5 = inputs.zen-data-loading-bar;

      buildInputs = [pkgs.jq];

      installPhase = ''
        # Installing Sine
        mkdir -p $out/JS
        cp --no-preserve=mode -r $src/{sine.sys.mjs,engine} $out/JS
        cp --no-preserve=mode -r $src_2/profile/utils $src/locales $out

        # Installing Nebula
        mkdir -p $out/sine-mods
        cp --no-preserve=mode -r $src_1 $out/sine-mods/Nebula
        echo "{}" > $out/sine-mods/mods.json
        jq --arg key "Nebula" --slurpfile new $src_1/theme.json  \
        '.[$key] = ($new[0] + {
          "stars": 1233,
          "origin": "store",
          "preferences": "preferences.json",
          "no-updates": false,
          "enabled": true
        })' $out/sine-mods/mods.json > $out/sine-mods/mods.json.tmp

        # installing Zen Icons
        cp --no-preserve=mode -r $src_3 $out/sine-mods/new-icons
        jq --arg key "new-icons" --slurpfile new $src_3/theme.json  \
        '.[$key] = ($new[0] + {
          "stars": 1233,
          "origin": "store",
          "preferences": "",
          "no-updates": false,
          "enabled": true
        })' $out/sine-mods/mods.json.tmp > $out/sine-mods/mods.json.tmp2

        # installing Context Menu Icons
        cp --no-preserve=mode -r $src_4 $out/sine-mods/context-menu-icons
        jq --arg key "context-menu-icons" --slurpfile new $src_4/theme.json  \
        '.[$key] = ($new[0] + {
          "stars": 1233,
          "origin": "store",
          "preferences": "preferences.json",
          "no-updates": false,
          "enabled": true
        })' $out/sine-mods/mods.json.tmp2 > $out/sine-mods/mods.json.tmp3

        # installing Zen Data Loading Bar
        cp --no-preserve=mode -r $src_5 $out/sine-mods/c9ee0d97-d2d6-40fd-8f85-549fe000b868
        jq --arg key "c9ee0d97-d2d6-40fd-8f85-549fe000b868" --slurpfile new $src_5/theme.json  \
        '.[$key] = ($new[0] + {
          "stars": 1233,
          "origin": "store",
          "preferences": "preferences.json",
          "no-updates": false,
          "enabled": true
        })' $out/sine-mods/mods.json.tmp3 > $out/sine-mods/mods.json.tmp4



        rm $out/sine-mods/mods.json.tmp
        rm $out/sine-mods/mods.json.tmp2
        rm $out/sine-mods/mods.json.tmp3
        mv $out/sine-mods/mods.json.tmp4 $out/sine-mods/mods.json
        ln -s $out/sine-mods/Nebula/README.md $out/sine-mods/Nebula/readme.md
        # Modifying Nebula
        cp --no-preserve=mode ${pkgs.nixos-icons}/share/icons/hicolor/1024x1024/apps/nix-snowflake.png $out/sine-mods/Nebula/nebula/modules
        substituteInPlace $out/sine-mods/Nebula/nebula/modules/topbar-buttons.css \
          --replace-fail "url(\"chrome://branding/content/about-logo.svg\")" "url(\"nix-snowflake.png\")" \
          --replace-fail "scale: 1.7;" "scale: 1.5;" \
      '';
    };
  in {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    xdg.configFile = {
      ".zen" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/zen";
        force = true;
      };
      "zen/default/chrome" = {
        force = true;
        source = combined_chrome;
        recursive = true;
      };
    };

    home = {
      file.".zen".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/zen";
      activation.zenTheme = lib.hm.dag.entryAfter ["writeBoundary"] ''
        if [[ ! -z DRY_RUN ]]; then
          echo "@import \"file://${config.xdg.configHome}/zen/default/chrome/sine-mods/Nebula/userChrome.css\";" > ${config.xdg.configHome}/zen/default/chrome/sine-mods/chrome.css
          echo "@import \"file://${config.xdg.configHome}/zen/default/chrome/sine-mods/Nebula/userContent.css\";" > ${config.xdg.configHome}/zen/default/chrome/sine-mods/content.css
        fi
      '';
    };

    programs.zen-browser = {
      enable = true;
      package = (pkgs.wrapFirefox zen-package {icon = "zen-browser";}).override {
        extraPrefs = cfg_orig.extraPrefs;
        extraPrefsFiles = cfg_orig.extraPrefsFiles;
        nativeMessagingHosts = cfg_orig.nativeMessagingHosts;
      };
      profiles.default = {
        isDefault = true;
        search.default = "google";
        sine.enable = true;
        settings = {
          "browser.tabs.allow_transparent_browser" = true;
          "zen.widget.linux.transparency" = true;
          "zen.welcome-screen.seen" = true;
        };
      };
    };
  };
}
