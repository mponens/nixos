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
