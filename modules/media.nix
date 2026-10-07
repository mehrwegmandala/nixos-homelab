{ pkgs, ... }:

{
  # QuickSync Transcoding für i5-7500 (HD630)
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };

  # Jellyfin
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  users.users.jellyfin.extraGroups = [ "video" "render" ];

  # SABnzbd (...)
  services.sabnzbd = {
    enable = true;
    openFirewall = true;
  };

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
      media = {
        path = "/mnt/storage/media";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0664";
        "directory mask" = "0775";
      };
    };
  };
}
