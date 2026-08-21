{ config, lib, pkgs, inputs, ... }:

{
  imports = [
      ../../modules/audio.nix
	  ../../modules/av_amd.nix
      ../../modules/bluetooth.nix
      ../../modules/desktop.nix
      ../../modules/fonts.nix
      ../../modules/laptop.nix
      ../../modules/system.nix
      ../../modules/sops.nix

	  ../../modules/fwupd.nix


      ../../modules/extraHosts.nix	
	  ../../modules/extra/openocd.nix
	  ../../modules/extra/udiskie.nix

	  ../../modules/extra/kdeconnect.nix
	  ../../modules/extra/podman.nix
	  ../../modules/extra/virtualisation.nix
      ../../modules/extra/mullvad.nix
	  ../../modules/extra/v2raya.nix
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

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/2018c403-4ad2-4e41-9546-2193fff9db4d";
  boot.kernelParams = [
  	"iommu=pt"
	"no_console_suspend"
  ];

  networking.hostName = "Sakamoto"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Fort_Wayne";
  system.stateVersion = "26.05";

}

