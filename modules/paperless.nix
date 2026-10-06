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
}
