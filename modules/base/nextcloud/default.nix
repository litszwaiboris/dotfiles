{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nextcloud = {
    config,
    pkgs,
    ...
  }: {
    services.logind.lidSwitch = "ignore";
    services.logind.lidSwitchExternalPower = "ignore";

    environment.etc."nextcloud-pass".text = "wia1v7BWcLT1Y@!#";

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud33;
      hostName = "yippie-nextcloud.drake-istrian.ts.net";
      https = true;

      database.createLocally = true;

      configureRedis = true;

      config.adminpassFile = "/etc/nextcloud-pass";
      config.dbtype = "sqlite";
      config.overwriteProtocol = "https";

      extraAppsEnable = true;
      extraApps = {
        inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks;
      };

      settings.trusted_domains = [
        "yippie-nextcloud.drake-istrian.ts.net"
      ];
    };

    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
      enableACME = false;
      sslCertificate = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.crt";
      sslCertificateKey = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.key";

      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }

        {
          addr = "127.0.0.1";
          port = 443;
        }
      ];
    };

    networking.firewall.allowedTCPPorts = [80 443];
  };
}
