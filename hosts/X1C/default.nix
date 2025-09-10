{ config, lib, pkgs, inputs, ... }:

{
  imports = [
      ../../modules/audio.nix
      ../../modules/bluetooth.nix
      ../../modules/desktop.nix
      ../../modules/fonts.nix
      ../../modules/laptop.nix
      ../../modules/mullvad.nix
      ../../modules/nix_ld.nix
      ../../modules/printing.nix
      ../../modules/ssh.nix
      ../../modules/steam.nix
      ../../modules/syncthing.nix
      ../../modules/system.nix
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."nixos-lvm" = {
    device = "/dev/disk/by-uuid/9eef8b04-0abb-4680-9d00-b40a6dba53b4";
    preLVM = true;
  };

  networking.hostName = "IUseArchBTW"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Fort_Wayne";
  system.stateVersion = "24.11";

}

