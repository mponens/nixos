{ pkgs, lib, username, ... } : {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config = {
    allowUnfree = true;
  };
  services.dbus.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  services.syncthing = {
    enable = true;
    user = "${username}";
    dataDir = "/home/${username}/syncthing";
    openDefaultPorts = true;
    extraFlags = [ "--no-default-folder" ];
  };

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
	powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.printing.enable = true;
  environment.systemPackages = with pkgs; [
    vim 
    wget
	alsa-firmware
	alsa-ucm-conf
	alsa-utils
	alsa-lib
	sof-firmware
    pulseaudio #pactl
  ];

}
