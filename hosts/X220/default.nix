{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/audio.nix
    ../../modules/av_intel.nix
    ../../modules/bluetooth.nix
    ../../modules/desktop.nix
    ../../modules/fonts.nix
    ../../modules/laptop.nix
    ../../modules/system.nix
    ../../modules/sops.nix
    ../../modules/extraHosts.nix	

	  ../../modules/extra/udiskie.nix
	  ../../modules/extra/podman.nix
	  ../../modules/extra/virtualisation.nix
    ../../modules/extra/mullvad.nix
    ../../modules/extra/nix_ld.nix
    ../../modules/extra/printing.nix
    ../../modules/extra/ssh.nix
    ../../modules/extra/steam.nix
    ../../modules/extra/syncthing.nix
	  ../../modules/extra/tailscale.nix
	  ../../modules/extra/flatpak.nix
	  ../../modules/extra/xkb.nix
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "IUseNyarchBTW"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Fort_Wayne";
  system.stateVersion = "25.11";

}

