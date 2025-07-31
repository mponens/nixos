{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."nixos-lvm" = {
    device = "/dev/disk/by-uuid/9eef8b04-0abb-4680-9d00-b40a6dba53b4";
    preLVM = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  networking.hostName = "IUseArchBTW"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Denver";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
	awesome-wm-widgets
      ];
    };
  };

  services.tlp = {
    enable = true;
    settings = {
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  services.syncthing = {
    enable = true;
    user = "daniel";
    dataDir = "/home/daniel/syncthing";
    openDefaultPorts = true;
    extraFlags = [ "--no-default-folder" ];
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };

  services.displayManager = {
    sddm.enable = true;
    defaultSession = "none+awesome";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.daniel = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
  ];

  system.stateVersion = "24.11";

}

