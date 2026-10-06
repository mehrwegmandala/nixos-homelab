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
}
