{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/media.nix
    ../../modules/paperless.nix
  ];

  networking.hostName = "asuna";

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-label/storage";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };
}
