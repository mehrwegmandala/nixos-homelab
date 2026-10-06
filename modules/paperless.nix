{ ... }:

{
  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    port = 28981;
    mediaDir = "/mnt/storage/paperless/media";
    consumptionDir = "/mnt/storage/paperless/consume";
    settings = {
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      PAPERLESS_OCR_USER_ARGS = builtins.toJSON {
        deskew = true;
        clean = true;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 28981 ];

  # Samba-Freigabe für den Scan- & Drop-Ordner
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "asuna";
        "security" = "user";
        "hosts allow" = "192.168.178. 127.0.0.1";
        "map to guest" = "bad user";
        "guest account" = "nobody";
      };
      paperless-consume = {
        path = "/mnt/storage/paperless/consume";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0664";
        "directory mask" = "0775";
        "force user" = "paperless";
        "force group" = "paperless";
      };
    };
  };
}
